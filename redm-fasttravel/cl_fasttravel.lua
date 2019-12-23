local TRAIN_STATIONS = {
    [5] = {
        name = "Saint Denis",
        label = "REGION_BAY_SAINT_DENIS",
        trainSpawns = {
            {vector3(2643.1, -1482.2, 45.5), true, 0},
            {vector3(2643.1, -1482.2, 45.5), false, 0},
        },
        prices = {
            [23] = 750,
            [28] = 1250,
            [69] = 320,
            [76] = 1000,
            [78] = 510,
            [105] = 480,
        },
        func_48 = 1,
        afterTravelSpawn = vector4(2755.556, -1418.491, 45.2074, 145.0),
        vendors = {
            vector3(2748.811, -1398.277, 45.18309), -- 50 Saint Denis inside
            vector3(2747.824, -1396.384, 45.18309), -- Saint Denis outside
        },
    },
    [23] = {
        name = "Riggs",
        label = "REGION_BGV_RIGGS_STATION",
        trainSpawns = {
            {vector3(-1143.0, -545.4, 86.6), true, 0},
            {vector3(-1067.019, -604.0603, 78.0298), false, 0},
        },
        prices = {
            [5] = 750,
            [28] = 420,
            [69] = 630,
            [76] = 460,
            [78] = 1050,
            [105] = 390,
        },
        func_48 = 0,
        afterTravelSpawn = vector4(-1101.923, -574.2673, 81.27955, 0.85),
        vendors = {
            vector3(-1092.88, -575.69, 81.41), -- Riggs
            vector3(-1094.35, -577.48, 81.41), -- Riggs
        },
    },
    [28] = {
        name = "Wallace",
        label = "REGION_BGV_WALLACE_STATION",
        trainSpawns = {
            {vector3(-1280, 477.1, 93.7), true, 0},
            {vector3(-1333.328, 374.2152, 94.938), false, 0},
        },
        prices = {
            [5] = 1250,
            [23] = 420,
            [69] = 920,
            [76] = 360,
            [78] = 880,
            [105] = 750,
        },
        func_48 = 0,
        afterTravelSpawn = vector4(-1314.075, 387.0378, 94.41888, 72.5),
        vendors = {
            vector3(-1300.83, 399.7599, 94.38248), -- Wallace Station
            vector3(-1299.891, 401.3615, 94.38248), -- Wallace Station
        },
    },
    [69] = { -- nice
        name = "Emerald Ranch",
        label = "REGION_HRT_EMERALDRANCH",
        trainSpawns = {
            {vector3(1529.7, 477.9, 90.2), true, 1},
            {vector3(1529.595, 405.6096, 89.3616), false, 1},
        },
        prices = {
            [5] = 320,
            [23] = 630,
            [28] = 920,
            [76] = 220,
            [78] = 440,
            [105] = 590,
        },
        func_48 = 1,
        afterTravelSpawn = vector4(1521.333, 419.062, 88.96367, 4.0),
        vendors = {
            vector3(1521.91, 441.15, 89.68), -- Emerald Ranch
            vector3(1523.63, 442.65, 89.68), -- Emerald Ranch
        },
    },
    [76] = {
        name = "Valentine",
        label = "REGION_HRT_VALENTINE",
        trainSpawns = {
            {vector3(-190.6, 589.1, 113.2), true, 0},
            {vector3(-136.938, 659.54, 112.672), false, 0.0},
        },
        prices = {
            [5] = 1000,
            [23] = 460,
            [28] = 360,
            [69] = 220,
            [78] = 670,
            [105] = 790,
        },
        func_48 = 1,
        afterTravelSpawn = vector4(-168.7946, 646.7418, 112.5389, -122),
        vendors = {
            vector3(-178.0316, 628.0621, 113.0896), -- Valentine Station Post
            vector3(-175.0377, 631.7999, 113.0896), -- Valentine Station Tickets
        },
    },
    [78] = {
        name = "Annesburg",
        label = "REGION_ROA_ANNESBURG",
        trainSpawns = {
            {vector3(2884.136, 1211.772, 44.32313), true, 0},
            {vector3(2978.219, 1344.3, 42.941), false, 0},
        },
        prices = {
            [5] = 210,
            [23] = 1050,
            [28] = 880,
            [69] = 440,
            [76] = 670,
            [105] = 840,
        },
        func_48 = 1,
        afterTravelSpawn = vector4(2920.64, 1273.347, 43.50124, 2.0),
        vendors = {
            vector3(2939.063, 1287.116, 43.6529), -- Annesburg
            vector3(2932.97, 1282.56, 43.67), -- Annesburg
        },
    },
    [105] = {
        name = "Rhodes",
        label = "REGION_SCM_RHODES",
        trainSpawns = {
            {vector3(1196.2, -1281.2, 76.6), true, 0},
            {vector3(1307.31, -1382.5, 75.3375), false, 0},
        },
        prices = {
            [5] = 480,
            [23] = 390,
            [28] = 750,
            [69] = 590,
            [76] = 790,
            [78] = 840,
        },
        func_48 = 0,
        afterTravelSpawn = vector4(1256.509, -1317.039, 75.2567, 2.0),
        vendors = {
            vector3(1226.71, -1295.08, 75.9), -- Rhodes
            vector3(1230.34, -1298.578, 75.9027), -- Rhodes
        },
    },
}

