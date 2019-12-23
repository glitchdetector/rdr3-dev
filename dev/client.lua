function RunCode(code)
    local code, err = load(code, '@runcode')

    if err then
        print(err)
        return nil, err
    end

    local status, result = pcall(code)
    print(result)

    if status then
        return result
    else
        return nil, result
    end
end
RegisterCommand("crun", function(source, args, rawCommand)
    RunCode('return ' .. rawCommand:sub(5))
end)

local PROMPT = BuildPrompt(TEXT("Idk do shit?"), `INPUT_ENTER`, function(prompt)
    -- PromptSetPosition(prompt, 72.5, 28.7, 101.0)
    N_0x0c718001b77ca468(prompt, 3.0)

    local horse = 365571 -- GetMount(PlayerPedId())
    local group = Citizen.InvokeNative(0xB796970BD125FCE8, horse, Citizen.ResultAsLong()) -- PromptGetGroupIdForTargetEntity
    PromptSetGroup(prompt, group, 0)

    print(prompt)
end)
PromptSetVisible(PROMPT, true)
PromptSetEnabled(PROMPT, true)
-- AddEventHandler("onClientResourceStop", function(resourceName)
--     if resourceName == GetCurrentResourceName() then
--         PromptSetVisible(PROMPT, false)
--         PromptSetEnabled(PROMPT, false)
--         PromptDelete(PROMPT)
--     end
-- end)

-- Citizen.CreateThread(function()
--     print("start")
--     for i = 1, 1000000 do
--         if i % 10000 == 0 then
--             print(i)
--             Wait(0)
--         end
--         Citizen.CreateThread(function()
--             if PromptIsValid(i) then
--                 print("delete", i)
--                 PromptDelete(i)
--             end
--         end)
--     end
--     print("end")
-- end)

function TestThing()
    iParam0 = 1200
    Var0 = {
        0,
        0,
        0,
    }
    Var13 = {
        CreateVarString(2, "FEED_GANG_TOTAL_EARN", iParam0),
        "ITEMTYPE_TEXTURES",
        -1957849484,
        0,
        109029619,
        0,
    }
	uVar20 = N_0xb249ebcb30dd88e0(Var0, Var13, 1);
	N_0x74bcceb233ad95b2(-466562563, GetHashKey(CreateVarString(2, "FEED_GANG_TOTAL_EARN", iParam0)))
	N_0x74bcceb233ad95b2(1885309238, GetHashKey("ITEMTYPE_TEXTURES"))
	N_0x74bcceb233ad95b2(-826961056, -1957849484)
	return uVar20
end
RegisterCommand("testthing", TestThing)

function TempCToF(c)
    return ((c * 1.8) + 32.0)
end

function IsUsing24HourTime()
    return N_0x0177cf20345f44dd()
end
function IsUsingCelciusFormat()
    return N_0xff4aaf3275baab4f()
end

function GetTempAndTime(pos)
    local HOURS = 18
    local MINUTES = 21
    if MINUTES < 10 then
        MINUTES = "0" .. MINUTES
    end
    MINUTES = "" .. MINUTES
    local FORMAT = ""
    local TEMPERATURE = GetCurrentTemperateAtCoords(pos)
    local TEMPANDTIME = nil
    if not IsUsing24HourTime() then
        local SUFFIX = "AM"
        if HOURS >= 12 then
            SUFFIX = "PM"
            if HOURS > 12 then
                HOURS = HOURS - 12
            end
        elseif HOURS == 0 then
            HOURS = 12
        end
        FORMAT = "TIME_AND_TEMP_C"
        if not IsUsingCelciusFormat() then
            FORMAT = "TIME_AND_TEMP_F"
            TEMPERATURE = TempCToF(TEMPERATURE)
        end
        local TEMPTEXT = "" .. math.floor(TEMPERATURE + 0.5)
        local MINUTESSTR = CreateVarString(10, "LITERAL_STRING", MINUTES)
        local TEMPTEXTSTR = CreateVarString(10, "LITERAL_STRING", TEMPTEXT)
        TEMPANDTIME = CreateVarString(674, FORMAT, HOURS, MINUTESSTR, SUFFIX, TEMPTEXTSTR)
    else
        FORMAT = "TIME_AND_TEMP_C_24"
        if not IsUsingCelciusFormat() then
            FORMAT = "TIME_AND_TEMP_F_24"
            TEMPERATURE = TempCToF(TEMPERATURE)
        end
        local TEMPTEXT = "" .. math.floor(TEMPERATURE + 0.5)
        local MINUTESSTR = CreateVarString(10, "LITERAL_STRING", MINUTES)
        local TEMPTEXTSTR = CreateVarString(10, "LITERAL_STRING", TEMPTEXT)
        TEMPANDTIME = CreateVarString(162, FORMAT, HOURS, MINUTESSTR, TEMPTEXTSTR)
    end
    local DISTRICT = "DISTRICT_GRIZZLIES"
	uVar16 = N_0xd05590c1ab38f068(4000, 0, 0, DISTRICT, TEMPANDTIME, 0, 1);
	return uVar16
