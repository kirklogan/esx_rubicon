RegisterCommand("help", function(source)
    TriggerClientEvent("chatMessage", -1, tostring(GetPlayerName(source) .. " asked for help. But fuck that guy."))
end)