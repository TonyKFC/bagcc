# bagcc
esx_policejob
esx_policejob\client\main.lua add 

AddEventHandler('esx_policejob:hasEnteredEntityZonee', function(entity)
	local playerPed = PlayerPedId()

 		CurrentAction     = 'remove_entityy'
		CurrentActionMsg  = _U('remove_bag')
		CurrentActionData = {entity = entity}
 
	if GetEntityModel(entity) == `p_ld_stinger_s` then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)
AddEventHandler('esx_policejob:hasExitedEntityZonee', function(entity)
	if CurrentAction == 'remove_entityy' then
		CurrentAction = nil
	end
end)
