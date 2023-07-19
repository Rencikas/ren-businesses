Config = {
    AlowCuts = true,--// if this is true this means that all businesses have to take a cut from a employee sale
    PayoutSplit = 40,--// the cut procentage what the business takes and the rest is left for the employee
    Debug = false,--//if true it will enable polyzone debug
    businesses = {
        --[[
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
        ]]
        ['chefboyrbs'] = {
            Blip = {
                [1] = {
                    pos = vector3(-1387.99, -697.67, 24.48),
                    label = "Chef Boy RB's",
                    color = 49,
                    scale = 0.8,
                    id = 739
                }
            },
            Register = {
                [1] = {
                    pos = vector3(-1394.92, -681.24, 24.79),
                    heading = 0,
                    length = 0.6,
                    width = 0.4,
                    minZ = 24.79,
                    maxZ = 25.39
                },
            },
            Storages = {
                [1] = { -- counter
                    pos = vector3(-1393.21, -681.29, 24.79),
                    heading = 30,
                    length = 0.6,
                    width = 1,
                    minZ = 24.79,
                    maxZ = 24.99,
                    stash = {
                        label = 'Open counter',
                        name = 'chefboyrbs-counter-1',
                        weight = 50000,
                        slots = 5,
                        job = false
                    }
                },
                [2] = { -- fridge
                    pos = vector3(-1386.2, -672.56, 24.79),
                    width = 0.8,
                    length = 0.8,
                    heading = 35,
                    minZ = 23.69,
                    maxZ = 25.69,
                    stash = {
                        label = 'Open fridge',
                        name = 'chefboyrbs-fridge-1',
                        weight = 500000,
                        slots = 50,
                        job = 'chefboyrbs'
                    }
                },
            },
            Craft = {
                [1] = { -- food
                    pos = vector3(-1384.81, -674.71, 24.79),
                    length = 0.9,
                    width = 1.7,
                    heading = 306,
                    minZ = 23.79,
                    maxZ = 25.59,
                    items = {
                        {
                            label = 'GF Pasta Chicken Alfredo',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['gf_pasta_chicken_alfredo'] = 1,
                            }
                        },
                        {
                            label = 'Chef’s Pizza',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['chefs_pizza'] = 1,
                            }
                        },
                        {
                            label = 'Lasagna',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['lasagna'] = 1,
                            }
                        },
                        {
                            label = 'Manlionie Cannoli',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['manlionie_cannoli'] = 1,
                            }
                        },
                        {
                            label = 'RB’s Raviolis',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['rbs_raviolis'] = 1,
                            }
                        },
                        {
                            label = 'Tiramisu',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['tiramisu'] = 1,
                            }
                        },
                        {
                            label = 'Risotto',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['risotto'] = 1,
                            }
                        },
                        {
                            label = 'RB’s Mac n cheese',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['rbs_mac_n_cheese'] = 1,
                            }
                        },
                    }            
                },
                [2] = { -- drinks
                    pos = vector3(-1391.27, -677.65, 24.79),
                    length = 0.45,
                    width = 1.85,
                    heading = 35,
                    minZ = 24.84,
                    maxZ = 25.54,
                    items = {
                        {
                            label = 'Red wine',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['red_wine'] = 1,
                            }
                        },
                        {
                            label = 'Negroni',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['negroni'] = 1,
                            }
                        },
                        {
                            label = 'Spritz',
                            requiredLabel = 'Water: 1x',
                            required = {
                                ['water'] = 1,
                            },
                            result = {
                                ['spritz'] = 1,
                            }
                        },
                    }            
                }
            },
            Duty = {
                [1] = {
                    pos = vector3(-1395.8, -690.1, 24.79),
                    heading = 330,
                    length = 1.0,
                    width = 0.8,
                    minZ = 23.79,
                    maxZ = 24.99
                }
            },
            Outfit = {
                [1] = {
                    pos = vector3(-1389.13, -666.79, 24.79),
                    heading = 306,
                    length = 0.8,
                    width = 1.2,
                    minZ = 23.34,
                    maxZ = 25.94
                }
            },
            Store = {
                [1] = {
                    pos = vector3(-1386.86, -678.22, 24.79),
                    width = 3.0,
                    length = 0.6,
                    heading = 35,
                    minZ = 23.79,
                    maxZ = 25.99,
                    label = "Chef Boy RB's ingredient store",
                    slots = 30,
                    items = {
                        {
                            name = "water",
                            price = 0,
                            amount = 10,
                            info = {},
                            type = "item",
                            slot = 1,
                            authorizedJobGrades = {0, 1, 2, 3}
                        },                         
                    }                      
                }
            },
            Wash = {
                [1] = {
                    pos = vector3(-1385.7, -673.52, 24.79),
                    width = 1.3,
                    length = 1.0,
                    heading = 36,
                    minZ = 23.79,
                    maxZ = 24.99
                }
            }
        },
    }
}
