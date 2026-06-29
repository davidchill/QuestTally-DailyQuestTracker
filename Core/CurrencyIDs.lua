-- CurrencyIDs.lua -- baked currency NAME -> Blizzard currencyID lookup.
--
-- WHY: baked currency rewards (QuestRewards.lua `cu={{n=..,ct=..}}`) ship only a
-- name and amount, no icon -- unlike item rewards, which bake an icon file ID.
-- So a not-in-log quest's currency rewards render as bare text. The live quest
-- API supplies a currency icon only when the quest is in your log; for everything
-- else we resolve the icon at render time from the currency ID via C_CurrencyInfo
-- (see DetailPanel.currencyIcon). Icon file IDs are better fetched live than baked
-- (Blizzard occasionally re-arts a currency), so we bake only the stable ID here.
--
-- Generated from the first-party Blizzard Game Data quest-reward cache
-- (rewards.currency[].reward.{name,id}); see _generator/build-currency-ids.js.
-- Covers every currency our catalog rewards (23 currencies). Regenerate if the
-- catalog gains new currency rewards.
local _, DT = ...

DT.CurrencyIDs = {
    ["Apexis Crystal"]                   = 823,
    ["Argent Commendation"]              = 1754,
    ["Champion's Seal"]                  = 241,
    ["Conquest"]                         = 1602,
    ["Corrupted Mementos"]               = 1719,
    ["Dalaran Jewelcrafter's Token"]     = 61,
    ["Dragon Isles Supplies"]            = 2003,
    ["Dream Infusion"]                   = 2777,
    ["Elemental Overflow"]               = 2118,
    ["Epicurean's Award"]                = 81,
    ["Flightstones"]                     = 2245,
    ["Garrison Resources"]               = 824,
    ["Grateful Offering"]                = 1885,
    ["Illusionary Coin"]                 = 3393,
    ["Illustrious Jewelcrafter's Token"] = 361,
    ["Ironpaw Token"]                    = 402,
    ["Lesser Charm of Good Fortune"]     = 738,
    ["Mark of the World Tree"]           = 416,
    ["Oil"]                              = 1101,
    ["Paracausal Flakes"]                = 2594,
    ["Soridormi's Recognition"]          = 2645,
    ["Timeless Coin"]                    = 777,
    ["Tol Barad Commendation"]           = 391,
}
