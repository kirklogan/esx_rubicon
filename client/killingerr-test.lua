local display = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
		TriggerEvent('chat:addMessage', {
		  color = { 255, 0, 0},
		  multiline = false,
		  args = {"[System]", "Turning NUI On"}
		})
	
        TriggerEvent("nui:on", true)
    end)
end, false)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
		TriggerEvent('chat:addMessage', {
		  color = { 255, 0, 0},
		  multiline = false,
		  args = {"[System]", "Turning NUI Off"}
		})
	
        TriggerEvent("nui:off", true)
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
end)

AddEventHandler("nui:off", function(value)
    SendNUIMessage({
        type = "ui",
        display = false
    })
end)