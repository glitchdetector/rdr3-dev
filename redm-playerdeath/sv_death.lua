RegisterServerEvent("playerdeath:respawned")
AddEventHandler("playerdeath:respawned", function()
    TriggerClientEvent("playerdeath:respawned", -1, source)
end)
