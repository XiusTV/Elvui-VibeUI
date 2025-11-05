-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2010 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
-- 
-- Gem information
------------------------------------------------------------


-- Gem table row format:
-- { ItemID, Class, Red, Yellow, Blue, "Stat1" Quantity1, "Stat2", Quantity2 }
-- 	ItemID: The item ID of this gem.
-- 	Red: Is this gem red?
-- 	Yellow: Is this gem yellow?
-- 	Blue: Is this gem blue?
--	"Stat": The stat that this gem gives.
--	Quantity: How much of the stat that the gem gives.


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
PawnGemData70Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ 23095, true, false, false, "Strength", 6 }, -- Bold Blood Garnet
{ 23097, true, false, false, "Agility", 6 }, -- Delicate Blood Garnet
{ 28595, true, false, false, "Ap", 12 }, -- Bright Blood Garnet
{ 23096, true, false, false, "SpellPower", 7 }, -- Runed Blood Garnet
-- { 39907, true, false, false, "DodgeRating", 6 }, -- Subtle Blood Garnet
-- { 39908, true, false, false, "ParryRating", 6 }, -- Flashing Blood Garnet
-- { 39909, true, false, false, "ArmorPenetration", 6 }, -- Fractured Blood Garnet
-- { 39910, true, false, false, "ExpertiseRating", 6 }, -- Precise Blood Garnet


-- ------------------------------------------------------------
-- -- Orange gems
-- ------------------------------------------------------------

-- { 39946, true, true, false, "SpellPower", 7, "Intellect", 6 }, -- Luminous Huge Citrine
-- { 39947, true, true, false, "Strength", 6, "CritRating", 6 }, -- Inscribed Huge Citrine
-- { 39948, true, true, false, "Strength", 6, "HitRating", 6 }, -- Etched Huge Citrine
-- { 39949, true, true, false, "Strength", 6, "DefenseRating", 6 }, -- Champion's Huge Citrine
-- { 39950, true, true, false, "Strength", 6, "ResilienceRating", 6 }, -- Resplendent Huge Citrine
-- { 39951, true, true, false, "Strength", 6, "HasteRating", 6 }, -- Fierce Huge Citrine
-- { 39952, true, true, false, "Agility", 6, "CritRating", 6 }, -- Deadly Huge Citrine
-- { 39953, true, true, false, "Agility", 6, "HitRating", 6 }, -- Glinting Huge Citrine
-- { 39954, true, true, false, "Agility", 6, "ResilienceRating", 6 }, -- Lucent Huge Citrine
-- { 39955, true, true, false, "Agility", 6, "HasteRating", 6 }, -- Deft Huge Citrine
-- { 39956, true, true, false, "SpellPower", 7, "CritRating", 6 }, -- Potent Huge Citrine
-- { 39957, true, true, false, "SpellPower", 7, "HitRating", 6 }, -- Veiled Huge Citrine
-- { 39958, true, true, false, "SpellPower", 7, "ResilienceRating", 6 }, -- Durable Huge Citrine
-- { 39959, true, true, false, "SpellPower", 7, "HasteRating", 6 }, -- Reckless Huge Citrine
-- { 39960, true, true, false, "Ap", 12, "CritRating", 6 }, -- Wicked Huge Citrine
-- { 39961, true, true, false, "Ap", 12, "HitRating", 6 }, -- Pristine Huge Citrine
-- { 39962, true, true, false, "Ap", 12, "ResilienceRating", 6 }, -- Empowered Huge Citrine
-- { 39963, true, true, false, "Ap", 12, "HasteRating", 6 }, -- Stark Huge Citrine
-- { 39964, true, true, false, "DodgeRating", 6, "DefenseRating", 6 }, -- Stalwart Huge Citrine
-- { 39965, true, true, false, "ParryRating", 6, "DefenseRating", 6 }, -- Glimmering Huge Citrine
-- { 39966, true, true, false, "ExpertiseRating", 6, "HitRating", 6 }, -- Accurate Huge Citrine
-- { 39967, true, true, false, "ExpertiseRating", 6, "DefenseRating", 6 }, -- Resolute Huge Citrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ 23113, false, true, false, "Intellect", 6 }, -- Brilliant Golden Draenite
{ 28290, false, true, false, "CritRating", 6 }, -- Smooth Golden Draenite
{ 23116, false, true, false, "HitRating", 6 }, -- Rigid Golden Draenite
{ 23115, false, true, false, "DefenseRating", 6 }, -- Thick Golden Draenite
-- { 39917, false, true, false, "ResilienceRating", 12 }, -- Mystic Golden Draenite
-- { 39918, false, true, false, "HasteRating", 12 }, -- Quick Golden Draenite


-- ------------------------------------------------------------
-- -- Green gems
-- ------------------------------------------------------------

-- { 39968, false, true, true, "Intellect", 6, "Stamina", 9 }, -- Timeless Dark Jade
-- { 39974, false, true, true, "CritRating", 6, "Stamina", 9 }, -- Jagged Dark Jade
-- { 39975, false, true, true, "HitRating", 6, "Stamina", 9 }, -- Vivid Dark Jade
-- { 39976, false, true, true, "DefenseRating", 6, "Stamina", 9 }, -- Enduring Dark Jade
-- { 39977, false, true, true, "ResilienceRating", 6, "Stamina", 9 }, -- Steady Dark Jade
-- { 39978, false, true, true, "HasteRating", 6, "Stamina", 9 }, -- Forceful Dark Jade
-- { 39979, false, true, true, "Intellect", 6, "Spirit", 6 }, -- Seer's Dark Jade
-- { 39980, false, true, true, "CritRating", 6, "Spirit", 6 }, -- Misty Dark Jade
-- { 39981, false, true, true, "HitRating", 6, "Spirit", 6 }, -- Shining Dark Jade
-- { 39982, false, true, true, "ResilienceRating", 6, "Spirit", 6 }, -- Turbid Dark Jade
-- { 39983, false, true, true, "HasteRating", 6, "Spirit", 6 }, -- Intricate Dark Jade
-- { 39984, false, true, true, "Intellect", 6, "Mp5", 3 }, -- Dazzling Dark Jade
-- { 39985, false, true, true, "CritRating", 6, "Mp5", 3 }, -- Sundered Dark Jade
-- { 39986, false, true, true, "HitRating", 6, "Mp5", 3 }, -- Lambent Dark Jade
-- { 39988, false, true, true, "ResilienceRating", 6, "Mp5", 3 }, -- Opaque Dark Jade
-- { 39989, false, true, true, "HasteRating", 6, "Mp5", 3 }, -- Energized Dark Jade
-- { 39990, false, true, true, "CritRating", 6, "SpellPenetration", 8 }, -- Radiant Dark Jade
-- { 39991, false, true, true, "HitRating", 6, "SpellPenetration", 8 }, -- Tense Dark Jade
-- { 39992, false, true, true, "HasteRating", 6, "SpellPenetration", 8 }, -- Shattered Dark Jade


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ 23118, false, false, true, "Stamina", 9 }, -- Solid Chalcedony
{ 23119, false, false, true, "Spirit", 6 }, -- Sparkling Chalcedony
{ 23121, false, false, true, "Mp5", 3 }, -- Lustrous Chalcedony
{ 23120, false, false, true, "SpellPenetration", 8 }, -- Stormy Chalcedony