end
RegisterCommand("temp", function()
    print(GetTempAndTime(GetEntityCoords(PlayerPedId())))
end, false)

local REVERSE = {
    [`privateopensleeper02x`] = "privateopensleeper02x",
    [`privateopensleeper01x`] = "privateopensleeper01x",
    [`steamerDummy`] = "steamerDummy",
    [`armoredCar01x`] = "armoredCar01x",
    [`armoredCar03x`] = "armoredCar03x",
    [`privatebaggage01x`] = "privatebaggage01x",
    [`smuggler02`] = "smuggler02",
    [`keelboat`] = "keelboat",
    [`boatSteam02x`] = "boatSteam02x",
    [`midlandrefrigeratorCar`] = "midlandrefrigeratorCar",
    [`midlandboxcar05x`] = "midlandboxcar05x",
    [`caboose01x`] = "caboose01x",
    [`canoe`] = "canoe",
    [`canoeTreeTrunk`] = "canoeTreeTrunk",
    [`cart01`] = "cart01",
    [`cart02`] = "cart02",
    [`cart03`] = "cart03",
    [`cart04`] = "cart04",
    [`cart05`] = "cart05",
    [`cart06`] = "cart06",
    [`cart07`] = "cart07",
    [`cart08`] = "cart08",
    [`coach2`] = "coach2",
    [`coach3`] = "coach3",
    [`coach3_cutscene`] = "coach3_cutscene",
    [`coach4`] = "coach4",
    [`coach5`] = "coach5",
    [`coach6`] = "coach6",
    [`buggy01`] = "buggy01",
    [`buggy02`] = "buggy02",
    [`buggy03`] = "buggy03",
    [`ArmySupplyWagon`] = "ArmySupplyWagon",
    [`chuckwagon000x`] = "chuckwagon000x",
    [`supplywagon`] = "supplywagon",
    [`supplywagon2`] = "supplywagon2",
    [`logwagon`] = "logwagon",
    [`logwagon2`] = "logwagon2",
    [`coal_wagon`] = "coal_wagon",
    [`chuckwagon002x`] = "chuckwagon002x",
    [`gatling_gun`] = "gatling_gun",
    [`gatlingMaxim02`] = "gatlingMaxim02",
    [`handcart`] = "handcart",
    [`horseBoat`] = "horseBoat",
    [`hotAirBalloon01`] = "hotAirBalloon01",
    [`hotchkiss_cannon`] = "hotchkiss_cannon",
    [`mineCart01x`] = "mineCart01x",
    [`northflatcar01x`] = "northflatcar01x",
    [`privateflatcar01x`] = "privateflatcar01x",
    [`northpassenger01x`] = "northpassenger01x",
    [`northpassenger03x`] = "northpassenger03x",
    [`privatepassenger01x`] = "privatepassenger01x",
    [`oilWagon01x`] = "oilWagon01x",
    [`oilWagon02x`] = "oilWagon02x",
    [`pirogue`] = "pirogue",
    [`pirogue2`] = "pirogue2",
    [`policeWagon01x`] = "policeWagon01x",
    [`policeWagongatling01x`] = "policeWagongatling01x",
    [`privateCoalCar01x`] = "privateCoalCar01x",
    [`NorthCoalCar01x`] = "NorthCoalCar01x",
    [`winterSteamer`] = "winterSteamer",
    [`wintercoalcar`] = "wintercoalcar",
    [`privateboxcar04x`] = "privateboxcar04x",
    [`privateboxcar02x`] = "privateboxcar02x",
    [`privateboxcar01x`] = "privateboxcar01x",
    [`coalHopper01x`] = "coalHopper01x",
    [`privateObservationcar`] = "privateObservationcar",
    [`privateArmoured`] = "privateArmoured",
    [`privateDining01x`] = "privateDining01x",
    [`privateRooms01x`] = "privateRooms01x",
    [`privateSteamer01x`] = "privateSteamer01x",
    [`northSteamer01x`] = "northSteamer01x",
    [`GhostTrainSteamer`] = "GhostTrainSteamer",
    [`GhostTrainCoalCar`] = "GhostTrainCoalCar",
    [`GhostTrainPassenger`] = "GhostTrainPassenger",
    [`GhostTrainCaboose`] = "GhostTrainCaboose",
    [`rcBoat`] = "rcBoat",
    [`rowboat`] = "rowboat",
    [`rowboatSwamp`] = "rowboatSwamp",
    [`rowboatSwamp02`] = "rowboatSwamp02",
    [`ship_guama02`] = "ship_guama02",
    [`turbineboat`] = "turbineboat",
    [`ship_nbdGuama`] = "ship_nbdGuama",
    [`ship_nbdGuama2`] = "ship_nbdGuama2",
    [`skiff`] = "skiff",
    [`stagecoach001x`] = "stagecoach001x",
    [`stagecoach002x`] = "stagecoach002x",
    [`stagecoach003x`] = "stagecoach003x",
    [`stagecoach004x`] = "stagecoach004x",
    [`stagecoach005x`] = "stagecoach005x",
    [`stagecoach006x`] = "stagecoach006x",
    [`trolley01x`] = "trolley01x",
    [`TugBoat2`] = "TugBoat2",
    [`wagon02x`] = "wagon02x",
    [`wagon03x`] = "wagon03x",
    [`wagon04x`] = "wagon04x",
    [`wagon05x`] = "wagon05x",
    [`wagon06x`] = "wagon06x",
    [`wagonCircus01x`] = "wagonCircus01x",
    [`wagonCircus02x`] = "wagonCircus02x",
    [`wagonDoc01x`] = "wagonDoc01x",
    [`wagonPrison01x`] = "wagonPrison01x",
    [`wagonWork01x`] = "wagonWork01x",
    [`wagonDairy01x`] = "wagonDairy01x",
    [`wagonTraveller01x`] = "wagonTraveller01x",
    [`breach_cannon`] = "breach_cannon",
    [`utilliwag`] = "utilliwag",
    [`gatchuck`] = "gatchuck",
    [`gatchuck_2`] = "gatchuck_2",
}

