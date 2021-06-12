-- Libs.
local anim8 = require("libs.anim8")

-- Scripts.
local Entity = require("scripts.entity")
--------------------------------------
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local Door = Entity:extend()

function Door:new(scr, x, y, type)
    Door.super.new(self, scr, x, y, 34, 34)
    self.type = type

    -- Sprite.
    self.sprite = scr.assets.sprites["tileset"]
    self.sprW, self.sprH = 34, 34
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())

    if (type == "grey") then self.frame = g:getFrames(1, 2,  2, 2) 
    elseif (type == "red") then self.frame = g:getFrames(1, 3, 2, 3) 
    elseif (type == "blue") then self.frame = g:getFrames(1, 4, 2, 4) 
    end

    self.index = 1
end

function Door:update(dt)
    --Door.super.update(self, dt)

    -- Open door.
    if (self.index == 1) then
        if (self.type == "grey" and self.scr.greyButton == true) then
            self.scr.world:remove(self)
            self.index = 2
        end
        if (self.type == "red" and self.scr.redButton == true) then
            self.scr.world:remove(self)
            self.index = 2
        end
        if (self.type == "blue" and self.scr.blueButton == true) then
            self.scr.world:remove(self)
            self.index = 2
        end
    end
end

function Door:draw()
    Door.super.draw(self, dt)

    -- Draw sprite centered and above
    -- the collision box.
    love.graphics.draw(
        self.sprite, self.frame[self.index],
        (self.x + self.sprW/2) - (self.sprW/2 - self.w/2), 
        (self.y + self.sprH/2) - (self.sprH - self.h), 
        0, 1, 1, 
        self.sprW/2,
        self.sprH/2
    )
end

return Door