-- Scripts.
local Life = require("scripts.life")
local Coin = require("scripts.coin")
local Door = require("scripts.door")
local Spike = require("scripts.spike")
local Button = require("scripts.button")
local Demony = require("scripts.demony")
local Player = require("scripts.player")
local Entity = require("scripts.entity")
local EndLevel = require("scripts.endLevel")
----------------------------------------

local mapStuff = {}

function mapStuff.createSolids(screen, map, collisionLayer, objectsTable)
    -- Iterate through every pixel.
    for y = 0, collisionLayer.height do
        for x = 0, collisionLayer.width do
            -- Check if there's a tile.
            local gid = collisionLayer:getTileAtGridPosition(x, y)
            if gid then
                local xx = x * map.tilewidth + collisionLayer.offsetx
                local yy = y * map.tileheight + collisionLayer.offsety
                table.insert(objectsTable, Entity(screen, xx, yy, map.tilewidth, map.tileheight))
            end
        end
    end
end

function mapStuff.createObjects(screen, map, layer, objsTable)
    -- Iterate through every object.
    for i, v in pairs(layer.objects) do
        local obj = v.type -- Get object name.
        local x = v.x - 1 -- Y origin.
        local y = v.y - 32 - 1 -- Y origin.

        -- Create objects.
        if (obj == "player") then objsTable.player = Player(screen, x, y)
        elseif (obj == "life") then table.insert(objsTable, Life(screen, x, y))
        elseif (obj == "coin") then table.insert(objsTable, Coin(screen, x, y))
        elseif (obj == "spike") then table.insert(objsTable, Spike(screen, x, y))

        elseif (obj == "greyDoor") then table.insert(objsTable, Door(screen, x, y, "grey"))
        elseif (obj == "redDoor") then table.insert(objsTable, Door(screen, x, y, "red"))
        elseif (obj == "blueDoor") then table.insert(objsTable, Door(screen, x, y, "blue"))
        elseif (obj == "endLevel") then table.insert(objsTable, EndLevel(screen, x, y)) 

        elseif (obj == "redDemony") then table.insert(objsTable, Demony(screen, x, y, true))
        elseif (obj == "blueDemony") then table.insert(objsTable, Demony(screen, x, y, false)) 
    
        elseif (obj == "greyButton") then table.insert(objsTable, Button(screen, x, y, "grey")) 
        elseif (obj == "redButton") then table.insert(objsTable, Button(screen, x, y, "red"))
        elseif (obj == "blueButton") then table.insert(objsTable, Button(screen, x, y, "blue"))
        end
    end
end

return mapStuff