-- ------------------------------------------------------------
-- -- Purple gems
-- ------------------------------------------------------------

-- { 39933, true, false, true, "ArmorPenetration", 6, "Stamina", 9 }, -- Puissant Shadow Crystal
-- { 39934, true, false, true, "Strength", 6, "Stamina", 9 }, -- Sovereign Shadow Crystal
-- { 39935, true, false, true, "Agility", 6, "Stamina", 9 }, -- Shifting Shadow Crystal
-- { 39936, true, false, true, "SpellPower", 7, "Stamina", 9 }, -- Glowing Shadow Crystal
-- { 39937, true, false, true, "Ap", 12, "Stamina", 9 }, -- Balanced Shadow Crystal
-- { 39938, true, false, true, "DodgeRating", 6, "Stamina", 9 }, -- Regal Shadow Crystal
-- { 39939, true, false, true, "ParryRating", 6, "Stamina", 9 }, -- Defender's Shadow Crystal
-- { 39940, true, false, true, "ExpertiseRating", 6, "Stamina", 9 }, -- Guardian's Shadow Crystal
-- { 39941, true, false, true, "SpellPower", 7, "Spirit", 6 }, -- Purified Shadow Crystal
-- { 39942, true, false, true, "Agility", 6, "Mp5", 3 }, -- Tenuous Shadow Crystal
-- { 39943, true, false, true, "SpellPower", 7, "Mp5", 3 }, -- Royal Shadow Crystal
-- { 39944, true, false, true, "Ap", 12, "Mp5", 3 }, -- Infused Shadow Crystal
-- { 39945, true, false, true, "SpellPower", 7, "SpellPenetration", 8 }, -- Mysterious Shadow Crystal


}


--========================================
-- Colored level 70 rare-quality gems
--========================================
PawnGemData70Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ 24027, true, false, false, "Strength", 8 }, -- Bold Living Ruby
{ 24028, true, false, false, "Agility", 8 }, -- Delicate Living Ruby
{ 24030, true, false, false, "SpellPower", 9 }, -- Runed Living Ruby
{ 24031, true, false, false, "Ap", 16 }, -- Bright Living Ruby
{ 24032, true, false, false, "DodgeRating", 8 }, -- Subtle Living Ruby
{ 24036, true, false, false, "ParryRating", 8 }, -- Flashing Living Ruby
-- { 40002, true, true, true, "ArmorPenetration", 8 }, -- Fractured Living Ruby
-- { 40003, true, true, true, "ExpertiseRating", 8 }, -- Precise Living Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ 24061, true, true, false, "Agility", 4, "HitRating", 4 }, -- Glinting Noble Topaz
{ 24058, true, true, false, "Strength", 4, "CritRating", 4 }, -- Inscribed Noble Topaz
{ 24060, true, true, false, "SpellPower", 5, "Intellect", 4 }, -- Luminous Noble Topaz
{ 24059, true, true, false, "SpellPower", 5, "CritRating", 4 }, -- Potent Noble Topaz
{ 31867, true, true, false, "SpellPower", 5, "HitRating", 4 }, -- Veiled Noble Topaz
{ 31868, true, true, false, "Ap", 8, "CritRating", 4 }, -- Wicked Noble Topaz

--Released in later patch
-- { 35316, true, true, false, "SpellPower", 5, "HasteRating", 4 }, -- Reckless Noble Topaz


--Not used
-- { 40038, true, true, false, "Strength", 4, "HitRating", 4 }, -- Etched Noble Topaz
-- { 40039, true, true, false, "Strength", 4, "DefenseRating", 4 }, -- Champion's Noble Topaz
-- { 40040, true, true, false, "Strength", 4, "ResilienceRating", 4 }, -- Resplendent Noble Topaz
-- { 40041, true, true, false, "Strength", 4, "HasteRating", 4 }, -- Fierce Noble Topaz
-- { 40043, true, true, false, "Agility", 4, "CritRating", 4 }, -- Deadly Noble Topaz
-- { 40045, true, true, false, "Agility", 4, "ResilienceRating", 4 }, -- Lucent Noble Topaz
-- { 40046, true, true, false, "Agility", 4, "HasteRating", 4 }, -- Deft Noble Topaz
-- { 40050, true, true, false, "SpellPower", 5, "ResilienceRating", 4 }, -- Durable Noble Topaz
-- { 40053, true, true, false, "Ap", 8, "HitRating", 4 }, -- Pristine Noble Topaz
-- { 40054, true, true, false, "Ap", 8, "ResilienceRating", 4 }, -- Empowered Noble Topaz
-- { 40055, true, true, false, "Ap", 8, "HasteRating", 4 }, -- Stark Noble Topaz
-- { 40056, true, true, false, "DodgeRating", 4, "DefenseRating", 4 }, -- Stalwart Noble Topaz
-- { 40057, true, true, false, "ParryRating", 4, "DefenseRating", 4 }, -- Glimmering Noble Topaz
-- { 40058, true, true, false, "ExpertiseRating", 4, "HitRating", 4 }, -- Accurate Noble Topaz
-- { 40059, true, true, false, "ExpertiseRating", 4, "DefenseRating", 4 }, -- Resolute Noble Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ 24047, false, true, false, "Intellect", 8 }, -- Brilliant Dawnstone
{ 24048, false, true, false, "CritRating", 8 }, -- Smooth Dawnstone
{ 24051, false, true, false, "HitRating", 8 }, -- Rigid Dawnstone
{ 24052, false, true, false, "DefenseRating", 8 }, -- Thick Dawnstone
{ 24053, false, true, false, "ResilienceRating", 8 }, -- Mystic Dawnstone

