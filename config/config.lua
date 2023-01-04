Config = {
    AlowCuts = true,--// if this is true this means that all businesses have to take a cut from a employee sale
    PayoutSplit = 40,--// the cut procentage what the business takes and the rest is left for the employee
    Debug = false,--//if true it will enable polyzone debug
    businesses = {
        --//Default preset business
        ['uwu'] = {--//key name stands for the business job name
            Blip = {--//blip this is where it shows the business location on the map
                [1] = {
                    pos = vec3(-581.15, -1064.5, 22.35),--//blip location using vector3
                    label = "UWU Cafe", --//blip label you can see on the map
                    color = 34,--// blip color
                    scale = 0.8,--// blip scale
                    id = 671--//blip icon ID       
                }
            },
            Register = {--//register where workers can write bills and players can pay them
                [1] = {--this means you can add a second register and so on
                    pos = vec3(-584.05, -1061.46, 22.34),--//location of the box zone
                    heading = 340,--//box zone heading
                    length = 0.5,--//box zone length
                    width = 0.5,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74 --// box zone max height                  
                },
                [2] = {--this means you can add a second register and so on
                    pos = vec3(-584.08, -1058.66, 22.34),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 0.5,--//box zone length
                    width = 0.5,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74 --// box zone max height                  
                }
            },
            Storages = {--//storages this where you can store youre items
                [1] = {--this means you can add a second storage and so on
                    pos = vec3(-583.71, -1060.43, 22.34),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 22.74,--// box zone max height 
                    stash = {
                        label = 'Open counter',--//this is the label of the target for the stash
                        name = 'uwu_counter1',--//this is a stash ID 
                        weight = 50000,--//this is stash weight
                        slots = 5,--//this is stash slots
                        job = false--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [2] = {--this means you can add a second storage and so on
                    pos = vec3(-590.83, -1059.26, 22.36),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.16,--// box zone min height
                    maxZ = 23.76,--// box zone max height 
                    stash = {
                        label = 'Open fridge',--//this is the label of the target for the stash
                        name = 'uwu_stash1',--//this is a stash ID 
                        weight = 500000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'uwu'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                },
                [3] = {--this means you can add a second storage and so on
                    pos = vec3(-587.99, -1067.0, 22.34),--//location of the box zone
                    heading = 270,--//box zone heading
                    length = 1,--//box zone length
                    width = 3,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.54,--// box zone max height 
                    stash = {
                        label = 'Open storage',--//this is the label of the target for the stash
                        name = 'uwu_stash2',--//this is a stash ID 
                        weight = 500000,--//this is stash weight
                        slots = 50,--//this is stash slots
                        job = 'uwu'--// if job = false that means that this storage is public. If you want a private stash replace false with your job name like this: job = "uwu"          
                    }
                }
            },
            Craft = {--//This is where workers can craft items
                [1] = {--this means you can add a second craft and so on
                    pos = vec3(-591.09, -1056.54, 22.36),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.36,--// box zone min height
                    maxZ = 22.56,--// box zone max height
                    items = {--// all the items you can craft
                        {
                            label = 'Cola',--//this is the items label name
                            requiredLabel = 'Phone: 1x, Water: 2x',--//this displays on the menu what items are required to make this item
                            required = {--//required item list
                                ['phone'] = 1,--// [item spawn name] = item count
                                ['water_bottle'] = 2--// [item spawn name] = item count
                            },
                            result = {--//The items you get when you finish crafting
                                ['phone'] = 1,--// [item spawn name] = item count
                                ['water_bottle'] = 2--// [item spawn name] = item count
                            }
                        }, 
                        {
                            label = 'tosti',--//this is the items label name
                            requiredLabel = 'Phone: 1x, Water: 2x',--//this displays on the menu what items are required to make this item
                            required = {--//required item list
                                ['phone'] = 1,--// [item spawn name] = item count
                                ['water_bottle'] = 2--// [item spawn name] = item count
                            },
                            result = {--//The items you get when you finish crafting
                                ['phone'] = 1,--// [item spawn name] = item count
                                ['water_bottle'] = 2--// [item spawn name] = item count
                            }
                        },              
                    }            
                }
            },
            Duty = {--//this is where your workers can change there duty
                [1] = {--this means you can add a second duty and so on
                    pos = vec3(-596.27, -1052.58, 22.34),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 1,--// box zone width
                    minZ = 21.32,--// box zone min height
                    maxZ = 25.32--// box zone max height                
                }
            },
            Outfit = {--//this is where workers can change into their saved outfits
                [1] = {--//this means you can add a second and so on
                    pos = vec3(-586.29, -1049.83, 22.34),--//location of the box zone
                    heading = 270,--//box zone heading
                    length = 1,--//box zone length
                    width = 2,--// box zone width
                    minZ = 21.34,--// box zone min height
                    maxZ = 23.94--// box zone max height              
                }
            },
            Store = {--//this is where workers can buy ingredients
                [1] = {--//this means you can add a second store and so on
                    pos = vec3(-591.04, -1063.03, 22.36),--//location of the box zone
                    heading = 0,--//box zone heading
                    length = 1,--//box zone length
                    width = 2,--// box zone width
                    minZ = 21.36,--// box zone min height
                    maxZ = 23.56,--// box zone max height
                    label = "UWU ingredient store",--//store label
                    slots = 30,--//How many slots can the store have
                    items = {--//store item list
                        {
                            name = "phone",--//item spawn name
                            price = 0,--//item price
                            amount = 10,--//item amount
                            info = {},--//item metadata
                            type = "item",--//item type
                            slot = 1,--//item slot where it will be placed on the inventory
                            authorizedJobGrades = {0, 1, 2, 3}--//job grades that can buy this item
                        },
                        {
                            name = "tosti",--//item spawn name
                            price = 0,--//item price
                            amount = 10,--//item amount
                            info = {},--//item metadata
                            type = "item",--//item type
                            slot = 2,--//item slot where it will be placed on the inventory
                            authorizedJobGrades = {0, 1, 2, 3, 4}--//job grades that can buy this item
                        }                           
                    }                      
                }
            }
        }
        --//end off default business
    }
}
