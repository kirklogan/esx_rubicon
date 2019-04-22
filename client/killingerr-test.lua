local display = false

RegisterCommand("on", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:on", true)
		
		TriggerEvent('chat:addMessage', {
		  color = { 255, 0, 0},
		  multiline = false,
		  args = {"[System]", "Turning NUI On"}
		})
    end)
end, false)

RegisterCommand("off", function()
    Citizen.CreateThread(function()
        TriggerEvent("nui:off", true)
		
		TriggerEvent('chat:addMessage', {
		  color = { 255, 0, 0},
		  multiline = false,
		  args = {"[System]", "Turning NUI Off"}
		})
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