Config = {
    AlowCuts = true,--// if this is true this means that all businesses have to take a cut from a employee sale
    PayoutSplit = 40,--// the cut procentage what the business takes what the rest is left for the employee
    businesses = {
        --//Default preset business
        ['police'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                pos = vec3(-603.0, -1097.86, 22.18),--//blip location using vector3
                label = "UWU Cafe", --//blip label you can see on the map
                color = 0,--// blip color
                scale = 0.7,--// blip scale
                id = 475--//blip icon ID       
            }
            Register = {--//register where workers can write bills and players can pay them
                [1] = {--this means you can add a second register and so on
                    pos = vec3(-603.0, -1097.86, 22.18),--//location of the box zone
                    heading = 320,--//box zone heading
                    length = 3,--//box zone length
                    width = 3,--// box zone width
                    minZ = 20.93,--// box zone min height
                    maxZ = 23.13 --// box zone max height                  
                }
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-600.94, -1102.0, 22.32),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 20.72,--// box zone min height
                    maxZ = 23.32,--// box zone max height 
                    stash = {
                        label = 'Open counter',--//this is the label of the target for the stash
                        name = 'Something',--//this is a stash ID 
                        weight = 500,--//this is stash weight
                        slots = 5,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "police"          
                    }
                }
            },
            Craft = {--//This is where workers can craft items
                [1] = {--this means you can add a second craft and so on
                    pos = vec3(-620.39, -1069.28, 22.38),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.38,--// box zone min height
                    maxZ = 25.38,--// box zone max height
                    items = {--// all the items you can craft
                    {
                        item = 'phone',--//this is the items spawn name
                        label = 'Phone',--//this is the items label name
                        requiredLabel = 'Phone: 1x, Water: 2x',--//this displays on the menu what items are required to make this item
                        required = {--//required item list
                            {item = 'phone', count = 2},
                            {item = 'water_bottle', count = 1}
                        }
                    },
                    {
                        item = 'tosti', 
                        label = 'SandWich',
                        requiredLabel = 'SandWich: 1x, Water: 2x',
                        required = {
                            {item = 'tosti', count = 2},
                            {item = 'water_bottle', count = 1}
                        }
                    }                
                }            
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-610.83, -1089.59, 22.32),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 2,--//box zone length
                    width = 2,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                [1] = {--this means you can add a second outfit and so on
                    pos = vec3(-608.8, -1093.63, 22.32),--//location of the box zone
                    heading = 355,--//box zone heading
                    length = 5,--//box zone length
                    width = 1,--// box zone width
                    minZ = 20.93,--// box zone min height
                    maxZ = 23.13--// box zone max height              
                }
            },
        }
        --//end off default business
    }
}