--Added in later patch
-- { 35315, true, true, true, "HasteRating", 8 }, -- Quick Dawnstone


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ 24065, false, true, true, "Intellect", 4, "Mp5", 2 }, -- Dazzling Talasite
{ 24062, false, true, true, "DefenseRating", 4, "Stamina", 6 }, -- Enduring Talasite
{ 24067, false, true, true, "CritRating", 4, "Stamina", 6 }, -- Jagged Talasite
{ 24066, false, true, true, "CritRating", 4, "SpellPenetration", 5 }, -- Radiant Talasite
{ 33782, false, true, true, "ResilienceRating", 4, "Stamina", 6 }, -- Steady Talasite

--Later patch
-- { 35318, false, true, true, "HasteRating", 4, "Stamina", 6 }, -- Forceful Talasite

-- not used
-- { 40085, true, true, true, "Intellect", 4, "Stamina", 6 }, -- Timeless Talasite
-- { 40088, true, true, true, "HitRating", 4, "Stamina", 6 }, -- Vivid Talasite
-- { 40092, true, true, true, "Intellect", 4, "Spirit", 4 }, -- Seer's Talasite
-- { 40095, true, true, true, "CritRating", 4, "Spirit", 4 }, -- Misty Talasite
-- { 40096, true, true, true, "CritRating", 4, "Mp5", 2 }, -- Sundered Talasite
-- { 40099, true, true, true, "HitRating", 4, "Spirit", 4 }, -- Shining Talasite
-- { 40100, true, true, true, "HitRating", 4, "Mp5", 2 }, -- Lambent Talasite
-- { 40101, true, true, true, "HitRating", 4, "SpellPenetration", 5 }, -- Tense Talasite
-- { 40102, true, true, true, "ResilienceRating", 4, "Spirit", 4 }, -- Turbid Talasite
-- { 40103, true, true, true, "ResilienceRating", 4, "Mp5", 2 }, -- Opaque Talasite
-- { 40104, true, true, true, "HasteRating", 4, "Spirit", 4 }, -- Intricate Talasite
-- { 40105, true, true, true, "HasteRating", 4, "Mp5", 2 }, -- Energized Talasite
-- { 40106, true, true, true, "HasteRating", 4, "SpellPenetration", 5 }, -- Shattered Talasite


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ 24033, false, false, true, "Stamina", 12 }, -- Solid Star of Elune
{ 24035, false, false, true, "Spirit", 8 }, -- Sparkling Star of Elune
{ 24037, false, false, true, "Mp5", 4 }, -- Lustrous Star of Elune
{ 24039, false, false, true, "SpellPenetration", 10 }, -- Stormy Star of Elune


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ 31863, true, false, true, "Ap", 8, "Stamina", 6 }, -- Balanced Nightseye
{ 24056, true, false, true, "SpellPower", 5, "Stamina", 6 }, -- Glowing Nightseye
{ 31865, true, false, true, "Ap", 8, "Mp5", 2 }, -- Infused Nightseye
{ 35707, true, false, true, "DodgeRating", 4, "Stamina", 6 }, -- Regal Nightseye
{ 24057, true, false, true, "SpellPower", 5, "Mp5", 2 }, -- Royal Nightseye
{ 24055, true, false, true, "Agility", 4, "Stamina", 6 }, -- Shifting Nightseye
{ 24054, true, false, true, "Strength", 4, "Stamina", 6 }, -- Sovereign Nightseye
{ 32836, true, false, true, "SpellPower", 5, "Spirit", 4 }, -- Purified Shadow Pearl

-- not used
-- { 40024, true, true, true, "Agility", 4, "Mp5", 2 }, -- Tenuous Nightseye
-- { 40028, true, true, true, "SpellPower", 5, "SpellPenetration", 10 }, -- Mysterious Nightseye
-- { 40032, true, true, true, "ParryRating", 4, "Stamina", 6 }, -- Defender's Nightseye
-- { 40033, true, true, true, "ArmorPenetration", 4, "Stamina", 6 }, -- Puissant Nightseye
-- { 40034, true, true, true, "ExpertiseRating", 4, "Stamina", 6 }, -- Guardian's Nightseye


}


--========================================
-- Epic level 70 gems
--========================================
PawnGemData70Epic =
{
{ 32193, true, false, false, 'Strength', 10 }, -- Bold Crimson Spinel
{ 32194, true, false, false, 'Agility', 10 }, -- Delicate Crimson Spinel
{ 32195, true, false, false, 'SpellPower', 12 }, -- Runed Crimson Spinel
{ 32199, true, false, false, 'ParryRating', 10 }, -- Flashing Crimson Spinel
{ 32221, true, false, false, 'DodgeRating', 10 }, -- Subtle Crimson Spinel
{ 32197, true, false, false, 'ExpertiseRating', 10 }, -- Bright Crimson Spinel

{ 32200, false, false, true, 'Stamina', 15 }, -- Solid Empyrean Sapphire
{ 32201, false, false, true, 'Spirit', 10 }, -- Sparkling Empyrean Sapphire
{ 32202, false, false, true, 'MP5', 5 }, -- Lustrous Empyrean Sapphire
{ 32203, false, false, true, 'ResilienceRating', 10 }, -- Stormy Empyrean Sapphire

{ 32205, false, true, false, 'Intellect', 10 }, -- Brilliant Lionseye
{ 32206, false, true, false, 'CritRating', 10 }, -- Smooth Lionseye
{ 35760, false, true, false, 'HasteRating', 10 }, -- Quick Lionseye
{ 32208, false, true, false, 'DefenseRating', 10 }, -- Rigid Lionseye
{ 32209, false, true, false, 'HitRating', 10 }, -- Mystic Lionseye

{ 32217, true, true, false, 'Strength', 5, 'CritRating', 5 }, -- Inscribed Pyrestone
{ 32222, true, true, false, 'Agility', 5, 'HasteRating', 5 }, -- Deadly Pyrestone
{ 32218, true, true, false, 'SpellPower', 6, 'CritRating', 5 }, -- Potent Pyrestone
{ 32220, true, true, false, 'Strength', 5, 'HasteRating', 5 }, -- Fierce Pyrestone
{ 32221, true, true, false, 'Agility', 5, 'CritRating', 5 }, -- Wicked Pyrestone

{ 32223, false, true, true, 'CritRating', 5, 'Stamina', 7 }, -- Jagged Seaspray Emerald
{ 35758, false, true, true, 'HasteRating', 5, 'Stamina', 7 }, -- Radiant Seaspray Emerald
{ 32225, false, true, true, 'MP5', 4, 'Stamina', 7 }, -- Dazzling Seaspray Emerald
{ 32226, false, true, true, 'HitRating', 5, 'Stamina', 7 }, -- Enduring Seaspray Emerald
{ 32227, false, true, true, 'DefenseRating', 5, 'Stamina', 7 }, -- Vivid Seaspray Emerald

{ 32228, true, true, true, 'SpellPower', 6, 'Spirit', 5 }, -- Purified Shadowsong Amethyst
{ 32212, true, true, true, 'SpellPower', 6, 'Stamina', 7 }, -- Shifting Shadowsong Amethyst
{ 32230, true, true, true, 'SpellPower', 6, 'Intellect', 5 }, -- Glowing Shadowsong Amethyst
{ 32231, true, true, true, 'Agility', 5, 'Stamina', 7 }, -- Balanced Shadowsong Amethyst
{ 32214, true, true, true, 'SpellPower', 6, 'CritRating', 5 }, -- Infused Shadowsong Amethyst
{ 32211, true, true, true, 'AttackPower', 10, 'Stamina', 7 }, -- Sovereign Shadowsong Amethyst
}




