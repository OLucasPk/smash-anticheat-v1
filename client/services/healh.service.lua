local bypassHeal = false
RegisterNetEvent('smash-ac:initScripts')
AddEventHandler('smash-ac:initScripts',function(status)
    bypassHeal = status
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()

        local first_health = GetEntityHealth(ped)
        Citizen.Wait(5000)
        local last_health = GetEntityHealth(ped)

        if parseInt(last_health) > parseInt(first_health) then
            if bypassHeal then
                print('^5[smash-ac] ^7Code: 55043246')
                return;
            end

            print('^5[smash-ac] ^7Code: 00423566')
            serverAPI.applyPunish({ reason = "Recuperou vida de "..first_health.." para "..last_health.."", punishment = "Log", requireScreenshoot = false });
        end
    end
end)