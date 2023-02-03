 
 ESX = exports["es_extended"]:getSharedObject()  
 
local options = {
    {
        name = 'ox:option1',
        event = 'bag:open',
        icon = 'fa-solid fa-suitcase',
        label = '打开背包',
   
    },
    {
        name = 'ox:option2',
        event = 'bag:close',
        icon = 'fa-solid fa-suitcase',
        label = '拿取背包',
    }
}

local optionNames = { 'ox:option1', 'ox:option2' }
local models = {'xm_prop_x17_bag_01c'}


exports.ox_target:addModel(models, options)

RegisterNetEvent('bag:open')
AddEventHandler('bag:open', function()
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'bag', 1.0)
    exports['fivem-appearance']:openWardrobe()
end)    

 

RegisterNetEvent('bag:close')
AddEventHandler('bag:close', function()
 
	local trackedEntities = {
		`xm_prop_x17_bag_01c` 
	}
    local GetEntityCoords = GetEntityCoords
    local GetClosestObjectOfType = GetClosestObjectOfType
    local DoesEntityExist = DoesEntityExist
    local playerCoords = GetEntityCoords(ESX.PlayerData.ped)

    local closestDistance = -1
    local closestEntity   = nil

    for i=1, #trackedEntities, 1 do
        local object = GetClosestObjectOfType(playerCoords, 3.0, trackedEntities[i], false, false, false)

        if DoesEntityExist(object) then
            Sleep = 500
            local objCoords = GetEntityCoords(object)
            local distance = #(playerCoords - objCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestDistance = distance
                closestEntity   = object
            end
        end
    end

    if closestDistance ~= -1 and closestDistance <= 3.0 then
        if LastEntity ~= closestEntity then
            TriggerEvent('esx_policejob:hasEnteredEntityZonee', closestEntity)
            LastEntity = closestEntity
        
        end
    else
        if LastEntity then
            TriggerEvent('esx_policejob:hasEnteredEntityZonee', LastEntity)
            LastEntity = nil
        
        end
    end
 
end)    

 

exports("clothesbag", function(data, slot)
    local model =  'xm_prop_x17_bag_01c'
    local playerPed = PlayerPedId()
    local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
    local objectCoords = (coords + forward * 1.0)
    
    exports.ox_inventory:useItem(data)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'down', 1.0)
    ESX.Game.SpawnObject(model, objectCoords, function(obj)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
    end)
end)

 

 
 
 
 
RegisterCommand('dsadas', function()
    local success = lib.skillCheck({'easy',{areaSize = 30, speedMultiplier = 1},'easy',{areaSize = 30, speedMultiplier = 1},'easy'})
   if success then
    lib.notify({
        title = 'Notification title',
        description = 'Notification description',
        type = 'success'
    })
else
    lib.notify({
        title = 'Notification title',
        description = 'Notification description',
        type = 'error'
    })
    
end

end)