--========================================
-- Colored level 80 uncommon-quality gems
--========================================
PawnGemData80Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ 39900, true, false, false, "Strength", 12 }, -- Bold Bloodstone
{ 39905, true, false, false, "Agility", 12 }, -- Delicate Bloodstone
{ 39906, true, false, false, "Ap", 24 }, -- Bright Bloodstone
{ 39907, true, false, false, "DodgeRating", 12 }, -- Subtle Bloodstone
{ 39908, true, false, false, "ParryRating", 12 }, -- Flashing Bloodstone
{ 39909, true, false, false, "ArmorPenetration", 12 }, -- Fractured Bloodstone
{ 39910, true, false, false, "ExpertiseRating", 12 }, -- Precise Bloodstone
{ 39911, true, false, false, "SpellPower", 14 }, -- Runed Bloodstone


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ 39946, true, true, false, "SpellPower", 7, "Intellect", 6 }, -- Luminous Huge Citrine
{ 39947, true, true, false, "Strength", 6, "CritRating", 6 }, -- Inscribed Huge Citrine
{ 39948, true, true, false, "Strength", 6, "HitRating", 6 }, -- Etched Huge Citrine
{ 39949, true, true, false, "Strength", 6, "DefenseRating", 6 }, -- Champion's Huge Citrine
{ 39950, true, true, false, "Strength", 6, "ResilienceRating", 6 }, -- Resplendent Huge Citrine
{ 39951, true, true, false, "Strength", 6, "HasteRating", 6 }, -- Fierce Huge Citrine
{ 39952, true, true, false, "Agility", 6, "CritRating", 6 }, -- Deadly Huge Citrine
{ 39953, true, true, false, "Agility", 6, "HitRating", 6 }, -- Glinting Huge Citrine
{ 39954, true, true, false, "Agility", 6, "ResilienceRating", 6 }, -- Lucent Huge Citrine
{ 39955, true, true, false, "Agility", 6, "HasteRating", 6 }, -- Deft Huge Citrine
{ 39956, true, true, false, "SpellPower", 7, "CritRating", 6 }, -- Potent Huge Citrine
{ 39957, true, true, false, "SpellPower", 7, "HitRating", 6 }, -- Veiled Huge Citrine
{ 39958, true, true, false, "SpellPower", 7, "ResilienceRating", 6 }, -- Durable Huge Citrine
{ 39959, true, true, false, "SpellPower", 7, "HasteRating", 6 }, -- Reckless Huge Citrine
{ 39960, true, true, false, "Ap", 12, "CritRating", 6 }, -- Wicked Huge Citrine
{ 39961, true, true, false, "Ap", 12, "HitRating", 6 }, -- Pristine Huge Citrine
{ 39962, true, true, false, "Ap", 12, "ResilienceRating", 6 }, -- Empowered Huge Citrine
{ 39963, true, true, false, "Ap", 12, "HasteRating", 6 }, -- Stark Huge Citrine
{ 39964, true, true, false, "DodgeRating", 6, "DefenseRating", 6 }, -- Stalwart Huge Citrine
{ 39965, true, true, false, "ParryRating", 6, "DefenseRating", 6 }, -- Glimmering Huge Citrine
{ 39966, true, true, false, "ExpertiseRating", 6, "HitRating", 6 }, -- Accurate Huge Citrine
{ 39967, true, true, false, "ExpertiseRating", 6, "DefenseRating", 6 }, -- Resolute Huge Citrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ 39912, false, true, false, "Intellect", 12 }, -- Brilliant Sun Crystal
{ 39914, false, true, false, "CritRating", 12 }, -- Smooth Sun Crystal
{ 39915, false, true, false, "HitRating", 12 }, -- Rigid Sun Crystal
{ 39916, false, true, false, "DefenseRating", 12 }, -- Thick Sun Crystal
{ 39917, false, true, false, "ResilienceRating", 12 }, -- Mystic Sun Crystal
{ 39918, false, true, false, "HasteRating", 12 }, -- Quick Sun Crystal


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ 39968, false, true, true, "Intellect", 6, "Stamina", 9 }, -- Timeless Dark Jade
{ 39974, false, true, true, "CritRating", 6, "Stamina", 9 }, -- Jagged Dark Jade
{ 39975, false, true, true, "HitRating", 6, "Stamina", 9 }, -- Vivid Dark Jade
{ 39976, false, true, true, "DefenseRating", 6, "Stamina", 9 }, -- Enduring Dark Jade
{ 39977, false, true, true, "ResilienceRating", 6, "Stamina", 9 }, -- Steady Dark Jade
{ 39978, false, true, true, "HasteRating", 6, "Stamina", 9 }, -- Forceful Dark Jade
{ 39979, false, true, true, "Intellect", 6, "Spirit", 6 }, -- Seer's Dark Jade
{ 39980, false, true, true, "CritRating", 6, "Spirit", 6 }, -- Misty Dark Jade
{ 39981, false, true, true, "HitRating", 6, "Spirit", 6 }, -- Shining Dark Jade
{ 39982, false, true, true, "ResilienceRating", 6, "Spirit", 6 }, -- Turbid Dark Jade
{ 39983, false, true, true, "HasteRating", 6, "Spirit", 6 }, -- Intricate Dark Jade
{ 39984, false, true, true, "Intellect", 6, "Mp5", 3 }, -- Dazzling Dark Jade
{ 39985, false, true, true, "CritRating", 6, "Mp5", 3 }, -- Sundered Dark Jade
{ 39986, false, true, true, "HitRating", 6, "Mp5", 3 }, -- Lambent Dark Jade
{ 39988, false, true, true, "ResilienceRating", 6, "Mp5", 3 }, -- Opaque Dark Jade
{ 39989, false, true, true, "HasteRating", 6, "Mp5", 3 }, -- Energized Dark Jade
{ 39990, false, true, true, "CritRating", 6, "SpellPenetration", 8 }, -- Radiant Dark Jade
{ 39991, false, true, true, "HitRating", 6, "SpellPenetration", 8 }, -- Tense Dark Jade
{ 39992, false, true, true, "HasteRating", 6, "SpellPenetration", 8 }, -- Shattered Dark Jade


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ 39919, false, false, true, "Stamina", 18 }, -- Solid Chalcedony
{ 39920, false, false, true, "Spirit", 12 }, -- Sparkling Chalcedony
{ 39927, false, false, true, "Mp5", 6 }, -- Lustrous Chalcedony
{ 39932, false, false, true, "SpellPenetration", 15 }, -- Stormy Chalcedony


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ 39933, true, false, true, "ArmorPenetration", 6, "Stamina", 9 }, -- Puissant Shadow Crystal
{ 39934, true, false, true, "Strength", 6, "Stamina", 9 }, -- Sovereign Shadow Crystal
{ 39935, true, false, true, "Agility", 6, "Stamina", 9 }, -- Shifting Shadow Crystal
{ 39936, true, false, true, "SpellPower", 7, "Stamina", 9 }, -- Glowing Shadow Crystal
{ 39937, true, false, true, "Ap", 12, "Stamina", 9 }, -- Balanced Shadow Crystal
{ 39938, true, false, true, "DodgeRating", 6, "Stamina", 9 }, -- Regal Shadow Crystal
{ 39939, true, false, true, "ParryRating", 6, "Stamina", 9 }, -- Defender's Shadow Crystal
{ 39940, true, false, true, "ExpertiseRating", 6, "Stamina", 9 }, -- Guardian's Shadow Crystal
{ 39941, true, false, true, "SpellPower", 7, "Spirit", 6 }, -- Purified Shadow Crystal
{ 39942, true, false, true, "Agility", 6, "Mp5", 3 }, -- Tenuous Shadow Crystal
{ 39943, true, false, true, "SpellPower", 7, "Mp5", 3 }, -- Royal Shadow Crystal
{ 39944, true, false, true, "Ap", 12, "Mp5", 3 }, -- Infused Shadow Crystal
{ 39945, true, false, true, "SpellPower", 7, "SpellPenetration", 8 }, -- Mysterious Shadow Crystal


}


