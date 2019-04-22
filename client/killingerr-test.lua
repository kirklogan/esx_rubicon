local display = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", 'On')
    end)
end, false)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", 'Off')
    end)
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("nui:on")
RegisterNetEvent("nui:off")

AddEventHandler("nui:on", function(value)
    SendNUIMessage({
        type = "ui",
        display = true
    })
	
	TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"[System]", "Turning NUI " .. value}
	})
end)

AddEventHandler("nui:off", function(value)
    SendNUIMessage({
        type = "ui",
        display = false
    })
	
	TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"[System]", "Turning NUI " .. value}
	})
end)