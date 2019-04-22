local display = false

RegisterCommand("testMeDaddy", function(source, args)
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"Daddy", "Testing you"}
	})
end, false)

RegisterCommand("on", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
    end)
end, false)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
    end)
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("nui:on")
RegisterNetEvent("nui:off")

AddEventHandler("nui:on", function(value)
    SendNUIMessage({
        type = "ui"
        display = true
    })
end)

AddEventHandler("nui:off", function(value)
    SendNUIMessage({
        type = "ui"
        display = false
    })
end)