--========================================
-- Colored level 80 rare-quality gems
--========================================
PawnGemData80Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ 39996, true, false, false, "Strength", 16 }, -- Bold Scarlet Ruby
{ 39997, true, false, false, "Agility", 16 }, -- Delicate Scarlet Ruby
{ 39998, true, false, false, "SpellPower", 19 }, -- Runed Scarlet Ruby
{ 39999, true, false, false, "Ap", 32 }, -- Bright Scarlet Ruby
{ 40000, true, false, false, "DodgeRating", 16 }, -- Subtle Scarlet Ruby
{ 40001, true, false, false, "ParryRating", 16 }, -- Flashing Scarlet Ruby
{ 40002, true, false, false, "ArmorPenetration", 16 }, -- Fractured Scarlet Ruby
{ 40003, true, false, false, "ExpertiseRating", 16 }, -- Precise Scarlet Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ 40037, true, true, false, "Strength", 8, "CritRating", 8 }, -- Inscribed Monarch Topaz
{ 40038, true, true, false, "Strength", 8, "HitRating", 8 }, -- Etched Monarch Topaz
{ 40039, true, true, false, "Strength", 8, "DefenseRating", 8 }, -- Champion's Monarch Topaz
{ 40040, true, true, false, "Strength", 8, "ResilienceRating", 8 }, -- Resplendent Monarch Topaz
{ 40041, true, true, false, "Strength", 8, "HasteRating", 8 }, -- Fierce Monarch Topaz
{ 40043, true, true, false, "Agility", 8, "CritRating", 8 }, -- Deadly Monarch Topaz
{ 40044, true, true, false, "Agility", 8, "HitRating", 8 }, -- Glinting Monarch Topaz
{ 40045, true, true, false, "Agility", 8, "ResilienceRating", 8 }, -- Lucent Monarch Topaz
{ 40046, true, true, false, "Agility", 8, "HasteRating", 8 }, -- Deft Monarch Topaz
{ 40047, true, true, false, "SpellPower", 9, "Intellect", 8 }, -- Luminous Monarch Topaz
{ 40048, true, true, false, "SpellPower", 9, "CritRating", 8 }, -- Potent Monarch Topaz
{ 40049, true, true, false, "SpellPower", 9, "HitRating", 8 }, -- Veiled Monarch Topaz
{ 40050, true, true, false, "SpellPower", 9, "ResilienceRating", 8 }, -- Durable Monarch Topaz
{ 40051, true, true, false, "SpellPower", 9, "HasteRating", 8 }, -- Reckless Monarch Topaz
{ 40052, true, true, false, "Ap", 16, "CritRating", 8 }, -- Wicked Monarch Topaz
{ 40053, true, true, false, "Ap", 16, "HitRating", 8 }, -- Pristine Monarch Topaz
{ 40054, true, true, false, "Ap", 16, "ResilienceRating", 8 }, -- Empowered Monarch Topaz
{ 40055, true, true, false, "Ap", 16, "HasteRating", 8 }, -- Stark Monarch Topaz
{ 40056, true, true, false, "DodgeRating", 8, "DefenseRating", 8 }, -- Stalwart Monarch Topaz
{ 40057, true, true, false, "ParryRating", 8, "DefenseRating", 8 }, -- Glimmering Monarch Topaz
{ 40058, true, true, false, "ExpertiseRating", 8, "HitRating", 8 }, -- Accurate Monarch Topaz
{ 40059, true, true, false, "ExpertiseRating", 8, "DefenseRating", 8 }, -- Resolute Monarch Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ 40012, false, true, false, "Intellect", 16 }, -- Brilliant Autumn's Glow
{ 40013, false, true, false, "CritRating", 16 }, -- Smooth Autumn's Glow
{ 40014, false, true, false, "HitRating", 16 }, -- Rigid Autumn's Glow
{ 40015, false, true, false, "DefenseRating", 16 }, -- Thick Autumn's Glow
{ 40016, false, true, false, "ResilienceRating", 16 }, -- Mystic Autumn's Glow
{ 40017, false, true, false, "HasteRating", 16 }, -- Quick Autumn's Glow


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ 40085, false, true, true, "Intellect", 8, "Stamina", 12 }, -- Timeless Forest Emerald
{ 40086, false, true, true, "CritRating", 8, "Stamina", 12 }, -- Jagged Forest Emerald
{ 40088, false, true, true, "HitRating", 8, "Stamina", 12 }, -- Vivid Forest Emerald
{ 40089, false, true, true, "DefenseRating", 8, "Stamina", 12 }, -- Enduring Forest Emerald
{ 40090, false, true, true, "ResilienceRating", 8, "Stamina", 12 }, -- Steady Forest Emerald
{ 40091, false, true, true, "HasteRating", 8, "Stamina", 12 }, -- Forceful Forest Emerald
{ 40092, false, true, true, "Intellect", 8, "Spirit", 8 }, -- Seer's Forest Emerald
{ 40094, false, true, true, "Intellect", 8, "Mp5", 4 }, -- Dazzling Forest Emerald
{ 40095, false, true, true, "CritRating", 8, "Spirit", 8 }, -- Misty Forest Emerald
{ 40096, false, true, true, "CritRating", 8, "Mp5", 4 }, -- Sundered Forest Emerald
{ 40098, false, true, true, "CritRating", 8, "SpellPenetration", 10 }, -- Radiant Forest Emerald
{ 40099, false, true, true, "HitRating", 8, "Spirit", 8 }, -- Shining Forest Emerald
{ 40100, false, true, true, "HitRating", 8, "Mp5", 4 }, -- Lambent Forest Emerald
{ 40101, false, true, true, "HitRating", 8, "SpellPenetration", 10 }, -- Tense Forest Emerald
{ 40102, false, true, true, "ResilienceRating", 8, "Spirit", 8 }, -- Turbid Forest Emerald
{ 40103, false, true, true, "ResilienceRating", 8, "Mp5", 4 }, -- Opaque Forest Emerald
{ 40104, false, true, true, "HasteRating", 8, "Spirit", 8 }, -- Intricate Forest Emerald
{ 40105, false, true, true, "HasteRating", 8, "Mp5", 4 }, -- Energized Forest Emerald
{ 40106, false, true, true, "HasteRating", 8, "SpellPenetration", 10 }, -- Shattered Forest Emerald


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ 40008, false, false, true, "Stamina", 24 }, -- Solid Sky Sapphire
{ 40009, false, false, true, "Spirit", 16 }, -- Sparkling Sky Sapphire
{ 40010, false, false, true, "Mp5", 8 }, -- Lustrous Sky Sapphire
{ 40011, false, false, true, "SpellPenetration", 20 }, -- Stormy Sky Sapphire


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ 40022, true, false, true, "Strength", 8, "Stamina", 12 }, -- Sovereign Twilight Opal
{ 40023, true, false, true, "Agility", 8, "Stamina", 12 }, -- Shifting Twilight Opal
{ 40024, true, false, true, "Agility", 8, "Mp5", 4 }, -- Tenuous Twilight Opal
{ 40025, true, false, true, "SpellPower", 9, "Stamina", 12 }, -- Glowing Twilight Opal
{ 40026, true, false, true, "SpellPower", 9, "Spirit", 8 }, -- Purified Twilight Opal
{ 40027, true, false, true, "SpellPower", 9, "Mp5", 4 }, -- Royal Twilight Opal
{ 40028, true, false, true, "SpellPower", 9, "SpellPenetration", 10 }, -- Mysterious Twilight Opal
{ 40029, true, false, true, "Ap", 16, "Stamina", 12 }, -- Balanced Twilight Opal
{ 40030, true, false, true, "Ap", 16, "Mp5", 4 }, -- Infused Twilight Opal
{ 40031, true, false, true, "DodgeRating", 8, "Stamina", 12 }, -- Regal Twilight Opal
{ 40032, true, false, true, "ParryRating", 8, "Stamina", 12 }, -- Defender's Twilight Opal
{ 40033, true, false, true, "ArmorPenetration", 8, "Stamina", 12 }, -- Puissant Twilight Opal
{ 40034, true, false, true, "ExpertiseRating", 8, "Stamina", 12 }, -- Guardian's Twilight Opal


}


