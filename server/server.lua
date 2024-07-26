local VORPcore = exports.vorp_core:GetCore()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RetryR1v2/mms-trollmenu/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

      
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('Current Version: %s'):format(currentVersion))
            versionCheckPrint('success', ('Latest Version: %s'):format(text))
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end
-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------

--- Get Player Data

RegisterServerEvent('mms-trollmenu:server:getplayerdata',function()
    local src = source
    local Character = VORPcore.getUser(src).getUsedCharacter
    local group = Character.group
    TriggerClientEvent('mms-trollmenu:client:recieveuserdata',src,group)
end)

------ Ragdoll

RegisterServerEvent('mms-trollmenu:server:SendToRagdoll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Ragdoll',player)
            end
        end
    end
end)

------ Freeeze

RegisterServerEvent('mms-trollmenu:server:SendToFreeze',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Freeze',player)
            end
        end
    end
end)

------ AllToMe

RegisterServerEvent('mms-trollmenu:server:SendToMe',function (MyCoords)
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:ToMe',player,MyCoords)
            end
        end
    end
end)

------ AllToVoid

RegisterServerEvent('mms-trollmenu:server:SendToVoid',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:ToVoid',player)
            end
        end
    end
end)

------ Kill All

RegisterServerEvent('mms-trollmenu:server:KillAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Kill',player)
            end
        end
    end
end)

------ Revive All

RegisterServerEvent('mms-trollmenu:server:ReviveAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Revive',player)
            end
        end
    end
end)

------ Invisible All

RegisterServerEvent('mms-trollmenu:server:SetInvisible',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Invisible',player)
            end
        end
    end
end)

------ LightningStrikePlayer All

RegisterServerEvent('mms-trollmenu:server:LightningStrike',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Lightning',player)
            end
        end
    end
end)

------ Transform Into Animal

RegisterServerEvent('mms-trollmenu:server:TransformAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Transform',player)
            end
        end
    end
end)

------ Reload Character

RegisterServerEvent('mms-trollmenu:server:ReloadAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Reload',player)
            end
        end
    end
end)

------ DrunkenAll

RegisterServerEvent('mms-trollmenu:server:DrunkenAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Drunken',player)
            end
        end
    end
end)

------ OnFireAll

RegisterServerEvent('mms-trollmenu:server:OnFireAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:OnFire',player)
            end
        end
    end
end)

------ InHeavenAll

RegisterServerEvent('mms-trollmenu:server:InHeavenAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:InHeaven',player)
            end
        end
    end
end)

------ HandcuffAll

RegisterServerEvent('mms-trollmenu:server:HandcuffAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:Handcuff',player)
            end
        end
    end
end)

------ MakeBigAll

RegisterServerEvent('mms-trollmenu:server:MakeBigAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:MakeBig',player)
            end
        end
    end
end)

------ MakeSmallAll

RegisterServerEvent('mms-trollmenu:server:MakeSmallAll',function ()
    local src = source
    local MyCharacter = VORPcore.getUser(src).getUsedCharacter
    local MyIdentifier = MyCharacter.identifier
    for _, player in ipairs(GetPlayers()) do
        if #GetPlayers() ~= nil then
        local Character = VORPcore.getUser(player).getUsedCharacter
        local identifier = Character.identifier
            if identifier ~= nil and identifier ~= MyIdentifier then
                TriggerClientEvent('mms-trollmenu:client:MakeSmall',player)
            end
        end
    end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()