local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
PlayerData = nil
local showTablet = false
SetNuiFocus(false)

--//////////DEBUG FUNCTION//////////--
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

--//////////THREADS//////////--
Citizen.CreateThread(function()
    SetNuiFocus(false)

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end

    while PlayerData == nil do
        PlayerData = ESX.GetPlayerData()
        Citizen.Wait(10)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Keys['F3']) then
            if showTablet then
                TriggerEvent('tablet:off')
            else
                TriggerEvent('tablet:on')
            end
        end
    end
end)

--//////////NET EVENTS//////////--
RegisterNetEvent("tablet:on")
RegisterNetEvent("tablet:off")
RegisterNetEvent("tablet:refresh")

AddEventHandler("tablet:on", function(value)
    PlayerData = ESX.GetPlayerData()
    SetNuiFocus(true, true)
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

AddEventHandler("tablet:refresh", function(value)
    PlayerData = ESX.GetPlayerData()
    SendNUIMessage({
        playerData = PlayerData
    })
end)

--//////////NUI CALLBACKS (THESE ARE ACCESSIBLE FROM JAVASCRIPT)//////////--
RegisterNUICallback('openTablet', function(data, cb)
    TriggerEvent('tablet:on')
    cb('ok')
end)

RegisterNUICallback('closeTablet', function(data, cb)
    TriggerEvent('tablet:off')
    cb('ok')
end)

RegisterNUICallback('useItem', function(itemName, cb)
    TriggerServerEvent('esx:useItem', itemName)
    Citizen.Wait(300)
    TriggerEvent('tablet:refresh')
    cb('ok')
end)

RegisterNUICallback('javascriptError', function(data, cb)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0 },
        multiline = true,
        args = { 'Javascript Error: ', data }
    })
    cb('ok')
end)