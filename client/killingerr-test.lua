local display = false

RegisterCommand("shittyTest", function(source, args)
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = true,
	  args = {"HelpBot", "Here are some useful commands:\nPress F2 for inventory\nPress F6 for job related abilities\nPress F1 for your phone"}
	})
end, false)

RegisterCommand("on", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
    end)
end)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
end)

--//////////////////////////////////////////--

RegisterNetEvent("nui:on")
AddEventHandler("nui:on", function(value)
    SendNUIMessage({
        type = "ui"
        display = true
    })
end)

RegisterNetEvent("nui:off")
AddEventHandler("nui:off", function(value)
    SendNUIMessage({
        type = "ui"
        display = true
    })
end)