--[[ 
    /atlasloot updatecache startID stopID
    scans every id from 1 to 10 mil unless you set the startID and stopID
    startID is the first itemid it will check stopID is the last itemid it will check

    /atlasloot clearcache
    clears variables cache
 ]]

ItemIDsDatabaseCorrectedIDs = {}
--ItemIDsDatabaseCorrectedIDs[30312] = { Bloodforged, Heroic Bloodforged, Normal(is always nil), HeroicID, MythicID, AscendedID }

--T3
ItemIDsDatabaseCorrectedIDs[22491] = { nil, nil, nil, 322491, 1322491, 222491 }
ItemIDsDatabaseCorrectedIDs[22493] = { nil, nil, nil, 322493, 1322493, 222493 }
ItemIDsDatabaseCorrectedIDs[22489] = { nil, nil, nil, 322489, 1322489, 222489 }
ItemIDsDatabaseCorrectedIDs[1507043] = { nil, nil, nil, 1807043, 2807043, 1707043 }
ItemIDsDatabaseCorrectedIDs[1523064] = { nil, nil, nil, 1823064, 2823064, 1723064 }

ItemIDsDatabaseCorrectedIDs[16900] = { nil, nil, nil, 316921, 1316921, 216921 }

--T2 helms
ItemIDsDatabaseCorrectedIDs[16939] = { nil, nil, nil, 316939, 1316939, 216939 }
ItemIDsDatabaseCorrectedIDs[16914] = { nil, nil, nil, 316914, 1316914, 216914 }
ItemIDsDatabaseCorrectedIDs[16955] = { nil, nil, nil, 316955, 1316955, 216955 }
ItemIDsDatabaseCorrectedIDs[16921] = { nil, nil, nil, 316921, 1316921, 216921 }
ItemIDsDatabaseCorrectedIDs[16908] = { nil, nil, nil, 316908, 1316908, 216908 }
ItemIDsDatabaseCorrectedIDs[16947] = { nil, nil, nil, 316947, 1316947, 216947 }
ItemIDsDatabaseCorrectedIDs[10962] = { nil, nil, nil, 310962, 1310962, 210962 }
ItemIDsDatabaseCorrectedIDs[16929] = { nil, nil, nil, 316929, 1316929, 216929 }
ItemIDsDatabaseCorrectedIDs[10904] = { nil, nil, nil, 310904, 1310904, 210904 }
ItemIDsDatabaseCorrectedIDs[16963] = { nil, nil, nil, 316963, 1316963, 216963 }
ItemIDsDatabaseCorrectedIDs[1516955] = { nil, nil, nil, 1816955, 2816955, 1716955 }
ItemIDsDatabaseCorrectedIDs[1516921] = { nil, nil, nil, 1816921, 2816921, 1716921 }
ItemIDsDatabaseCorrectedIDs[1516947] = { nil, nil, nil, 1816947, 2816947, 1716947 }
ItemIDsDatabaseCorrectedIDs[1516963] = { nil, nil, nil, 1816963, 2816963, 1716963 }
ItemIDsDatabaseCorrectedIDs[1516900] = { nil, nil, nil, 1816900, 2816900, 1716900 }
ItemIDsDatabaseCorrectedIDs[1516892] = { nil, nil, nil, 1816892, 2816892, 1716892 }


--ZA Bears
ItemIDsDatabaseCorrectedIDs[1333809] = { nil, nil, nil, 1433809, nil, 1233809 }

--intact vial of kael'thas sunstrider
ItemIDsDatabaseCorrectedIDs[450001] = { nil, nil, nil, 450003, 1450003, 450005 }
ItemIDsDatabaseCorrectedIDs[450000] = { nil, nil, nil, 450002, 1450002, 450004 }

ItemIDsDatabaseCorrectedIDs[450009] = {nil, nil, nil, 450011, 450013, 450015 }; --The String of Time

--Atiesh, Greatstaff of the Guardian
ItemIDsDatabaseCorrectedIDs[22589] = { 6022589, 6322589, nil, 322589, 1322589, 222589 }
ItemIDsDatabaseCorrectedIDs[22632] = { 6022632, 6322632, nil, 322632, 1322632, 222632 }
ItemIDsDatabaseCorrectedIDs[22631] = { 6022631, 6322631, nil, 322631, 1322631, 222631 }
ItemIDsDatabaseCorrectedIDs[22630] = { 6022630, 6322630, nil, 322630, 1322630, 222630 }