local TRAIN_HASHES = {
    -1464742217,
    -577630801,
    -1901305252,
    -1719006020,
    519580241,
    1495948496,
    1365127661,
    -1083616881,
    1030903581,
    -2006657222,
    1285344034,
    -156591884,
    987516329,
    -1740474560,
    -651487570,
    -593637311,
    1094934838,
    1054492269,
    1216031719,

	-- (new) finale3.c
	1824681511,
	-904280534,
	-1360990987,

	-- (new) mudtown3b.c
	6161325,

	-- (new) native_son2.c
	-1458552414,

}

-- train list command (/trains)
RegisterCommand("trains", function()
    print("id", "hash", "wagons")
    for trainId, trainHash in next, TRAIN_HASHES do
        print(trainId, trainHash, N_0x635423d55ca84fc8(trainHash))
    end
end)

CURRENT_TRAIN = nil



function SpawnTrain(n)
    local trainHash = TRAIN_HASHES[n]
    local trainWagons = N_0x635423d55ca84fc8(trainHash)
    for wagonIndex = 0, trainWagons - 1 do
        local trainWagonModel = N_0x8df5f6a19f99f0d5(trainHash, wagonIndex)
        PerformRequest(trainWagonModel)
    end
    local train = N_0xc239dbd9a57d2a71(trainHash, GetEntityCoords(PlayerPedId()), 0, 0, 1, 1)
    SetTrainSpeed(train, 0.0)
    TaskWarpPedIntoVehicle(PlayerPedId(), train, -1)

    CURRENT_TRAIN_BLIP = N_0x23f74c2fda6e7c61(-399496385, train)
    CURRENT_TRAIN = train
    for wagonIndex = 0, trainWagons - 1 do
        local trainWagon = GetTrainCarriage(train, wagonIndex)
        N_0x23f74c2fda6e7c61(-700928964, trainWagon)
    end
