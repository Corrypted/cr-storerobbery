local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('storerobbery:client:ResetStore', function(store, bool)
    Config.Stores[store].StepOne.completed = bool
    print(Config.Stores[store].StepOne.completed)
end)

local function CreateTargets()
    for k, v in pairs(Config.Stores) do
        --- Target One ---
        exports["qb-target"]:AddBoxZone(v.StepOne.label, v.StepOne.coords, v.StepOne.length, v.StepOne.width, {
            name = v.StepOne.label,
            heading = v.StepOne.heading,
            debugPoly = Config.Debug,
            minZ = v.StepOne.minZ,
            maxZ = v.StepOne.maxZ,
        }, {
            options = {
                {
                    action = function()
                        if v.StepOne.codeOne ~= 0 then return QBCore.Functions.Notify("Number: "..v.StepOne.codeOne, "primary", length) end
                        codeone = math.random(1, 99)
                        v.StepOne.codeOne = codeone
                        v.StepOne.completed = true
                        QBCore.Functions.Notify("Number: "..v.StepOne.codeOne, "primary", length)
                    end,
                    canInteract = function()
                        if v.StepOne.completed == true then
                            return false
                        else
                            return true
                        end
                    end,
                    icon = "fas fa-solid fa-hand-back-fist",
                    label = v.StepOne.targetlabel,
                },
            },
        distance = 3.5
        })
        --- Target Two ---
        exports["qb-target"]:AddBoxZone(v.StepTwo.label, v.StepTwo.coords, v.StepTwo.length, v.StepTwo.width, {
            name = v.StepTwo.label,
            heading = v.StepTwo.heading,
            debugPoly = Config.Debug,
            minZ = v.StepTwo.minZ,
            maxZ = v.StepTwo.maxZ,
        }, {
            options = {
                {
                    action = function()
                        if v.StepTwo.codeTwo ~= 0 then return QBCore.Functions.Notify("Number: "..v.StepTwo.codeTwo, "primary", length) end
                        codetwo = math.random(1, 99)
                        v.StepTwo.codeTwo = codetwo
                        v.StepTwo.completed = true
                        QBCore.Functions.Notify("Number: "..v.StepTwo.codeTwo, "primary", length)
                    end,
                    canInteract = function()
                        if v.StepTwo.completed == true then
                            return false
                        else
                            return true
                        end
                    end,
                    icon = "fas fa-solid fa-ticket",
                    label = v.StepTwo.targetlabel,
                },
            },
        distance = 1.5
        })
        --- Target Three ---
        exports["qb-target"]:AddBoxZone(v.StepThree.label, v.StepThree.coords, v.StepThree.length, v.StepThree.width, {
            name = v.StepThree.label,
            heading = v.StepThree.heading,
            debugPoly = Config.Debug,
            minZ = v.StepThree.minZ,
            maxZ = v.StepThree.maxZ,
        }, {
            options = {
                {
                    action = function()
                        if v.StepThree.codeThree ~= 0 then return QBCore.Functions.Notify("Number: "..v.StepThree.codeThree, "primary", length) end
                        codethree = math.random(1, 99)
                        v.StepThree.codeThree = codethree
                        v.StepThree.completed = true
                        QBCore.Functions.Notify("Number: "..v.StepThree.codeThree, "primary", length)
                    end,
                    canInteract = function()
                        if v.StepThree.completed == true then
                            return false
                        else
                            return true
                        end
                    end,
                    icon = "fas fa-solid fa-chart-simple",
                    label = v.StepThree.targetlabel,
                },
            },
        distance = 1.5
        })


        --- Computer Target ---
        exports["qb-target"]:AddBoxZone(v.Computer.label, v.Computer.coords, v.Computer.length, v.Computer.width, {
            name = v.Computer.label,
            heading = v.Computer.heading,
            debugPoly = Config.Debug,
            minZ = v.Computer.minZ,
            maxZ = v.Computer.maxZ,
        }, {
            options = {
                {
                    action = function()
                        if v.StepOne.codeOne ~= 0 and v.StepTwo.codeTwo ~= 0 and v.StepThree.codeThree ~= 0 then
                            finalcode = (v.StepOne.codeOne + v.StepTwo.codeTwo + v.StepThree.codeThree)
                            --v.Computer.completed = true
                            print(finalcode)
                            TriggerServerEvent('storerobbery:server:ResetStore', k)
                        else
                            QBCore.Functions.Notify('You\'re missing variables!', "error", 5000)
                            TriggerServerEvent('storerobbery:server:ResetStore', k)
                        end
                    end,
                    canInteract = function()
                        if v.Computer.completed == true then
                            return false
                        else
                            return true
                        end
                    end,
                    icon = "fas fa-solid fa-computer",
                    label = v.Computer.targetlabel,
                },
            },
        distance = 1.5
        })

        --- Safe Target ---

        --- Debug ---
        if Config.Debug then print('Created Zone: '..v.StepTwo.label) end
    end
end

local function RemoveTargets()
    for k, v in pairs(Config.Stores) do
        exports['qb-target']:RemoveZone(v.StepOne.label)
        if Config.Debug then print('Removed Zone: '..v.StepOne.label) end
    end
end









---- Resource Stuff ----

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    CreateTargets()
end)

AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    RemoveTargets()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    CreateTargets()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    RemoveTargets()
end)