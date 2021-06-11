-- Scripts.
local Entity = require("scripts.entity")
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
        local y = v.y - 16 -- Y origin.

        -- Create objects.
        --if (obj == "player") then table.insert(objsTable, Player(screen, v.x, y)) end
    end
end

return mapStuff