--========================================
-- Colored level 80 epic-quality gems
--========================================
PawnGemData80Epic =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ 40111, true, false, false, "Strength", 20 }, -- Bold Cardinal Ruby
{ 40112, true, false, false, "Agility", 20 }, -- Delicate Cardinal Ruby
{ 40113, true, false, false, "SpellPower", 23 }, -- Runed Cardinal Ruby
{ 40114, true, false, false, "Ap", 40 }, -- Bright Cardinal Ruby
{ 40115, true, false, false, "DodgeRating", 20 }, -- Subtle Cardinal Ruby
{ 40116, true, false, false, "ParryRating", 20 }, -- Flashing Cardinal Ruby
{ 40117, true, false, false, "ArmorPenetration", 20 }, -- Fractured Cardinal Ruby
{ 40118, true, false, false, "ExpertiseRating", 20 }, -- Precise Cardinal Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ 40142, true, true, false, "Strength", 10, "CritRating", 10 }, -- Inscribed Ametrine
{ 40143, true, true, false, "Strength", 10, "HitRating", 10 }, -- Etched Ametrine
{ 40144, true, true, false, "Strength", 10, "DefenseRating", 10 }, -- Champion's Ametrine
{ 40145, true, true, false, "Strength", 10, "ResilienceRating", 10 }, -- Resplendent Ametrine
{ 40146, true, true, false, "Strength", 10, "HasteRating", 10 }, -- Fierce Ametrine
{ 40147, true, true, false, "Agility", 10, "CritRating", 10 }, -- Deadly Ametrine
{ 40148, true, true, false, "Agility", 10, "HitRating", 10 }, -- Glinting Ametrine
{ 40149, true, true, false, "Agility", 10, "ResilienceRating", 10 }, -- Lucent Ametrine
{ 40150, true, true, false, "Agility", 10, "HasteRating", 10 }, -- Deft Ametrine
{ 40151, true, true, false, "SpellPower", 12, "Intellect", 10 }, -- Luminous Ametrine
{ 40152, true, true, false, "SpellPower", 12, "CritRating", 10 }, -- Potent Ametrine
{ 40153, true, true, false, "SpellPower", 12, "HitRating", 10 }, -- Veiled Ametrine
{ 40154, true, true, false, "SpellPower", 12, "ResilienceRating", 10 }, -- Durable Ametrine
{ 40155, true, true, false, "SpellPower", 12, "HasteRating", 10 }, -- Reckless Ametrine
{ 40156, true, true, false, "Ap", 20, "CritRating", 10 }, -- Wicked Ametrine
{ 40157, true, true, false, "Ap", 20, "HitRating", 10 }, -- Pristine Ametrine
{ 40158, true, true, false, "Ap", 20, "ResilienceRating", 10 }, -- Empowered Ametrine
{ 40159, true, true, false, "Ap", 20, "HasteRating", 10 }, -- Stark Ametrine
{ 40160, true, true, false, "DodgeRating", 10, "DefenseRating", 10 }, -- Stalwart Ametrine
{ 40161, true, true, false, "ParryRating", 10, "DefenseRating", 10 }, -- Glimmering Ametrine
{ 40162, true, true, false, "ExpertiseRating", 10, "HitRating", 10 }, -- Accurate Ametrine
{ 40163, true, true, false, "ExpertiseRating", 10, "DefenseRating", 10 }, -- Resolute Ametrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ 40123, false, true, false, "Intellect", 20 }, -- Brilliant King's Amber
{ 40124, false, true, false, "CritRating", 20 }, -- Smooth King's Amber
{ 40125, false, true, false, "HitRating", 20 }, -- Rigid King's Amber
{ 40126, false, true, false, "DefenseRating", 20 }, -- Thick King's Amber
{ 40127, false, true, false, "ResilienceRating", 20 }, -- Mystic King's Amber
{ 40128, false, true, false, "HasteRating", 20 }, -- Quick King's Amber


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ 40164, false, true, true, "Intellect", 10, "Stamina", 15 }, -- Timeless Eye of Zul
{ 40165, false, true, true, "CritRating", 10, "Stamina", 15 }, -- Jagged Eye of Zul
{ 40166, false, true, true, "HitRating", 10, "Stamina", 15 }, -- Vivid Eye of Zul
{ 40167, false, true, true, "DefenseRating", 10, "Stamina", 15 }, -- Enduring Eye of Zul
{ 40168, false, true, true, "ResilienceRating", 10, "Stamina", 15 }, -- Steady Eye of Zul
{ 40169, false, true, true, "HasteRating", 10, "Stamina", 15 }, -- Forceful Eye of Zul
{ 40170, false, true, true, "Intellect", 10, "Spirit", 10 }, -- Seer's Eye of Zul
{ 40171, false, true, true, "CritRating", 10, "Spirit", 10 }, -- Misty Eye of Zul
{ 40172, false, true, true, "HitRating", 10, "Spirit", 10 }, -- Shining Eye of Zul
{ 40173, false, true, true, "ResilienceRating", 10, "Spirit", 10 }, -- Turbid Eye of Zul
{ 40174, false, true, true, "HasteRating", 10, "Spirit", 10 }, -- Intricate Eye of Zul
{ 40175, false, true, true, "Intellect", 10, "Mp5", 5 }, -- Dazzling Eye of Zul
{ 40176, false, true, true, "CritRating", 10, "Mp5", 5 }, -- Sundered Eye of Zul
{ 40177, false, true, true, "HitRating", 10, "Mp5", 5 }, -- Lambent Eye of Zul
{ 40178, false, true, true, "ResilienceRating", 10, "Mp5", 5 }, -- Opaque Eye of Zul
{ 40179, false, true, true, "HasteRating", 10, "Mp5", 5 }, -- Energized Eye of Zul
{ 40180, false, true, true, "CritRating", 10, "SpellPenetration", 13 }, -- Radiant Eye of Zul
{ 40181, false, true, true, "HitRating", 10, "SpellPenetration", 13 }, -- Tense Eye of Zul
{ 40182, false, true, true, "HasteRating", 10, "SpellPenetration", 13 }, -- Shattered Eye of Zul


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ 40119, false, false, true, "Stamina", 30 }, -- Solid Majestic Zircon
{ 40120, false, false, true, "Spirit", 20 }, -- Sparkling Majestic Zircon
{ 40121, false, false, true, "Mp5", 10 }, -- Lustrous Majestic Zircon
{ 40122, false, false, true, "SpellPenetration", 25 }, -- Stormy Majestic Zircon


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ 40129, true, false, true, "Strength", 10, "Stamina", 15 }, -- Sovereign Dreadstone
{ 40130, true, false, true, "Agility", 10, "Stamina", 15 }, -- Shifting Dreadstone
{ 40131, true, false, true, "Agility", 10, "Mp5", 5 }, -- Tenuous Dreadstone
{ 40132, true, false, true, "SpellPower", 12, "Stamina", 15 }, -- Glowing Dreadstone
{ 40133, true, false, true, "SpellPower", 12, "Spirit", 10 }, -- Purified Dreadstone
{ 40134, true, false, true, "SpellPower", 12, "Mp5", 5 }, -- Royal Dreadstone
{ 40135, true, false, true, "SpellPower", 12, "SpellPenetration", 13 }, -- Mysterious Dreadstone
{ 40136, true, false, true, "Ap", 20, "Stamina", 15 }, -- Balanced Dreadstone
{ 40137, true, false, true, "Ap", 20, "Mp5", 5 }, -- Infused Dreadstone
{ 40138, true, false, true, "DodgeRating", 10, "Stamina", 15 }, -- Regal Dreadstone
{ 40139, true, false, true, "ParryRating", 10, "Stamina", 15 }, -- Defender's Dreadstone
{ 40140, true, false, true, "ArmorPenetration", 10, "Stamina", 15 }, -- Puissant Dreadstone
{ 40141, true, false, true, "ExpertiseRating", 10, "Stamina", 15 }, -- Guardian's Dreadstone


}

