ESX = nil
PlayerData = {}
local showDialog = false

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("tablet", function()
    if showDialog == true then
        TriggerEvent("tablet:off")
    else
        TriggerEvent("tablet:on")
    end
end, false)

--//////////////////////////////////////////--

RegisterNetEvent("tablet:on")
RegisterNetEvent("tablet:off")

AddEventHandler("tablet:on", function(value)
    SetNuiFocus(true, true)
    showDialog = true
    SendNUIMessage({
        showDialog = true,
        playerData = PlayerData
    })
end)

AddEventHandler("tablet:off", function(value)
    SetNuiFocus(false)
    showDialog = false
    SendNUIMessage({
        showDialog = false
    })
end)

RegisterNUICallback('tabletoff', function(data, cb)
    TriggerEvent('tablet:off')
    cb('ok')
end)

RegisterNUICallback('javascriptError', function(data, cb)
    TriggerEvent('tablet:off')
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0 },
        multiline = true,
        args = { 'Javascript Error: ', data }
    })
    cb('ok')
end)