end

-- train spawn command (/train id)
RegisterCommand("train", function(source, args, raw)
    local n = tonumber(args[1])
    SpawnTrain(n)
end)

-- char* func_914(int iParam0)
-- {
-- 	switch (iParam0)
-- 	{
-- 		case -1698780291:
-- 			return "P_CS_LEDGER01X";
-- 			break;
-- 			return "P_CS_ROPE01X";
-- 			break;
-- 			return "P_DOOR01X";
-- 			break;
-- 			return "P_DOOR03X";
-- 			break;
-- 			return "p_door12x";
-- 			break;
-- 			return "P_DOOR13X";
-- 			break;
-- 			return "p_door45x";
-- 			break;
-- 			return "p_chairvictorian01x";
-- 			break;
-- 			return "p_crate03x";
-- 			break;
-- 			return "p_cs_jug01x";
-- 			break;
-- 			return "p_cs_wagon02x";
-- 			break;
-- 			return "P_DOOR37X";
-- 			break;
-- 			return "p_door_val_genstore";
-- 			break;
-- 			return "p_doorstrawberry01x";
-- 			break;
-- 			return "p_doorfrench01l";
-- 			break;
-- 			return "p_doorfrench01r";
-- 			break;
-- 			return "p_doormansiongate01x";
-- 			break;
-- 			return "p_doornbd39x";
-- 			break;
-- 			return "p_doorsaloon02x";
-- 			break;
-- 			return "P_DOORVH_SALOON_L";
-- 			break;
-- 			return "P_DOORVH_SALOON_R";
-- 			break;
-- 			return "p_cigarlit01x";
-- 			break;
-- 			return "p_pebble01x";
-- 			break;
-- 			return "p_cs_rope03x";
-- 			break;
-- 			return "P_CARDS01X";
-- 			break;
-- 			return "P_CS_POKERHAND01X";
-- 			break;
-- 			return "P_CS_POKERHAND02X";
-- 			break;
-- 			return "P_CS_HOLDEMHAND01X";
-- 			break;
-- 			return "P_CS_HOLDEMHAND02X";
-- 			break;
-- 			return "P_CS_BUCKET01X";
-- 			break;
-- 			return "p_cs_syringe01x";
-- 			break;
-- 			return "p_bottleJD01x";
-- 			break;
-- 			return "p_rag02x";
-- 			break;
-- 			return "p_magneto02x";
-- 			break;
-- 			return "p_magneto01x";
-- 			break;
-- 			return "p_cs_wantedalive01x";
-- 			break;
-- 			return "P_CS_RCRIDETHELIGHTNING";
-- 			break;
-- 			return "p_pen01x";
-- 			break;
-- 			return "p_cs_letter01a_x";
-- 			break;
-- 			return "p_cs_electricchair01x";
-- 			break;
-- 			return "p_cs_generator01x";
-- 			break;
-- 			return "p_cs_electricHelmet01x";
-- 			break;
-- 			return "p_cs_gag01x";
-- 			break;
-- 			return "p_door_sha_man01x";
-- 			break;
-- 			return "p_stool01x";
-- 			break;
-- 			return "p_stool02x";
-- 			break;
-- 			return "p_jugglingball01x";
-- 			break;
-- 			return "p_chair02x";
-- 			break;
-- 			return "p_chair04x";
-- 			break;
-- 			return "p_crate15x";
-- 			break;
-- 			return "p_cleaver01x";
-- 			break;
-- 			return "p_bottle003x";
-- 			break;
-- 			return "p_cs_book02x";
-- 			break;
-- 			return "p_stickydymt_single";
-- 			break;
-- 			return "p_cs_fusedynamite01x";
-- 			break;
-- 			return "p_dynamite01x";
-- 			break;
-- 			return "p_cs_fusespool01x";
-- 			break;
-- 			return "p_cs_detonator01x";
-- 			break;
-- 			return "p_cs_bedrollclsd01x";
-- 			break;
-- 			return "P_CIGARETTE_CS01X";
-- 			break;
-- 			return "P_MATCHES01X";
-- 			break;
-- 			return "P_MATCHSTICK01X";
-- 			break;
-- 			return "P_WOODENCHAIR01X";
-- 			break;
-- 			return "P_CHAIR_CRATE02X";
-- 			break;
-- 			return "p_knittingneedle01x";
-- 			break;
-- 			return "p_knittingsquare01x";
-- 			break;
-- 			return "p_cs_rabbitMeat01x";
-- 			break;
-- 			return "p_cs_rabbitMeat02x";
-- 			break;
-- 			return "p_bottle03x";
-- 			break;
-- 			return "p_cs_billstack01x";
-- 			break;
-- 			return "p_cs_billSingle01x";
-- 			break;
-- 			return "p_binoculars01x";
-- 			break;
-- 			return "p_doorrhosheriff02x";
-- 			break;
-- 			return "P_BARSTOOL01X";
-- 			break;
-- 			return "p_cs_shotglass01x";
-- 			break;
-- 			return "p_lamp18x";
-- 			break;
-- 			return "p_clock06x";
-- 			break;
-- 			return "p_bottle02x";
-- 			break;
-- 			return "p_cs_lootSack01x";
-- 			break;
-- 			return "p_wineBox01x";
-- 			break;
-- 			return "p_strongBox01x";
-- 			break;
-- 			return "P_CLOCKTABLE02X";
-- 			break;
-- 			return "p_gen_statue03b";
-- 			break;
-- 			return "P_STOOLWINTER01X";
-- 			break;
-- 			return "P_CS_BARRAG01X";
-- 			break;
-- 			return "P_PLATE01X";
-- 			break;
-- 			return "P_KNIFE01X";
-- 			break;
-- 			return "P_KNIFE02X";
-- 			break;
-- 			return "P_CS_CATFISH_WHOLE01X";
-- 			break;
-- 			return "P_CS_CATFISH_WHOLE01BX";
-- 			break;
-- 			return "P_WOODWHITTLE01X";
-- 			break;
-- 			return "P_STICKFIREPOKER01X";
-- 			break;
-- 			return "P_CS_WOODPILE01X";
-- 			break;
-- 			return "P_FORK01X";
-- 			break;
-- 			return "P_KNIFE04X";
-- 			break;
-- 			return "p_knife03x";
-- 			break;
-- 			return "P_CS_BOTTLESLIM01X";
-- 			break;
-- 			return "P_CS_BLANKET01X";
-- 			break;
-- 			return "P_BEDROLLCLOSED01X";
-- 			break;
-- 			return "P_CS_KINDLING01X";
-- 			break;
-- 			return "P_CIGARTHIN01X";
-- 			break;
-- 			return "p_door_wglass01x";
-- 			break;
-- 			return "p_broom02x";
-- 			break;
-- 			return "P_AMB_CLIPBOARD_01";
-- 			break;
-- 			return "P_CHAIR07X";
-- 			break;
-- 			return "p_cs_cratetnt01x";
-- 			break;
-- 			return "p_cs_flourbag01x";
-- 			break;
-- 			return "p_cs_supplies01x";
-- 			break;
-- 			return "p_cs_supplies02x";
-- 			break;
-- 			return "p_cs_supplies03x";
-- 			break;
-- 			return "p_door04x";
-- 			break;
-- 			return "p_door11x";
-- 			break;
-- 			return "p_doorrhosaloon01_l";
-- 			break;
-- 			return "p_doorrhosaloon01_r";
-- 			break;
-- 			return "P_VAL_GATE2M02X";
-- 			break;
-- 			return "P_CS_STMDNKY01X";
-- 			break;
-- 			return "P_CS_HOOKPULLEY01X";
-- 			break;
-- 			return "P_CHAIR_CS05X";
-- 			break;
-- 			return "P_CHAIR_18X";
-- 			break;
-- 			return "P_CHAIR19X";
-- 			break;
-- 			return "P_CHAIR20X";
-- 			break;
-- 			return "P_CHAIR05X";
-- 			break;
-- 			return "p_chair22x";
-- 			break;
-- 			return "p_glass01x";
-- 			break;
-- 			return "P_DININGCHAIRS01X";
-- 			break;
-- 			return "P_WINDSORCHAIR03X";
-- 			break;
-- 			return "P_WINDSORCHAIR02X";
-- 			break;
-- 			return "p_door_val_jail02x";
-- 			break;
-- 			return "P_CRATETNT01X";
-- 			break;
-- 			return "P_CRATETNT02X";
-- 			break;
-- 			return "P_MONEYSTACK01X";
-- 			break;
-- 			return "P_AXE01X";
-- 			break;
-- 			return "P_HOE01X";
-- 			break;
-- 			return "P_SHOVEL01X";
-- 			break;
-- 			return "P_SHOVEL04X";
-- 			break;
-- 			return "P_BROOM01X";
-- 			break;
-- 			return "P_PITCHFORK01X";
-- 			break;
-- 			return "P_SCYTHE01X";
-- 			break;
-- 			return "P_SKIFF02x";
-- 			break;
-- 			return "p_door_nbx_doc01x_l";
-- 			break;
-- 			return "p_door_nbx_doc01x_r";
-- 			break;
-- 			return "p_cs_camera";
-- 			break;
-- 			return "p_cs_cameratripod";
-- 			break;
-- 			return "p_cs_camerabag01x";
-- 			break;
-- 			return "p_cameraflash01x";
-- 			break;
-- 			return "p_cs_shutterrelease";
-- 			break;
-- 			return "rowboatswamp";
-- 			break;
-- 			return "P_CHAIR25X";
-- 			break;
-- 			return "P_DOORBRAIT01BX";
-- 			break;
-- 			return "P_CS_MAP01X";
-- 			break;
-- 			return "p_hammer03x";
-- 			break;
-- 			return "p_cs_nailbarrel01x";
-- 			break;
-- 			return "p_cs_book04x";
-- 			break;
--
-- 		case -2118240499:
-- 			return "p_cs_Fan01x";
-- 			break;
-- 			return "p_cs_ledgerSmall01x";
-- 			break;
-- 			return "p_cs_envelope01x";
-- 			break;
-- 			return "p_wrappedmeat01x";
-- 			break;
-- 			return "P_CS_LETTER02X";
-- 			break;
-- 			return "p_cs_book03x";
-- 			break;
-- 			return "p_cs_giftBox01x";
-- 			break;
-- 			return "p_boiler01x";
-- 			break;
-- 			return "p_boiler02x";
-- 			break;
-- 			return "p_mugCoffee01x";
-- 			break;
-- 			return "p_glasstallbeer01x";
-- 			break;
-- 			return "p_pitcher02x";
-- 			break;
-- 			return "p_tray03x";
-- 			break;
-- 			return "p_sit_chairwicker01b";
-- 			break;
-- 			return "S_INV_ORLEANDER01CX";
-- 			break;
-- 			return "S_INV_ORLEANDER01DX";
-- 			break;
-- 			return "P_LADLE02X";
-- 			break;
-- 			return "P_CS_POT01X";
-- 			break;
-- 			return "P_CHAIRDINING03X";
-- 			break;
-- 			return "P_SPOON01X";
-- 			break;
-- 			return "P_BOWL03X";
-- 			break;
-- 			return "P_CS_BRIDECATALOGUE01X";
-- 			break;
-- 			return "P_JEWELRYBOX02BX";
-- 			break;
-- 			return "P_CS_LETTERFOLDED01X";
-- 			break;
-- 			return "P_CS_ARTHURHAT01X";
-- 			break;
-- 			return "P_OAR03X";
-- 			break;
-- 			return "P_DOOR_VAL_BANKVAULT";
-- 			break;
-- 			return "P_DOOR_COMBANK01X";
-- 			break;
-- 			return "P_CS_DONATION01X";
-- 			break;
-- 			return "p_door_nbx_bank03x_R";
-- 			break;
-- 			return "p_door_nbx_bank03x_L";
-- 			break;
-- 			return "p_camp_plate_02x";
-- 			break;
-- 			return "p_stewplate02x";
-- 			break;
-- 			return "p_cs_log01x";
-- 			break;
-- 			return "p_ndb_hotelplank01x";
-- 			break;
-- 			return "p_glass06x";
-- 			break;
-- 			return "p_cs_rag01x";
-- 			break;
-- 			return "p_inkwell01x";
-- 			break;
-- 			return "p_cigar02x";
-- 			break;
-- 			return "p_bottleBeer01x";
-- 			break;
-- 			return "p_beermugglass01x";
-- 			break;
-- 			return "p_nutBowl01x";
-- 			break;
-- 			return "p_cs_sacklarge01x";
-- 			break;
-- 			return "p_cs_dressbox01x";
-- 			break;
-- 			return "p_bell05x";
-- 			break;
-- 			return "p_woodendeskchair01x";
-- 			break;
-- 			return "p_chair06x";
-- 			break;
-- 			return "p_jug01x";
-- 			break;
-- 			return "S_INV_MEDICINE01X";
-- 			break;
-- 			return "S_INV_MEDICINE_FTY";
-- 			break;
-- 			return "S_INV_Milkweed01bx";
-- 			break;
-- 			return "p_bottleslim01x";
-- 			break;
-- 			return "p_cs_journal01x";
-- 			break;
-- 			return "p_mortarpestle02x";
-- 			break;
-- 			return "s_inv_burdock01dx";
-- 			break;
-- 			return "p_cs_ropeLegSplit";
-- 			break;
-- 			return "p_cs_ropeHandsSplit";
-- 			break;
-- 			return "p_fishingpole01x";
-- 			break;
-- 			return "P_FISHINGPOLE02X";
-- 			break;
-- 			return "p_cs_flowernecklace";
-- 			break;
-- 			return "P_CS_FLOWERS01X";
-- 			break;
-- 			return "s_inv_yarrow01cx";
-- 			break;
-- 			return "P_CS_FISHINGPOLEBAG01X";
-- 			break;
-- 			return "P_STICK02X";
-- 			break;
-- 			return "P_CS_SOCK01X";
-- 			break;
-- 			return "P_DOOR_VAL_BANK00_RX";
-- 			break;
-- 			return "P_DOOR_VAL_BANK00_RX";
-- 			break;
-- 			return "p_can10x";
-- 			break;
-- 			return "p_cs_rabbitgut";
-- 			break;
-- 			return "p_cs_rabbitheadless";
-- 			break;
-- 			return "p_cs_rabbitfeetless";
-- 			break;
-- 			return "p_kettle03x";
-- 			break;
-- 			return "s_che_woodbin01x";
-- 			break;
-- 			return "s_lootablepoorcase";
-- 			return "P_CS_BOOKHARDCV01X";
-- 			break;
-- 			return "P_LETTERBUNDLE_01X";
-- 			break;
-- 			return "P_LETTERENVELOPE_CS01X";
-- 			break;
-- 			return "P_PACKAGE08X";
-- 			break;
-- 			return "P_CIGARBOX02X";
-- 			break;
-- 			return "p_crucifix02x";
-- 			break;
-- 			return "p_bottleCrate01x";
-- 			break;
-- 			return "p_can05x";
-- 			break;
-- 			return "p_cs_suitcase04x";
-- 			break;
-- 			return "p_cs_bagstrauss01x";
-- 			break;
-- 			return "P_BOTTLE008X";
-- 			break;
-- 			return "P_BOTTLE009X";
-- 			break;
-- 			return "P_BOTTLE010X";
-- 			break;
-- 			return "p_pocketMirror01x";
-- 			break;
-- 			return "P_CIGARETTE01X";
-- 			break;
-- 			return "P_TRAVELTRUNK02X";
-- 			break;
-- 			return "P_CHAIRWHITE01X";
-- 			break;
-- 			return "P_JOURNAL_OPEN01X";
-- 			break;
-- 			return "p_table42_cs";
-- 			break;
-- 			return "p_cs_newspaper_02x";
-- 			break;
-- 			return "P_CS_POTATOSLICE01X";
-- 			break;
-- 			return "S_APLSD_LOG";
-- 			break;
-- 			return "S_APLSD_HRSATT";
-- 			break;
-- 			return "p_spittoon01x";
-- 			break;
-- 			return "p_woodbowl01x";
-- 			break;
-- 			return "p_pencil01x";
-- 			break;
-- 			return "P_SPOONMID01X";
-- 			break;
-- 			return "P_PAN01X";
-- 			break;
-- 			return "P_Pipe01x";
-- 			break;
-- 			return "p_cs_railroadbond01x";
-- 			break;
-- 			return "p_sharpeningstone01x";
-- 			break;
-- 			return "p_treestump02x";
-- 			break;
-- 			return "p_plate17x";
-- 			break;
-- 			return "p_cs_newspaper_01x";
-- 			break;
-- 			return "p_sadiehat01x";
-- 			break;
-- 			return "p_door_bla_jail_l_01x";
-- 			break;
-- 			return "p_door_bla_jail_r_01x";
-- 			break;
-- 			return "p_mashedPotato02x";
-- 			break;
-- 			return "p_cs_bookHardCv08x";
-- 			break;
-- 			return "";
-- 	}
-- }