--========================================
-- Level 70 crafted meta gems
--========================================
PawnMetaGemData70Rare =
{


------------------------------------------------------------
-- Meta gems: Earthstorm
------------------------------------------------------------

{ 35501, false, false, false, "DefenseRating", 12 }, -- Eternal Earthstorm Diamond (+5% Shield Block Value)
{ 25898, false, false, false, "DefenseRating", 12 }, -- Tenacity Earthstorm Diamond (chance to restore health on hit)
{ 25897, false, false, false, "SpellPower", 14 }, -- Bracing Earthstorm Diamond (2% Reduced Threat)
-- { 35503, false, false, false, "Stamina", 1 }, -- Brutal Earthstorm Diamond (+3 weapon damage + chance to stun for 1 sec)
{ 25896, false, false, false, "Stamina", 18 }, -- Powerful Earthstorm Diamond (Stun Duration Reduced by 5%)
{ 32409, false, false, false, "Agility", 12 }, -- Relentless Earthstorm Diamond (3% Increased Critical Damage)

-- { 41380, false, false, false, "Stamina", 32 }, -- Austere Earthstorm Diamond (2% Increased Armor Value from Items)
-- { 41381, false, false, false, "Ap", 42 }, -- Persistent Earthstorm Diamond (Stun Duration Reduced by 10%)
-- { 41382, false, false, false, "SpellPower", 25 }, -- Trenchant Earthstorm Diamond (Stun Duration Reduced by 10%)
-- { 41385, false, false, false, "Ap", 42 }, -- Invigorating Earthstorm Diamond (Sometimes Heal on Your Crits)
-- { 41389, false, false, false, "CritRating", 21 }, -- Beaming Earthstorm Diamond (+2% Mana)
-- { 41401, false, false, false, "Intellect", 21 }, -- Insightful Earthstorm Diamond (Chance to restore mana on spellcast)


------------------------------------------------------------
-- Meta gems: Skyfire
------------------------------------------------------------

{ 35503, false, false, false, "SpellPower", 14 }, -- Ember Skyfire Diamond (+2% Intellect)
{ 34220, false, false, false, "CritRating", 12 }, -- Chaotic Skyfire Diamond (3% Increased Critical Damage)
{ 25890, false, false, false, "CritRating", 14 }, -- Destructive Skyfire Diamond (1% Spell Reflect)
{ 25895, false, false, false, "CritRating", 12 }, -- Enigmatic Skyfire Diamond (Reduces Snare/Root Duration by 10%)
{ 25894, false, false, false, "Ap", 24 }, -- Swift Skyfire Diamond (Minor Run Speed Increase)
-- { 25893, false, false, false, "HasteRating", 25 }, -- Mystical Skyfire Diamond (Chance on spellcast to get 236 haste for 6 sec)
-- { 32410, false, false, false, "MeleeSpeed", 25, "RangedSped", 25 }, -- Thundering Skyfire Diamond (Minor Run Speed Increase)

-- { 41375, false, false, false, "SpellPower", 25 }, -- Tireless Skyfire Diamond (Minor Run Speed Increase)
-- { 41376, false, false, false, "Mp5", 11 }, -- Revitalizing Skyfire Diamond (3% Increased Critical Healing Effect)
-- { 41377, false, false, false, "Stamina", 32 }, -- Effulgent Skyfire Diamond (Reduce Spell Damage Taken by 2%)
-- { 41378, false, false, false, "SpellPower", 25 }, -- Forlorn Skyfire Diamond (Silence Duration Reduced by 10%)
-- { 41379, false, false, false, "CritRating", 21 }, -- Impassive Skyfire Diamond (Fear Duration Reduced by 10%)
-- { 41400, false, false, false }, -- Thundering Skyfire Diamond (Chance to Increase Melee/Ranged Attack Speed )


}

