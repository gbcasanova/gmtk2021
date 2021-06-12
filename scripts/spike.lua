-- Libs.
local anim8 = require("libs.anim8")

-- Scripts.
local Entity = require("scripts.entity")
--------------------------------------
local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local Spike = Entity:extend()

function Spike:new(scr, x, y)
    Spike.super.new(self, scr, x, y, 34, 34)

    -- Sprite.
    self.sprite = scr.assets.sprites["tileset"]
    self.sprW, self.sprH = 34, 34
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())
    self.frame = g:getFrames(7, 5)
end

function Spike:update(dt)
    Spike.super.update(self, dt)

    local player = self.scr.objects.player

    -- Destroy object (This is so dumb. I'm only doing this because i forgot how to use BUMP properly.)
    if CheckCollision(self.x - 1, self.y - 1, self.w + 2, self.h + 2, player.x, player.y, player.w, player.h) then
        player:hurt()
    end
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
  