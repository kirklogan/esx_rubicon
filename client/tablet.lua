ESX              = nil
PlayerData       = {}
local showTablet = false

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("tablet", function()
    if showTablet == true then
		TriggerEvent("tablet:off")
	else
		TriggerEvent("tablet:on")
	end
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("tablet:on")
RegisterNetEvent("tablet:off")

AddEventHandler("tablet:on", function(value)
	SetNuiFocus(true,true)
	showTablet = true
    SendNUIMessage({
        showTablet = true,
		playerData = PlayerData
    })
end)

AddEventHandler("tablet:off", function(value)
	SetNuiFocus(false)
	showTablet = false
    SendNUIMessage({
        showTablet = false
    })
end)

RegisterNUICallback('escape', function(data, cb)
	TriggerEvent('tablet:off')
	cb('ok')
end)

RegisterNUICallback('F3', function(data, cb)
	TriggerEvent('tablet:on')
	cb('ok')
end)