--========================================
-- Level 80 crafted meta gems
--========================================
PawnMetaGemData80Rare =
{


------------------------------------------------------------
-- Meta gems: Earthsiege
------------------------------------------------------------

{ 41380, false, false, false, "Stamina", 32 }, -- Austere Earthsiege Diamond (2% Increased Armor Value from Items)
{ 41381, false, false, false, "Ap", 42 }, -- Persistent Earthsiege Diamond (Stun Duration Reduced by 10%)
{ 41382, false, false, false, "SpellPower", 25 }, -- Trenchant Earthsiege Diamond (Stun Duration Reduced by 10%)
{ 41385, false, false, false, "Ap", 42 }, -- Invigorating Earthsiege Diamond (Sometimes Heal on Your Crits)
{ 41389, false, false, false, "CritRating", 21 }, -- Beaming Earthsiege Diamond (+2% Mana)
{ 41395, false, false, false, "SpellPower", 25 }, -- Bracing Earthsiege Diamond (2% Reduced Threat)
{ 41396, false, false, false, "DefenseRating", 21 }, -- Eternal Earthsiege Diamond (+5% Shield Block Value)
{ 41397, false, false, false, "Stamina", 32 }, -- Powerful Earthsiege Diamond (Stun Duration Reduced by 10%)
{ 41398, false, false, false, "Agility", 21 }, -- Relentless Earthsiege Diamond (3% Increased Critical Damage)
{ 41401, false, false, false, "Intellect", 21 }, -- Insightful Earthsiege Diamond (Chance to restore mana on spellcast)


------------------------------------------------------------
-- Meta gems: Skyflare
------------------------------------------------------------

{ 41285, false, false, false, "CritRating", 21 }, -- Chaotic Skyflare Diamond (3% Increased Critical Damage)
{ 41307, false, false, false, "CritRating", 25 }, -- Destructive Skyflare Diamond (1% Spell Reflect)
{ 41333, false, false, false, "SpellPower", 25 }, -- Ember Skyflare Diamond (+2% Intellect)
{ 41335, false, false, false, "CritRating", 21 }, -- Enigmatic Skyflare Diamond (Reduces Snare/Root Duration by 10%)
{ 41339, false, false, false, "Ap", 42 }, -- Swift Skyflare Diamond (Minor Run Speed Increase)
{ 41375, false, false, false, "SpellPower", 25 }, -- Tireless Skyflare Diamond (Minor Run Speed Increase)
{ 41376, false, false, false, "Mp5", 11 }, -- Revitalizing Skyflare Diamond (3% Increased Critical Healing Effect)
{ 41377, false, false, false, "Stamina", 32 }, -- Effulgent Skyflare Diamond (Reduce Spell Damage Taken by 2%)
{ 41378, false, false, false, "SpellPower", 25 }, -- Forlorn Skyflare Diamond (Silence Duration Reduced by 10%)
{ 41379, false, false, false, "CritRating", 21 }, -- Impassive Skyflare Diamond (Fear Duration Reduced by 10%)
{ 41400, false, false, false }, -- Thundering Skyflare Diamond (Chance to Increase Melee/Ranged Attack Speed )


}

--========================================

-- The master list of all tables of Pawn gem data

PawnGemQualityLevels =
{
	{ 70, PawnLocal.GemQualityLevel70Uncommon },
	{ 71, PawnLocal.GemQualityLevel70Rare },
	{ 72, PawnLocal.GemQualityLevel70Epic },
	{ 80, PawnLocal.GemQualityLevel80Uncommon },
	{ 81, PawnLocal.GemQualityLevel80Rare },
	{ 82, PawnLocal.GemQualityLevel80Epic },
}
PawnGemQualityTables =
{
	[70] = PawnGemData70Uncommon,
	[71] = PawnGemData70Rare,
	[72] = PawnGemData70Epic,
	[80] = PawnGemData80Uncommon,
	[81] = PawnGemData80Rare,
	[82] = PawnGemData80Epic,
}
PawnDefaultGemQualityLevel = 71

PawnMetaGemQualityLevels =
{
	{ 71, PawnLocal.MetaGemQualityLevel70Rare },
	{ 81, PawnLocal.MetaGemQualityLevel70Rare },
}
PawnMetaGemQualityTables =
{
	[71] = PawnMetaGemData70Rare,
	[81] = PawnMetaGemData70Rare,
}
PawnDefaultMetaGemQualityLevel = 71
