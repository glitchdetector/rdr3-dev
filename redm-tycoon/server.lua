RegisterServerEvent("tycoon:join")
AddEventHandler("tycoon:join", function()
	local source = source
	print("Player", GetPlayerName(source), "(" .. source .. ")", "joined", json.encode(GetPlayerIdentifiers(source)))
end)

RegisterCommand("players", function(source)
	for n, player in next, GetPlayers() do
		print(n, player, GetPlayerName(player), json.encode(GetPlayerIdentifiers(player)))
	end
end)