--Mark of the Champion
ItemIDsDatabaseCorrectedIDs[23207] = { nil, nil, nil, 323207, 1323207, 223207 }
ItemIDsDatabaseCorrectedIDs[23206] = { nil, nil, nil, 323206, 1323206, 223206 }

ItemIDsDatabaseCorrectedIDs[30889] = { nil, nil, nil, 330889, 1330889, 230889 } --Kaz'rogal's Hardened Heart

--Frozen Reach

ItemIDsDatabaseCorrectedIDs[1529392] = { 7529392, nil, nil, 1539392, 1549392 } --Frigid Bow of the Bonded Souls
ItemIDsDatabaseCorrectedIDs[1529391] = { 7529391, nil, nil, 1539391, 1549391 } --Reclaimed Blade of the Frozen Sepulcher
ItemIDsDatabaseCorrectedIDs[1529390] = { 7529390, nil, nil, 1539390, 1549390 } --Arktos' Resillience
ItemIDsDatabaseCorrectedIDs[1529389] = { 7529389, nil, nil, 1539389, 1549389 } --Call of the Sepulcher
ItemIDsDatabaseCorrectedIDs[1529388] = { 7529388, nil, nil, 1539388, 1549388 } --Frozen Vengeance
ItemIDsDatabaseCorrectedIDs[1529387] = { 7529387, nil, nil, 1539387, 1549387 } --Frozen Forgiveness
ItemIDsDatabaseCorrectedIDs[1529386] = { 7529386, nil, nil, 1539386, 1549386 } --Alva's Kinship Ring
ItemIDsDatabaseCorrectedIDs[1529385] = { 7529385, nil, nil, 1539385, 1549385 } --Signet of Arktos
ItemIDsDatabaseCorrectedIDs[1529384] = { 7529384, nil, nil, 1539384, 1549384 } --Ring of Bonded Souls
ItemIDsDatabaseCorrectedIDs[1529383] = { 7529383, nil, nil, 1539383, 1549383 } --Ring of the Frozen Sepulcher
ItemIDsDatabaseCorrectedIDs[1529382] = { 7529382, nil, nil, 1539382, 1549382 } --Alva's Gift
ItemIDsDatabaseCorrectedIDs[1529381] = { 7529381, nil, nil, 1539381, 1549381 } --Beartooth Pendant
ItemIDsDatabaseCorrectedIDs[1529380] = { 7529380, nil, nil, 1539380, 1549380 } --Necklace of Frozen Reach
ItemIDsDatabaseCorrectedIDs[1529379] = { 7529379, nil, nil, 1539379, 1549379 } --Amulet of the Bonded Souls

ItemIDsDatabaseCorrectedIDs[228836] = { 75228836, nil, nil, [5] = 228836, [35] = 229836 } --Soul Cage Reliquary

-- Kara Crypts 60

