Citizen.CreateThread(function()
    while true do
        local player = PlayerId()
        local ped = PlayerPedId()
        if IsPlayerDead(player) then
            DoScreenFadeOut(2000)
            while not IsScreenFadedOut() do Wait(0) end
            Wait(500)
            ResurrectPed(ped)
            Wait(500)
            DoScreenFadeIn(2000)
            while not IsScreenFadedIn() do Wait(0) end
            TriggerServerEvent("playerdeath:respawned")
        end
        Wait(100)
    end
end)

RegisterCommand("coma", function()
    ApplyDamageToPed(PlayerPedId(), 1000, 1000, 1000, 1000, 1000)
end, false)
