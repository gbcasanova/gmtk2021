-- Scripts.
local Entity = require("scripts.entity")
----------------------------------------

local Demony = Entity:extend()

function Demony:new(scr, x, y)
    Demony.super.new(self, scr, x, y, 32, 32)

    self.lineX = 0
    self.lineY = 0
end

function Demony:update(dt)
    Demony.super.update(self, dt)
end

function Demony:draw()
    Demony.super.draw(self)

    love.graphics.line(
        self.x, 
        self.y, 
        self.scr.objects.player.x, 
        self.scr.objects.player.y
    )
end

return Demony