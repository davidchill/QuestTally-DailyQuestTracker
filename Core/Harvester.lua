-- Harvester.lua
-- First-party quest-data harvester. Builds QuestTally's catalog and reward data
-- straight from the player's own game client -- no third-party datasets.
--
-- WHY THIS EXISTS
-- Retail does NOT ship quest titles, the daily/weekly flag, or reward lists in
-- any static file (verified against the live DB2 set: the retail `Quest` and
-- `QuestSparse` tables don't exist -- `QuestV2` is just an ID registry). That
-- data is streamed from the server into the client on demand. So the only
-- complete, first-party source is the client itself: once a quest's data is
-- loaded, the in-game API exposes its title, rewards, and objectives.
--
-- WHAT IT DOES
--   * Discover: scan a raw quest-id RANGE, read each title, and recognize
--               dailies by matching the title against the checklist (the curated
--               "which quests are dailies" list). This builds the shippable
--               catalog from scratch, first-party, with no external quest IDs.
--   * Enrich:  for every KNOWN daily id (learned live + catalog), ask the server
--              to load it (throttled), then bake title/rewards/objectives.
--   * Sweep:   enumerate active world quests via C_TaskQuest (inherently
--              repeatable) and learn any we haven't seen.
--   * Export:  emit baked Lua (catalog + rewards) ready to ship in the addon.
--
-- WHY A CHECKLIST IS STILL NEEDED
--   The client can't classify an arbitrary id as "daily" unless the quest is in
--   your log/gossip. So discovery matches loaded titles against the curated daily
--   NAME list in ChecklistData.lua -- that membership knowledge isn't in any API.
--   Everything else (real ids, rewards, objectives) is read first-party here.
--
-- DEV-SIDE TOOL: these crawls are meant to be run by the developer to GENERATE
-- the baked data that ships in the addon. End users never run them.
local addonName, DT = ...

DT.Harvester = {}
local H = DT.Harvester

-- Tunables. Conservative on purpose: RequestLoadQuestByID hits the server, and
-- flooding it risks a disconnect. ~12 requests/sec is gentle and still clears a
-- few thousand candidates in minutes.
local BATCH_SIZE      = 3      -- ids requested per tick
local TICK_PERIOD     = 0.25   -- seconds between ticks (=> ~12 ids/sec)
local SETTLE_DELAY    = 0.10   -- grace after a load result before reading data
local MAX_PENDING     = 25     -- backpressure: never have more than this in flight
local PENDING_TIMEOUT = 5      -- secs before an unanswered request is given up on

-- Upper bound for a "full scan". Retail quest ids run from 1 to roughly here as
-- of Midnight (12.0); bump this as new content pushes ids higher.
local MAX_QUEST_ID    = 95000

-- Runtime state for an in-progress crawl.
--   mode = "enrich"   -> queue holds KNOWN daily ids; capture each.
--   mode = "discover" -> queue holds a raw id range; keep only titles that
--                        match the daily checklist, then capture those.
local crawl = {
    active   = false,
    mode     = "enrich",
    queue    = {},   -- array of questIDs still to request
    pending  = {},   -- [questID] = GetTime() it was requested (for expiry)
    pendingCount = 0,
    ticker   = nil,
    total    = 0,
    done     = 0,
    captured = 0,
    skipped  = 0,
    matched  = 0,    -- discover mode: titles matched to the checklist
    worldquests = 0, -- discover mode: ids flagged as world quests
}

-- Checklist side letter -> faction word, for stamping discovered dailies.
local SIDE_WORD = { A = "Alliance", H = "Horde", B = "Both" }

-- One frame listens for async "quest data ready" events for the crawl.
local loader = CreateFrame("Frame")

-- ---------------------------------------------------------------------------
-- Reward reading. Mirrors DetailPanel's live read, but returns a plain data
-- table instead of rendering. Every call is guarded: the reward API shifts
-- between patches, and a missing function should skip a field, not error.
-- ---------------------------------------------------------------------------
local function readRewards(questID)
    local r = {}

    -- Choice rewards ("pick one of"). Only keep the list if it has real entries;
    -- a count > 0 with all-nil names means the reward text hadn't streamed in.
    local numChoices = GetNumQuestLogChoices and GetNumQuestLogChoices(questID) or 0
    if numChoices > 0 then
        local list = {}
        for i = 1, numChoices do
            local name, texture, numItems, quality = GetQuestLogChoiceInfo(i, questID)
            if name then
                list[#list + 1] = { name = name, icon = texture, count = numItems or 1, quality = quality }
            end
        end
        if #list > 0 then r.choices = list end
    end

    -- Guaranteed item rewards.
    local numRewards = GetNumQuestLogRewards and GetNumQuestLogRewards(questID) or 0
    if numRewards > 0 then
        local list = {}
        for i = 1, numRewards do
            local name, texture, numItems, quality = GetQuestLogRewardInfo(i, questID)
            if name then
                list[#list + 1] = { name = name, icon = texture, count = numItems or 1, quality = quality }
            end
        end
        if #list > 0 then r.items = list end
    end

    -- Currencies (valor, marks, tokens, ...).
    local numCurr = GetNumQuestLogRewardCurrencies and GetNumQuestLogRewardCurrencies(questID) or 0
    if numCurr > 0 then
        local list = {}
        for i = 1, numCurr do
            local name, texture, numItems = GetQuestLogRewardCurrencyInfo(i, questID)
            if name then
                list[#list + 1] = { name = name, icon = texture, count = numItems or 1 }
            end
        end
        if #list > 0 then r.currencies = list end
    end

    local money = GetQuestLogRewardMoney and GetQuestLogRewardMoney(questID) or 0
    local xp    = GetQuestLogRewardXP and GetQuestLogRewardXP(questID) or 0
    local honor = GetQuestLogRewardHonor and GetQuestLogRewardHonor(questID) or 0
    if money > 0 then r.money = money end
    if xp > 0 then r.xp = xp end
    if honor > 0 then r.honor = honor end

    -- Nothing found at all -> return nil so we don't persist an empty husk.
    if not (r.choices or r.items or r.currencies or r.money or r.xp or r.honor) then
        return nil
    end
    return r
end

local function readObjectives(questID)
    if not (C_QuestLog and C_QuestLog.GetQuestObjectives) then return nil end
    local objs = C_QuestLog.GetQuestObjectives(questID)
    if not objs or #objs == 0 then return nil end
    local out = {}
    for _, o in ipairs(objs) do
        if o and o.text and o.text ~= "" then
            -- Skip objectives that are only a "0/1 " progress prefix with no
            -- description -- the text hadn't streamed in when we captured.
            local desc = o.text:gsub("^%s*%d+/%d+%s*", ""):gsub("%s+", "")
            if desc ~= "" then
                out[#out + 1] = o.text
            end
        end
    end
    return (#out > 0) and out or nil
end

-- ---------------------------------------------------------------------------
-- Capture: read everything the client knows about a loaded quest and persist it
-- into the account-wide `learned` store. Returns true if any data was baked.
-- ---------------------------------------------------------------------------
function H:CaptureQuest(questID)
    if not questID or questID <= 0 then return false end
    -- Reward data must actually be present, or the reads return blanks.
    if HaveQuestRewardData and not HaveQuestRewardData(questID) then return false end

    local now = GetServerTime and GetServerTime() or (time and time()) or nil
    local title = C_QuestLog and C_QuestLog.GetTitleForQuestID
        and C_QuestLog.GetTitleForQuestID(questID) or nil

    -- Make sure a learned record exists (CaptureQuest may run for catalog ids
    -- the live learner never saw). Faction/map stay nil unless we learn them.
    DT.DB:LearnDaily(questID, title, nil, nil, now)

    local rewards = readRewards(questID)
    local objectives = readObjectives(questID)
    DT.DB:SetQuestDetails(questID, {
        title      = title,
        rewards    = rewards,
        objectives = objectives,
        harvested  = now,
    })
    return rewards ~= nil or objectives ~= nil or title ~= nil
end

-- ---------------------------------------------------------------------------
-- World-quest sweep. Active WQs are inherently repeatable and fully
-- enumerable from the client. We learn every one currently active across the
-- maps we know about, so they enter the catalog without the player visiting.
-- ---------------------------------------------------------------------------
local function collectKnownMapIDs()
    local maps = {}
    -- Maps referenced by anything we already track are good sweep targets.
    DT.DB:ForEachLearned(function(_, info)
        if info.mapID then maps[info.mapID] = true end
    end)
    -- Plus whatever map the player is on right now.
    local here = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
    if here then maps[here] = true end
    return maps
end

function H:SweepWorldQuests()
    if not (C_TaskQuest and C_TaskQuest.GetQuestsForPlayerByMapID) then
        return 0, "World-quest API unavailable on this client."
    end
    local now = GetServerTime and GetServerTime() or nil
    local faction = UnitFactionGroup and UnitFactionGroup("player") or nil
    local learnedNew = 0

    for mapID in pairs(collectKnownMapIDs()) do
        local tasks = C_TaskQuest.GetQuestsForPlayerByMapID(mapID)
        if type(tasks) == "table" then
            for _, t in ipairs(tasks) do
                local qid = t.questId or t.questID
                if qid and qid > 0 then
                    local title = C_QuestLog and C_QuestLog.GetTitleForQuestID
                        and C_QuestLog.GetTitleForQuestID(qid) or nil
                    if DT.DB:LearnDaily(qid, title, faction, mapID, now) then
                        learnedNew = learnedNew + 1
                    end
                    -- Try an immediate enrich; data is usually already cached
                    -- for on-map WQs.
                    self:CaptureQuest(qid)
                end
            end
        end
    end
    return learnedNew
end

-- ---------------------------------------------------------------------------
-- Targeted enrichment crawl over a set of KNOWN daily ids.
-- ---------------------------------------------------------------------------

-- Gather the candidate id set: everything we already consider a daily.
local function gatherCandidates()
    local set = {}
    DT.DB:ForEachLearned(function(questID) set[questID] = true end)
    DT.QuestData:ForEach(function(questID) set[questID] = true end)
    local list = {}
    for id in pairs(set) do list[#list + 1] = id end
    return list
end

-- Classify a loaded quest for discovery. Two first-party ways to recognize
-- trackable content, no third-party data:
--   "daily"      -> title matches the curated checklist (classic-style dailies)
--   "worldquest" -> C_QuestLog.IsWorldQuest flags it (modern Legion+ content,
--                   which has no curated list and doesn't need one)
-- Returns (kind, title, checklistEntry) or (nil, title) if it's neither.
local function classifyDiscovered(questID)
    local title = C_QuestLog and C_QuestLog.GetTitleForQuestID
        and C_QuestLog.GetTitleForQuestID(questID) or nil
    if not title or title == "" then return nil, nil end

    local entry = DT.Checklist and DT.Checklist:FindByTitle(title) or nil
    if entry then return "daily", title, entry end

    if C_QuestLog and C_QuestLog.IsWorldQuest and C_QuestLog.IsWorldQuest(questID) then
        return "worldquest", title
    end
    return nil, title
end

-- A quest's data is ready (from cache or a load result). Do the mode-appropriate
-- work and update counters. In discover mode we keep checklist matches and world
-- quests; everything else is counted as skipped and not stored.
local function handleReady(questID)
    if crawl.mode == "discover" then
        local kind, title, entry = classifyDiscovered(questID)
        if not kind then
            crawl.skipped = crawl.skipped + 1
            return
        end
        local now = GetServerTime and GetServerTime() or (time and time()) or nil
        local mapID = C_QuestLog and C_QuestLog.GetQuestUiMapID
            and C_QuestLog.GetQuestUiMapID(questID) or nil
        mapID = (mapID and mapID > 0) and mapID or nil

        if kind == "daily" then
            crawl.matched = crawl.matched + 1
            DT.DB:LearnDaily(questID, title, SIDE_WORD[entry.side] or "Both", mapID, now)
        else  -- worldquest: faction-agnostic, no checklist metadata
            crawl.worldquests = crawl.worldquests + 1
            DT.DB:LearnDaily(questID, title, nil, mapID, now)
        end
        DT.DB:SetQuestKind(questID, kind)
        if H:CaptureQuest(questID) then crawl.captured = crawl.captured + 1 end
    else
        -- enrich mode: id is already a known daily.
        if H:CaptureQuest(questID) then crawl.captured = crawl.captured + 1
        else crawl.skipped = crawl.skipped + 1 end
    end
end

-- Drop requests that have been waiting too long. The server silently ignores
-- ids for quests that don't exist (common when scanning a raw range), so without
-- this their slots would never free and the crawl would wedge at MAX_PENDING.
local function expireStalePending(now)
    for id, t in pairs(crawl.pending) do
        if now - t > PENDING_TIMEOUT then
            crawl.pending[id] = nil
            crawl.pendingCount = crawl.pendingCount - 1
            crawl.skipped = crawl.skipped + 1
            crawl.done = crawl.done + 1
        end
    end
end

local function processTick()
    if not crawl.active then return end
    local now = GetTime and GetTime() or 0

    expireStalePending(now)

    -- Fire new requests, but only up to BATCH_SIZE per tick AND only while we're
    -- under the in-flight cap, so a slow/unresponsive server applies backpressure
    -- instead of letting outstanding requests pile up without bound.
    local fired = 0
    while fired < BATCH_SIZE and #crawl.queue > 0 and crawl.pendingCount < MAX_PENDING do
        local questID = table.remove(crawl.queue)
        if HaveQuestRewardData and HaveQuestRewardData(questID) then
            -- Already cached -> handle immediately, no server round-trip.
            handleReady(questID)
            crawl.done = crawl.done + 1
        elseif C_QuestLog and C_QuestLog.RequestLoadQuestByID then
            crawl.pending[questID] = now
            crawl.pendingCount = crawl.pendingCount + 1
            C_QuestLog.RequestLoadQuestByID(questID)
        else
            crawl.skipped = crawl.skipped + 1
            crawl.done = crawl.done + 1
        end
        fired = fired + 1
    end

    -- Done when the queue is drained and nothing is still pending.
    if #crawl.queue == 0 and crawl.pendingCount <= 0 then
        H:Stop()
    end
end

-- Async load results: when a pending id's data lands, capture it.
loader:SetScript("OnEvent", function(_, event, questID, success)
    if event ~= "QUEST_DATA_LOAD_RESULT" then return end
    if not crawl.pending[questID] then return end
    crawl.pending[questID] = nil
    crawl.pendingCount = crawl.pendingCount - 1
    crawl.done = crawl.done + 1
    if success then
        -- Small settle so reward/title APIs are populated before we read.
        C_Timer.After(SETTLE_DELAY, function() handleReady(questID) end)
    else
        crawl.skipped = crawl.skipped + 1
    end
end)

-- Shared launcher for both crawl modes. Resets counters, queues `ids`, and
-- starts the throttled ticker. Returns the number of ids queued.
local function beginCrawl(ids, mode)
    crawl.active   = true
    crawl.mode     = mode
    crawl.queue    = ids
    crawl.pending  = {}
    crawl.pendingCount = 0
    crawl.total    = #ids
    crawl.done     = 0
    crawl.captured = 0
    crawl.skipped  = 0
    crawl.matched  = 0
    crawl.worldquests = 0

    loader:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    crawl.ticker = C_Timer.NewTicker(TICK_PERIOD, processTick)
    return crawl.total
end

-- Rough wall-clock estimate (seconds) for a queue of n ids at the current rate.
local function etaSeconds(n)
    return math.ceil(n / (BATCH_SIZE / TICK_PERIOD))
end

-- Enrich mode: re-read title/rewards/objectives for every KNOWN daily id.
-- `ids` is an optional explicit array; defaults to all known daily candidates.
function H:Start(ids)
    if crawl.active then
        print("|cff33ff99QuestTally|r: a harvest is already running. /qt harvest stop to cancel.")
        return 0
    end
    ids = ids or gatherCandidates()
    if #ids == 0 then
        print("|cff33ff99QuestTally|r: no known dailies to enrich yet. Run |cffffd100/qt harvest discover|r first.")
        return 0
    end
    beginCrawl(ids, "enrich")
    print(string.format("|cff33ff99QuestTally|r: enriching %d known dailies "
        .. "(~%ds). |cffffd100/qt harvest status|r for progress.",
        crawl.total, etaSeconds(crawl.total)))
    return crawl.total
end

-- Discover mode: scan a raw quest-id RANGE, recognize dailies by matching each
-- title against the checklist, and bake the matches. This is the dev-side
-- engine that builds the shippable catalog first-party, with no external IDs.
-- Defaults to a broad retail range if not given; run in chunks for big spans.
function H:StartRange(from, to)
    if crawl.active then
        print("|cff33ff99QuestTally|r: a harvest is already running. /qt harvest stop to cancel.")
        return 0
    end
    from = math.max(1, math.floor(tonumber(from) or 1))
    to   = math.floor(tonumber(to) or 100000)
    if to < from then from, to = to, from end

    local ids = {}
    -- Build descending so table.remove (from the end) processes ascending.
    for id = to, from, -1 do ids[#ids + 1] = id end

    beginCrawl(ids, "discover")
    print(string.format("|cff33ff99QuestTally|r: discovering dailies in ids %d-%d "
        .. "(%d ids, ~%dm). This is a dev-side scan; |cffffd100/qt harvest status|r for progress.",
        from, to, crawl.total, math.ceil(etaSeconds(crawl.total) / 60)))
    return crawl.total
end

-- Full scan: discover across the entire retail quest-id space in one go. This is
-- the "one button" path -- it just runs StartRange over 1..MAX_QUEST_ID. The
-- crawl saves results into SavedVariables as it goes, so it's safe to walk away;
-- if interrupted, re-running simply re-covers the range (re-learning is cheap).
function H:StartFullScan()
    return self:StartRange(1, MAX_QUEST_ID)
end

-- Exposed so the UI can show the full-scan size/estimate without duplicating it.
function H:GetFullScanInfo()
    return MAX_QUEST_ID, math.ceil(etaSeconds(MAX_QUEST_ID) / 60)  -- maxID, ~minutes
end

function H:Stop()
    if crawl.ticker then crawl.ticker:Cancel(); crawl.ticker = nil end
    loader:UnregisterEvent("QUEST_DATA_LOAD_RESULT")
    local wasActive = crawl.active
    crawl.active = false
    crawl.queue = {}
    crawl.pending = {}
    crawl.pendingCount = 0
    if wasActive then
        if crawl.mode == "discover" then
            print(string.format("|cff33ff99QuestTally|r: discovery complete. "
                .. "|cff66cc66%d dailies|r + |cff66ccff%d world quests|r found "
                .. "(%d with rewards baked) out of %d ids scanned.",
                crawl.matched, crawl.worldquests, crawl.captured, crawl.total))
        else
            print(string.format("|cff33ff99QuestTally|r: harvest complete. "
                .. "|cff66cc66%d enriched|r, %d had no data, %d total.",
                crawl.captured, crawl.skipped, crawl.total))
        end
    end
end

function H:Status()
    if not crawl.active then
        return print("|cff33ff99QuestTally|r: no harvest running. /qt harvest start (or discover) to begin.")
    end
    local pend = 0
    for _ in pairs(crawl.pending) do pend = pend + 1 end
    if crawl.mode == "discover" then
        print(string.format("|cff33ff99QuestTally|r discover: %d/%d scanned "
            .. "(|cff66cc66%d dailies|r, |cff66ccff%d WQs|r, %d baked, %d queued).",
            crawl.done, crawl.total, crawl.matched, crawl.worldquests, crawl.captured, #crawl.queue))
    else
        print(string.format("|cff33ff99QuestTally|r harvest: %d/%d processed "
            .. "(|cff66cc66%d enriched|r, %d empty, %d waiting, %d queued).",
            crawl.done, crawl.total, crawl.captured, crawl.skipped, pend, #crawl.queue))
    end
end

function H:IsRunning()
    return crawl.active
end

-- Snapshot of crawl progress for the UI panel (so it can show live status
-- without printing to chat). Always returns a table.
function H:GetProgress()
    local pend = 0
    for _ in pairs(crawl.pending) do pend = pend + 1 end
    return {
        active   = crawl.active,
        mode     = crawl.mode,
        done     = crawl.done,
        total    = crawl.total,
        queued   = #crawl.queue,
        pending  = pend,
        captured = crawl.captured,
        skipped  = crawl.skipped,
        matched  = crawl.matched,
        worldquests = crawl.worldquests,
    }
end

-- ---------------------------------------------------------------------------
-- Export: serialize the harvested catalog to ship-ready Lua. Keys are kept
-- short to keep the emitted file compact. The format loads into DT.BakedDetails,
-- which the detail panel can read as a fallback when live data isn't cached.
--   b[questID] = { n=name, f=faction, m=mapID,
--                  r = { c={choices}, i={items}, cu={currencies}, mo, xp, ho } }
--   each reward item = { n=name, q=quality, ct=count, ic=iconFileID }
-- ---------------------------------------------------------------------------
local function q(s)  -- quote+escape a Lua string literal
    return '"' .. tostring(s):gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", " ") .. '"'
end

local function serializeRewardList(list)
    local parts = {}
    for _, it in ipairs(list) do
        local f = { "n=" .. q(it.name) }
        if it.quality then f[#f + 1] = "q=" .. it.quality end
        if it.count and it.count ~= 1 then f[#f + 1] = "ct=" .. it.count end
        if it.icon then f[#f + 1] = "ic=" .. it.icon end
        parts[#parts + 1] = "{" .. table.concat(f, ",") .. "}"
    end
    return "{" .. table.concat(parts, ",") .. "}"
end

local function serializeRewards(r)
    local f = {}
    if r.choices then f[#f + 1] = "c=" .. serializeRewardList(r.choices) end
    if r.items then f[#f + 1] = "i=" .. serializeRewardList(r.items) end
    if r.currencies then f[#f + 1] = "cu=" .. serializeRewardList(r.currencies) end
    if r.money then f[#f + 1] = "mo=" .. r.money end
    if r.xp then f[#f + 1] = "xp=" .. r.xp end
    if r.honor then f[#f + 1] = "ho=" .. r.honor end
    return "{" .. table.concat(f, ",") .. "}"
end

-- Build the full Lua file text. Returns the string and the number of entries.
function H:BuildExport()
    local rows, count = {}, 0
    -- Stable order by questID so diffs are clean between exports.
    local ids = {}
    DT.DB:ForEachLearned(function(questID) ids[#ids + 1] = questID end)
    table.sort(ids)

    for _, id in ipairs(ids) do
        local info = DT.DB.account.learned[id]
        local d = info.details
        if d and (d.rewards or d.title or d.description) then
            local fields = {}
            local name = d.title or info.name
            if name then fields[#fields + 1] = "n=" .. q(name) end
            if info.faction then fields[#fields + 1] = "f=" .. q(info.faction) end
            if info.mapID then fields[#fields + 1] = "m=" .. info.mapID end
            if d.rewards then fields[#fields + 1] = "r=" .. serializeRewards(d.rewards) end
            if d.description then fields[#fields + 1] = "de=" .. q(d.description) end
            rows[#rows + 1] = string.format("b[%d]={%s}", id, table.concat(fields, ","))
            count = count + 1
        end
    end

    local header = "-- QuestRewards.lua  (AUTO-GENERATED by /qt harvest export -- do not edit by hand)\n"
        .. "-- Baked quest titles + rewards harvested first-party from the live game client.\n"
        .. "-- Loads into DT.BakedDetails; the detail panel reads this when live data isn't cached.\n"
        .. "local _, DT = ...\n"
        .. "DT.BakedDetails = DT.BakedDetails or {}\n"
        .. "local b = DT.BakedDetails\n"
    return header .. table.concat(rows, "\n") .. "\n", count
end

-- A reusable read-only multiline box for copying generated text out of the game.
local exportFrame
local function showCopyBox(text, subtitle)
    if not exportFrame then
        local f = CreateFrame("Frame", "QuestTallyExportFrame", UIParent, "BackdropTemplate")
        f:SetSize(560, 420)
        f:SetPoint("CENTER")
        f:SetFrameStrata("DIALOG")
        f:EnableMouse(true)
        f:SetMovable(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        if f.SetBackdrop then
            f:SetBackdrop({
                bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
                edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
                tile = true, tileSize = 32, edgeSize = 32,
                insets = { left = 8, right = 8, top = 8, bottom = 8 },
            })
        end

        f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        f.title:SetPoint("TOP", 0, -14)
        f.title:SetText("QuestTally Export")

        f.sub = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
        f.sub:SetPoint("TOP", f.title, "BOTTOM", 0, -4)

        f.hint = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        f.hint:SetPoint("BOTTOMLEFT", 16, 14)
        f.hint:SetText("Press Ctrl+A then Ctrl+C to copy. Save into Core\\QuestRewards.lua.")

        f.close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
        f.close:SetPoint("TOPRIGHT", -4, -4)

        local scroll = CreateFrame("ScrollFrame", "QuestTallyExportScroll", f, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 16, -56)
        scroll:SetPoint("BOTTOMRIGHT", -32, 34)
        local edit = CreateFrame("EditBox", nil, scroll)
        edit:SetMultiLine(true)
        edit:SetFontObject("ChatFontNormal")
        edit:SetAutoFocus(false)
        edit:SetWidth(500)
        edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
        scroll:SetScrollChild(edit)
        f.edit = edit
        exportFrame = f
    end

    exportFrame.sub:SetText(subtitle or "")
    exportFrame.edit:SetText(text)
    exportFrame.edit:HighlightText()
    exportFrame:Show()
    exportFrame.edit:SetFocus()
end

function H:Export()
    local text, count = self:BuildExport()
    if count == 0 then
        print("|cff33ff99QuestTally|r: nothing to export yet -- run |cffffd100/qt harvest start|r first.")
        return
    end
    showCopyBox(text, count .. " quests with baked rewards/details")
    print(string.format("|cff33ff99QuestTally|r: exported %d quests. The data also "
        .. "persists in your SavedVariables (QuestTallyDB.learned) for the build tool.", count))
end