function FastTravel(pos)
    local ped = PlayerPedId()
    DoScreenFadeOut(2000)
    while not IsScreenFadedOut() do Wait(0) end
    StartPlayerTeleport(PlayerId(), pos.x, pos.y, pos.z, pos.w, 1, 1, 1, 0)
    while IsPlayerTeleportActive() or not HasPlayerTeleportFinished(PlayerId()) do
        Wait(0)
    end
    DoScreenFadeIn(2000)
    while not IsScreenFadedIn() do Wait(0) end
end

local currentStation = nil
Citizen.CreateThread(function()
    for id, station in next, TRAIN_STATIONS do
        station.prompt = BuildPrompt(TEXT(station.name .. " Station"), `INPUT_ENTER`, function(prompt)
            PromptSetHoldMode(prompt, 1000)
        end)
        station.blip = AddBlipForCoord(-678244495, station.vendors[1].x, station.vendors[1].y, station.vendors[1].z)
        SetBlipSprite(station.blip, -1822497728)
        SetBlipName(station.blip, "Train Station")
    end
    WarMenu.CreateMenu("fasttravel_main", "Train Tickets")
    local currentPrompt = nil
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local stationId = nil
        local vendorId = nil
        for id, station in next, TRAIN_STATIONS do
            for vendor, stationPos in next, station.vendors do
                local dist = #(pos - stationPos)
                if dist < 3.0 then
                    stationId = id
                    vendorId = vendor
                    break
                end
            end
            if stationId then break end
        end
        if stationId then
            local station = TRAIN_STATIONS[stationId]
            -- Show prompt!
            if not currentPrompt then
                currentPrompt = station.prompt
                PromptSetEnabled(currentPrompt, true)
                PromptSetVisible(currentPrompt, true)
            end
            local held = PromptHasHoldModeCompleted(currentPrompt)
            if held and held ~= 0 then
                currentStation = stationId
                PromptSetEnabled(currentPrompt, false)
                PromptSetVisible(currentPrompt, false)
                currentPrompt = nil
            end
        else
            -- Hide prompt!
            if currentPrompt then
                PromptSetEnabled(currentPrompt, false)
                PromptSetVisible(currentPrompt, false)
                currentPrompt = nil
            end
            currentStation = nil
        end
        if currentStation then
            local station = TRAIN_STATIONS[currentStation]
            WarMenu.SetSubTitle("fasttravel_main", station.name .. " Station")
            WarMenu.OpenMenu("fasttravel_main")
            while WarMenu.IsMenuOpened("fasttravel_main") do
                for targetId, price in next, station.prices do
                    local target = TRAIN_STATIONS[targetId]
                    if WarMenu.Button(target.name, price) then
                        WarMenu.CloseMenu()
                        currentStation = nil
                        FastTravel(target.afterTravelSpawn)
                    end
                end
                WarMenu.Display()
                Wait(0)
            end
            currentStation = nil
        end
        Wait(0)
    end
end)
