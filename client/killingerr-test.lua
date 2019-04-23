local showDialog = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", 'ON')
    end)
end, false)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", 'OFF')
    end)
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("nui:on")
RegisterNetEvent("nui:off")

AddEventHandler("nui:on", function(value)
    SendNUIMessage({
        showDialog = true
    })
	
	TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"[System]", "Turning NUI " .. value}
	})
end)

AddEventHandler("nui:off", function(value)
    SendNUIMessage({
        showDialog = false
    })
	
	TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"[System]", "Turning NUI " .. value}
	})
end)