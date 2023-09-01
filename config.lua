Config = {}

Config.Debug = true

Config.Stores = {
    [1] = {
        name = "Little Seoul",
        copsCalled = false, -- DONT TOUCH
        --- Step 1-3 ---
        StepOne = {
            label = "DoorCode1",
            -- Target
            coords = vector3(-702.87, -916.38, 19.01),
            heading = 270.0,
            length = 2.0,
            width = 0.6,
            minZ = 18.21,
            maxZ = 20.81,
            targetlabel = "Knock",
            ----
            completed = false, -- DONT TOUCH
            codeOne = 0, -- DONT TOUCH
        },
        StepTwo = {
            label = "LotteryCode1",
            -- Target
            coords = vector3(-705.48, -916.15, 19.22),
            heading = 270.0,
            length = 1.0,
            width = 0.4,
            minZ = 19.22,
            maxZ = 19.82,
            targetlabel = "Check Tickets",
            ----
            completed = false, -- DONT TOUCH
            codeTwo = 0, -- DONT TOUCH
        },
        StepThree = {
            label = "CandyShelf1",
            -- Target
            coords = vector3(-707.88, -916.15, 19.22),
            heading = 270.0,
            length = 1.8,
            width = 0.6,
            minZ = 18.22,
            maxZ = 19.62,
            targetlabel = "Check Candy Shelf",
            ----
            completed = false, -- DONT TOUCH
            codeThree = 0, -- DONT TOUCH
        },

        --- Computer / Input Equation ---
        Computer = {
            label = "Computer1",
            -- Target
            coords = vector3(-710.46, -905.42, 19.22),
            heading = 0.0,
            length = 1.5,
            width = 0.6,
            minZ = 19.02,
            maxZ = 19.62,
            targetlabel = "Input Variable",
            ----
            completed = false, -- DONT TOUCH
        },
    },
}