ItemIDsDatabaseCorrectedIDs[255061] = {6255061,nil,nil,255063,255073,255083,255093,255103} --Blossom of Sorrow
ItemIDsDatabaseCorrectedIDs[254174] = {6254174,nil,nil,254176,254186,254196,254206,254216} --Bonelink Greaves
ItemIDsDatabaseCorrectedIDs[254575] = {6254575,nil,nil,254577,254587,254597,254607,254617} --Bonelink Legguards
ItemIDsDatabaseCorrectedIDs[254941] = {6254941,nil,nil,254943,254953,254963,254973,254983} --Bonelink Mantle
ItemIDsDatabaseCorrectedIDs[255104] = {6255104,nil,nil,255106,255116,255126,255136,255146} --Concentrated Death
ItemIDsDatabaseCorrectedIDs[253053] = {6253053,nil,nil,253055,253065,253075,253085,253095} --Conduit of Sinners
ItemIDsDatabaseCorrectedIDs[253442] = {6253442,nil,nil,253444,253454,253464,253474,253484}	--Cryptsteel Maul
ItemIDsDatabaseCorrectedIDs[253634] = {6253634,nil,nil,253636,253646,253656,253666,253676} --Dakrya, Hand of the Second Eidolon
ItemIDsDatabaseCorrectedIDs[254131] = {6254131,nil,nil,254133,254143,254153,254163,254173} --Deathsworn Boots
ItemIDsDatabaseCorrectedIDs[254532] = {6254532,nil,nil,254534,254544,254554,254564,254574} --Deathsworn Pants
ItemIDsDatabaseCorrectedIDs[254888] = {6254888,nil,nil,254890,254900,254910,254920,254930} --Deathsworn Spaulders
ItemIDsDatabaseCorrectedIDs[254346] = {6254346,nil,nil,254348,254358,254368,254378,254388} --Decaying Orb of Blood
ItemIDsDatabaseCorrectedIDs[253763] = {6253763,nil,nil,253765,253775,253785,253795,253805} --Drape of the Horse
ItemIDsDatabaseCorrectedIDs[253677] = {6253677,nil,nil,253679,253689,253699,253709,253719} --Forgiveness
ItemIDsDatabaseCorrectedIDs[254715] = {6254715,nil,nil,254717,254727,254737,254747,254757} --Forgotten Aegis of Kings
ItemIDsDatabaseCorrectedIDs[254845] = {6254845,nil,nil,254847,254857,254867,254877,254887} --Funeral Mantle
ItemIDsDatabaseCorrectedIDs[254088] = {6254088,nil,nil,254090,254100,254110,254120,254130} --Funeral Treads
ItemIDsDatabaseCorrectedIDs[254432] = {6254432,nil,nil,254434,254444,254454,254464,254474} --Funeral Trouser
ItemIDsDatabaseCorrectedIDs[253004] = {6253004,nil,nil,253006,253016,253026,253036,253046} --Ghoul Spine Cleaver
ItemIDsDatabaseCorrectedIDs[254303] = {6254303,nil,nil,254305,254315,254325,254335,254345} --Missing Promise
ItemIDsDatabaseCorrectedIDs[253720] = {6253720,nil,nil,253722,253732,253742,253752,253762} --Mourner's Cloak
ItemIDsDatabaseCorrectedIDs[254672] = {6254672,nil,nil,254674,254684,254694,254704,254714} --Niko's Amulet
ItemIDsDatabaseCorrectedIDs[254389] = {6254389,nil,nil,254391,254401,254411,254421,254431} --Purified Vitae Chalice
ItemIDsDatabaseCorrectedIDs[254260] = {6254260,nil,nil,254262,254272,254282,254292,254302} --Remembrance of Aegwynn
ItemIDsDatabaseCorrectedIDs[253151] = {6253151,nil,nil,253153,253163,253173,253183,253193} --Sorrow of the Eclipse
ItemIDsDatabaseCorrectedIDs[254629] = {6254629,nil,nil,254631,254641,254651,254661,254671} --Soulsteel Legplates
ItemIDsDatabaseCorrectedIDs[254217] = {6254217,nil,nil,254219,254229,254239,254249,254259} --Soulsteel Sabatons
ItemIDsDatabaseCorrectedIDs[254984] = {6254984,nil,nil,254986,254996,255006,255016,255026} --Soulsteel Shoulderguards
ItemIDsDatabaseCorrectedIDs[253102] = {6253102,nil,nil,253104,253114,253124,253134,253144} --Spinesplinter Arbalest
ItemIDsDatabaseCorrectedIDs[254758] = {6254758,nil,nil,254760,254770,254780,254790,254800} --Tombstone Cover
ItemIDsDatabaseCorrectedIDs[252906] = {6252906,nil,nil,252908,252918,252928,252938,252948} --Twinglaive of Eternal Slumber
ItemIDsDatabaseCorrectedIDs[252821] = {6252821,nil,nil,252823,252833,252843,252853,252863} --Twinglaive of the Vampire Council

-- Kara Crypts 70

