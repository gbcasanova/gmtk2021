-- Libs.
local flux  = require("libs.flux")
local anim8 = require("libs.anim8")

-- Scripts.
local Entity = require("scripts.entity")
----------------------------------------

local Demony = Entity:extend()

function Demony:new(scr, x, y, limiter)
    Demony.super.new(self, scr, x, y, 34, 35)
    self.name = "Demony"

    -- Sprite.
    self.sprite = scr.assets.sprites["demony"]
    self.sprW, self.sprH = 34, 35
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())

    -- Animations.
    self.anim = {}
    self.anim["idle"]    = anim8.newAnimation(g('1-4', 1), 0.1)
    self.anim["walking"] = anim8.newAnimation(g('1-4', 2), 0.1)
    self.anim.current = self.anim["walking"]

    -- Animations.
    self.flip = 1
    self.flipSpd = 0.4
    self.spd = 3
    self.limiter = limiter
    self.maxMovement = 100
end

function Demony:update(dt)
    Demony.super.update(self, dt)
    self.anim.current:update(dt)

    local player = self.scr.objects.player

    -- Limit player movement.
    if (self.limiter) then
        if (player.x > self.x + self.maxMovement) then
            player.canMove = false
        elseif (player.x < self.x - self.maxMovement) then
            player.canMove = false
        elseif (player.y > self.y + self.maxMovement) then
            player.canMove = false
        elseif (player.y < self.y - self.maxMovement) then
            player.canMove = false
        else
            player.canMove = true
        end
    end

    -- Move towards player.
    flux.to(self, self.spd, {x = self.scr.objects.player.x})
    flux.to(self, self.spd, {y = self.scr.objects.player.y})

    -- Collision resolution.
    local actualX, actualY, cols, len = self.scr.world:move(self, self.x, self.y)
    self.x, self.y = actualX, actualY

    -- Flip animation.
    if (self.scr.objects.player.x > self.x) then
        flux.to(self, self.flipSpd, {flip = 1})
    elseif (self.scr.objects.player.x < self.x) then
        flux.to(self, self.flipSpd, {flip = -1})
    end

    -- Collision with player
    for i=1,len do -- If more than one simultaneous collision, they are sorted out by proximity
        local col = cols[i]
        if (col.other.name == "Player") then
            --print("GAME OVER")
        end
    end
end

function Demony:draw()
    Demony.super.draw(self)

    love.graphics.line(
        (self.x + self.sprW/2), 
        (self.y + self.sprH/2), 
        self.scr.objects.player.x + 3, 
        self.scr.objects.player.y + 6
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