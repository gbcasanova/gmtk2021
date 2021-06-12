-- Libs.
local anim8 = require("libs.anim8")

-- Scripts.
local Entity = require("scripts.entity")
--------------------------------------

local Spike = Entity:extend()

function Spike:new(scr, x, y)
    Spike.super.new(self, scr, x, y, 33, 11)

    -- Sprite.
    self.sprite = scr.assets.sprites["tileset"]
    self.sprW, self.sprH = 34, 34
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())
    self.frame = g:getFrames(7, 5)

    -- Center object on original position.
    --self.x = (self.x + self.sprW) - self.w
    --self.y = (self.y + self.sprH) - self.h
end

function Spike:update(dt)
    Spike.super.update(self, dt)
end

function Spike:draw()
    Spike.super.draw(self, dt)

    -- Draw sprite centered and above
    -- the collision box.
    love.graphics.draw(
        self.sprite, self.frame[1],
        (self.x + self.sprW/2) - (self.sprW/2 - self.w/2), 
        (self.y + self.sprH/2) - (self.sprH - self.h), 
        0, 1, 1, 
        self.sprW/2,
        self.sprH/2
    )
end

return Spike
  