ItemIDsDatabaseCorrectedIDs[259870] = {6259870,nil,nil,259872,259882,259892,259902,259912} --Blossom of Sorrow
ItemIDsDatabaseCorrectedIDs[260052] = {6260052,nil,nil,260054,260064,260074,260084,260094} --Bonelink Grasps
ItemIDsDatabaseCorrectedIDs[257673] = {6257673,nil,nil,257675,257685,257695,257705,257715} --Bonelink Greaves
ItemIDsDatabaseCorrectedIDs[259451] = {6259451,nil,nil,259453,259463,259473,259483,259493} --Bonelink Legguards
ItemIDsDatabaseCorrectedIDs[259784] = {6259784,nil,nil,259786,259796,259806,259816,259826} --Bonelink Mantle
ItemIDsDatabaseCorrectedIDs[259913] = {6259913,nil,nil,259915,259925,259935,259945,259955} --Concentrated Death
ItemIDsDatabaseCorrectedIDs[255373] = {6255373,nil,nil,255375,255385,255395,255405,255415}  --Conduit of Sinners
ItemIDsDatabaseCorrectedIDs[255720] = {6255720,nil,nil,255722,255732,255742,255752,255762} --Cryptsteel Maul
ItemIDsDatabaseCorrectedIDs[255809] = {6255809,nil,nil,255811,255821,255831,255841,255851} --Dakrya, Hand of the Second Eidolon
ItemIDsDatabaseCorrectedIDs[257221] = {6257221,nil,nil,257223,257233,257243,257253,257263} --Deathsworn Boots
ItemIDsDatabaseCorrectedIDs[260009] = {6260009,nil,nil,260011,260021,260031,260041,260051} --Deathsworn Handguards
ItemIDsDatabaseCorrectedIDs[259408] = {6259408,nil,nil,259410,259420,259430,259440,259450} --Deathsworn Pants
ItemIDsDatabaseCorrectedIDs[259741] = {6259741,nil,nil,259743,259753,259763,259773,259783} --Deathsworn Spaulders
ItemIDsDatabaseCorrectedIDs[259047] = {6259047,nil,nil,259049,259059,259069,259079,259089} --Decaying Orb of Blood
ItemIDsDatabaseCorrectedIDs[257135] = {6257135,nil,nil,257137,257147,257157,257167,257177} --Drape of the Horse
ItemIDsDatabaseCorrectedIDs[255917] = {6255917,nil,nil,255919,255929,255939,255949,255959} --Forgiveness
ItemIDsDatabaseCorrectedIDs[259580] = {6259580,nil,nil,259582,259592,259602,259612,259622} --Forgotten Aegis of Kings
ItemIDsDatabaseCorrectedIDs[259966] = {6259966,nil,nil,259968,259978,259988,259998,260008} --Funeral Handwraps
ItemIDsDatabaseCorrectedIDs[259698] = {6259698,nil,nil,259700,259710,259720,259730,259740} --Funeral Mantle
ItemIDsDatabaseCorrectedIDs[257178] = {6257178,nil,nil,257180,257190,257200,257210,257220} --Funeral Treads
ItemIDsDatabaseCorrectedIDs[259365] = {6259365,nil,nil,259367,259377,259387,259397,259407} --Funeral Trousers
ItemIDsDatabaseCorrectedIDs[255301] = {6255301,nil,nil,255303,255313,255323,255333,255343} --Ghoul Spine Cleaver
ItemIDsDatabaseCorrectedIDs[258836] = {6258836,nil,nil,258838,258848,258858,258868,258878} --Missing Promise
ItemIDsDatabaseCorrectedIDs[257092] = {6257092,nil,nil,257094,257104,257114,257124,257134} --Mourner's Cloak
ItemIDsDatabaseCorrectedIDs[259537] = {6259537,nil,nil,259539,259549,259559,259569,259579} --Niko's Amulet
ItemIDsDatabaseCorrectedIDs[259322] = {6259322,nil,nil,259324,259334,259344,259354,259364} --Purified Vitae Chalice
ItemIDsDatabaseCorrectedIDs[258412] = {6258412,nil,nil,258414,258424,258434,258444,258454} --Remembrance of Aegwynn
ItemIDsDatabaseCorrectedIDs[255677] = {6255677,nil,nil,255679,255689,255699,255709,255719} --Sorrow of the Eclipse
ItemIDsDatabaseCorrectedIDs[260936] = {6260936,nil,nil,260938,260948,260958,260968,260978} --Soulfire Torch
ItemIDsDatabaseCorrectedIDs[260095] = {6260095,nil,nil,260097,260107,260117,260127,260137} --Soulsteel Gauntlets
ItemIDsDatabaseCorrectedIDs[259494] = {6259494,nil,nil,259496,259506,259516,259526,259536} --Soulsteel Legplates
ItemIDsDatabaseCorrectedIDs[257716] = {6257716,nil,nil,257718,257728,257738,257748,257758} --Soulsteel Sabatons
ItemIDsDatabaseCorrectedIDs[259827] = {6259827,nil,nil,259829,259839,259849,259859,259869} --Soulsteel Shoulderguards
ItemIDsDatabaseCorrectedIDs[255509] = {6255509,nil,nil,255511,255521,255531,255541,255551} --Spinesplinter Arbalest
ItemIDsDatabaseCorrectedIDs[259655] = {6259655,nil,nil,259657,259667,259677,259687,259697} --Tombstone Cover
ItemIDsDatabaseCorrectedIDs[255212] = {6255212,nil,nil,255214,255224,255234,255244,255254} --Twinglaive of Eternal Slumber
ItemIDsDatabaseCorrectedIDs[255169] = {6255169,nil,nil,255171,255181,255191,255201,255211} --Twinglaive of the Vampire Council



