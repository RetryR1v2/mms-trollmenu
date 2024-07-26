local VORPcore = exports.vorp_core:GetCore()
local FeatherMenu =  exports['feather-menu'].initiate()


---------------------------------------------------------------------------------
-- Get Player Data
Citizen.CreateThread(function ()
    Citizen.Wait(3000)
    TriggerServerEvent('mms-trollmenu:server:getplayerdata')
end)

RegisterNetEvent('vorp:SelectedCharacter')
AddEventHandler('vorp:SelectedCharacter', function()
    Citizen.Wait(5000)
    TriggerServerEvent('mms-trollmenu:server:getplayerdata')
end)

RegisterNetEvent('mms-trollmenu:client:recieveuserdata')
AddEventHandler('mms-trollmenu:client:recieveuserdata',function(group)
    --- CHECK IF ADMIN TO GIVE ALL MENU POPUP
    if group == Config.AdminGroup then
        RegisterCommand(Config.TrollMenuCommand, function()
            TrollMenu:Open({
                startupPage = TrollMenuPage1,
            })
        end)
    end
end)

-------- Global Triggers
local RagdollActive = false
local FreezeActive = false
local Drunken = false
local AllBigActive = false
local AllSmallActive = false
-------------------------------------- MENU ---------------------------------

Citizen.CreateThread(function()  
    TrollMenu = FeatherMenu:RegisterMenu('feather:character:TrollMenu', {
        top = '10%',
        left = '20%',
        ['720width'] = '500px',
        ['1080width'] = '700px',
        ['2kwidth'] = '700px',
        ['4kwidth'] = '800px',
        style = {
            ['border'] = '5px solid orange',
            -- ['background-image'] = 'none',
            ['background-color'] = '#FF8C00'
        },
        contentslot = {
            style = {
                ['height'] = '550px',
                ['min-height'] = '550px'
            }
        },
        draggable = true,
    --canclose = false
}, {
    opened = function()
        --print("MENU OPENED!")
    end,
    closed = function()
        --print("MENU CLOSED!")
    end,
    topage = function(data)
        --print("PAGE CHANGED ", data.pageid)
    end
})
    TrollMenuPage1 = TrollMenu:RegisterPage('seite1')
    TrollMenuPage1:RegisterElement('header', {
        value = _U('TrollMenuHeader'),
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    TrollMenuPage1:RegisterElement('line', {
        slot = 'header',
        style = {
        ['color'] = 'orange',
        }
    })
    TrollMenuPage1:RegisterElement('button', {
        label = _U('RagDollAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:SendToRagdoll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('FreezeAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:SendToFreeze')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('InvisibleAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:SetInvisible')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('DrunkenAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:DrunkenAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('OnFireAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:OnFireAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('LightningStrike'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:LightningStrike')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('MakeBigAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:MakeBigAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('MakeSmallAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:MakeSmallAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('HandcuffAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:HandcuffAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('AllToMe'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       local MyCoords = GetEntityCoords(PlayerPedId())
       TriggerEvent('mms-trollmenu:client:SendToMe',MyCoords)
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('AllToVoid'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:SendToVoid')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('InHeavenAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:InHeavenAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('KillAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:KillAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('ReviveAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:ReviveAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('TransformAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:TransformAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label = _U('ReloadAll'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
       TriggerEvent('mms-trollmenu:client:ReloadAll')
    end)
    TrollMenuPage1:RegisterElement('button', {
        label =  _U('CloseMenu'),
        style = {
            ['background-color'] = '#FF8C00',
            ['color'] = 'orange',
            ['border-radius'] = '6px'
        },
    }, function()
        TrollMenu:Close({ 
        })
    end)
    TrollMenuPage1:RegisterElement('subheader', {
        value = _U('TrollMenuHeader'),
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
    TrollMenuPage1:RegisterElement('line', {
        slot = 'footer',
        style = {
        ['color'] = 'orange',
        }
    })
end)

------------------- Ragdoll

RegisterNetEvent('mms-trollmenu:client:SendToRagdoll')
AddEventHandler('mms-trollmenu:client:SendToRagdoll',function()
    TriggerServerEvent('mms-trollmenu:server:SendToRagdoll')
end)

RegisterNetEvent('mms-trollmenu:client:Ragdoll')
AddEventHandler('mms-trollmenu:client:Ragdoll',function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    if not isDead then
        if not RagdollActive then
            RagdollActive = true
            Citizen.InvokeNative(0xAE99FB955581844A,ped,Config.RagdollTime,Config.RagdollTime,3)
            SetPedRagdollForceFall(ped)
        elseif RagdollActive then
            ResetPedRagdollTimer(ped)
            Citizen.InvokeNative(0x221F4D9912B7FE86, ped,true)
            RagdollActive = false
        end
    end
end)

----------- Freeze

RegisterNetEvent('mms-trollmenu:client:SendToFreeze')
AddEventHandler('mms-trollmenu:client:SendToFreeze',function()
    TriggerServerEvent('mms-trollmenu:server:SendToFreeze')
end)

RegisterNetEvent('mms-trollmenu:client:Freeze')
AddEventHandler('mms-trollmenu:client:Freeze',function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    if not isDead then
        if not FreezeActive then
            FreezeActive = true
            FreezeEntityPosition(PlayerPedId(), true)
        elseif FreezeActive then
            FreezeEntityPosition(PlayerPedId(), false)
            FreezeActive = false
        end
    end
end)

----------- Invisible

RegisterNetEvent('mms-trollmenu:client:SetInvisible')
AddEventHandler('mms-trollmenu:client:SetInvisible',function()
    TriggerServerEvent('mms-trollmenu:server:SetInvisible')
end)

RegisterNetEvent('mms-trollmenu:client:Invisible')
AddEventHandler('mms-trollmenu:client:Invisible',function()
    local player = PlayerPedId()
    if IsEntityVisible(player) then
        SetEntityVisible(player, false)
    else
        SetEntityVisible(player, true)
    end
end)

----------- LightningStrikePlayer

RegisterNetEvent('mms-trollmenu:client:LightningStrike')
AddEventHandler('mms-trollmenu:client:LightningStrike',function()
    TriggerServerEvent('mms-trollmenu:server:LightningStrike')
end)

RegisterNetEvent('mms-trollmenu:client:Lightning')
AddEventHandler('mms-trollmenu:client:Lightning',function()
    local coords = GetEntityCoords(PlayerPedId())
    ForceLightningFlashAtCoords(coords.x, coords.y, coords.z, -1.0)
end)

----------- MakeBigAll

RegisterNetEvent('mms-trollmenu:client:MakeBigAll')
AddEventHandler('mms-trollmenu:client:MakeBigAll',function()
    TriggerServerEvent('mms-trollmenu:server:MakeBigAll')
end)

RegisterNetEvent('mms-trollmenu:client:MakeBig')
AddEventHandler('mms-trollmenu:client:MakeBig',function()
    if not AllBigActive then
        AllBigActive = true
        while AllBigActive do
            SetPedScale(PlayerPedId(), 2.5)
            Citizen.Wait(3)
        end
    elseif AllBigActive then
        AllBigActive = false
    end
end)

----------- MakeSmallAll

RegisterNetEvent('mms-trollmenu:client:MakeSmallAll')
AddEventHandler('mms-trollmenu:client:MakeSmallAll',function()
    TriggerServerEvent('mms-trollmenu:server:MakeSmallAll')
end)

RegisterNetEvent('mms-trollmenu:client:MakeSmall')
AddEventHandler('mms-trollmenu:client:MakeSmall',function()
    if not AllSmallActive then
        AllSmallActive = true
        while AllSmallActive do
            SetPedScale(PlayerPedId(), 0.3)
            Citizen.Wait(3)
        end
    elseif AllSmallActive then
        AllSmallActive = false
    end
end)

----------- All to Me

RegisterNetEvent('mms-trollmenu:client:SendToMe')
AddEventHandler('mms-trollmenu:client:SendToMe',function(MyCoords)
    TriggerServerEvent('mms-trollmenu:server:SendToMe',MyCoords)
end)

RegisterNetEvent('mms-trollmenu:client:ToMe')
AddEventHandler('mms-trollmenu:client:ToMe',function(MyCoords)
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    if not isDead then
        SetEntityCoords(PlayerPedId(), MyCoords.x, MyCoords.y, MyCoords.z, false, false, false, false)
    end
end)

----------- All to Void

RegisterNetEvent('mms-trollmenu:client:SendToVoid')
AddEventHandler('mms-trollmenu:client:SendToVoid',function()
    TriggerServerEvent('mms-trollmenu:server:SendToVoid')
end)

RegisterNetEvent('mms-trollmenu:client:ToVoid')
AddEventHandler('mms-trollmenu:client:ToVoid',function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    if not isDead then
        SetEntityCoords(PlayerPedId(), Config.VoidCoords.x, Config.VoidCoords.y, Config.VoidCoords.z, false, false, false, false)
    end
end)

----------- Kill All

RegisterNetEvent('mms-trollmenu:client:KillAll')
AddEventHandler('mms-trollmenu:client:KillAll',function()
    TriggerServerEvent('mms-trollmenu:server:KillAll')
end)

RegisterNetEvent('mms-trollmenu:client:Kill')
AddEventHandler('mms-trollmenu:client:Kill',function()
    SetEntityHealth(PlayerPedId(), 0, 0)
end)

----------- Revive All

RegisterNetEvent('mms-trollmenu:client:ReviveAll')
AddEventHandler('mms-trollmenu:client:ReviveAll',function()
    TriggerServerEvent('mms-trollmenu:server:ReviveAll')
end)

RegisterNetEvent('mms-trollmenu:client:Revive')
AddEventHandler('mms-trollmenu:client:Revive',function()
    TriggerEvent('vorp:resurrectPlayer')
end)

----------- Transform All

RegisterNetEvent('mms-trollmenu:client:TransformAll')
AddEventHandler('mms-trollmenu:client:TransformAll',function()
    TriggerServerEvent('mms-trollmenu:server:TransformAll')
end)

RegisterNetEvent('mms-trollmenu:client:Transform')
AddEventHandler('mms-trollmenu:client:Transform',function()
    local modelHash = GetHashKey(Config.AnimalModel)
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
            Wait(1)
            end
        local player = PlayerId()
        Citizen.Wait(250)
        Citizen.InvokeNative(0xED40380076A31506, player, modelHash, false)
        Citizen.Wait(250)
        Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), false)
        Citizen.Wait(250)
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4,PlayerPedId(),4,0)
        Citizen.Wait(250)
        SetEntityMaxHealth(PlayerPedId(), 1000)
        Citizen.Wait(250)
        SetEntityHealth(PlayerPedId(), 1000)
        Citizen.Wait(250)
        SetModelAsNoLongerNeeded(modelHash)
end)

----------- ReloadChar All

RegisterNetEvent('mms-trollmenu:client:ReloadAll')
AddEventHandler('mms-trollmenu:client:ReloadAll',function()
    TriggerServerEvent('mms-trollmenu:server:ReloadAll')
end)

RegisterNetEvent('mms-trollmenu:client:Reload')
AddEventHandler('mms-trollmenu:client:Reload',function()
    Citizen.InvokeNative(0xE4CB5A3F18170381, PlayerId(), 1.0)
    ExecuteCommand('rc')
    TriggerServerEvent('mms-transform:server:rc')
end)

----------- All Drunk

RegisterNetEvent('mms-trollmenu:client:DrunkenAll')
AddEventHandler('mms-trollmenu:client:DrunkenAll',function()
    TriggerServerEvent('mms-trollmenu:server:DrunkenAll')
end)

RegisterNetEvent('mms-trollmenu:client:Drunken')
AddEventHandler('mms-trollmenu:client:Drunken',function()
    local ped = PlayerPedId()
    local isDead = IsPedDeadOrDying(ped, false)
    if not isDead then
        if not Drunken then
            Drunken = true
            Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), true, 1.3)
            AnimpostfxPlay('PlayerDrugsPoisonWell')
        elseif Drunken then
            AnimpostfxPlay('CamTransitionBlinkSlow')
		    AnimpostfxStop('PlayerDrugsPoisonWell')
		    Citizen.InvokeNative(0x406CCF555B04FAD3, PlayerPedId(), false, 0.0)
            Drunken = false
        end
    end
end)

----------- All OnFire

RegisterNetEvent('mms-trollmenu:client:OnFireAll')
AddEventHandler('mms-trollmenu:client:OnFireAll',function()
    TriggerServerEvent('mms-trollmenu:server:OnFireAll')
end)

RegisterNetEvent('mms-trollmenu:client:OnFire')
AddEventHandler('mms-trollmenu:client:OnFire',function()
    local modelHash = GetHashKey('p_campfire02xb')
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
            Wait(1)
            end
    local object = CreateObject(modelHash, 0, 0, 0, false, false, false)
    repeat Wait(0) until DoesEntityExist(object)
    AttachEntityToEntity(object, PlayerPedId(), 41, 1000, 1000, 10000, 0, 0, 0, false, false, true, false, 1000, false,
        false, false)
    Wait(5000)
    DeleteObject(object)
end)

----------- All in heaven

RegisterNetEvent('mms-trollmenu:client:InHeavenAll')
AddEventHandler('mms-trollmenu:client:InHeavenAll',function()
    TriggerServerEvent('mms-trollmenu:server:InHeavenAll')
end)

RegisterNetEvent('mms-trollmenu:client:InHeaven')
AddEventHandler('mms-trollmenu:client:InHeaven',function()
    local coords = GetEntityCoords(PlayerPedId())
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z + 200, false, false, false, false)
end)


----------- HandcuffAll

RegisterNetEvent('mms-trollmenu:client:HandcuffAll')
AddEventHandler('mms-trollmenu:client:HandcuffAll',function()
    TriggerServerEvent('mms-trollmenu:server:HandcuffAll')
end)

RegisterNetEvent('mms-trollmenu:client:Handcuff')
AddEventHandler('mms-trollmenu:client:Handcuff',function()
    local player = PlayerPedId()
    if not IsPedCuffed(player) then
        SetEnableHandcuffs(player, true, false)
    else
        SetEnableHandcuffs(player, false, false)
    end
end)

