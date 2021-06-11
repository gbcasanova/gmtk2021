-- Libs.
local flux  = require("libs.flux")
local anim8 = require("libs.anim8")

-- Scripts.
local Entity = require("scripts.entity")
----------------------------------------

local Demony = Entity:extend()

function Demony:new(scr, x, y)
    Demony.super.new(self, scr, x, y, 34, 35)

    -- Sprite.
    self.sprite = scr.assets.sprites["demony"]
    self.sprW, self.sprH = 34, 35
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())

    -- Animations.
    self.anim = {}
    self.anim["idle"]    = anim8.newAnimation(g('1-4', 1), 0.1)
    self.anim["walking"] = anim8.newAnimation(g('1-4', 2), 0.1)
    self.anim.current = self.anim["idle"]

    -- Flip.
    self.flip = 1
    self.flipSpd = 0.4
end

function Demony:update(dt)
    Demony.super.update(self, dt)
    self.anim.current:update(dt)

    -- Flip.
    if (self.scr.objects.player.x > self.x) then
        flux.to(self, self.flipSpd, {flip = 1})
    elseif (self.scr.objects.player.x < self.x) then
        flux.to(self, self.flipSpd, {flip = -1})
    end
end

function Demony:draw()
    Demony.super.draw(self)

    love.graphics.line(
        self.x, 
        self.y, 
        self.scr.objects.player.x, 
        self.scr.objects.player.y
    )

    -- Draw sprite centered and above
    -- the collision box.
    self.anim.current:draw(
        self.sprite, 
        (self.x + self.sprW/2), 
        (self.y + self.sprH/2), 
        0, self.flip, 1,
        self.sprW/2,
        self.sprH/2
    )
end

return Demony