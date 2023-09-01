local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('storerobbery:server:ResetStore', function(store)
    print(Config.Stores[store].StepOne.completed)
    Config.Stores[store].StepOne.completed = false
    TriggerClientEvent('storerobbery:server:ResetStore', src, store, false)
end)