-- Libs.
local flux   = require("libs.flux")
local anim8  = require("libs.anim8")
local Object = require("libs.classic")
--------------------------------------

local Player = Object:extend()

function Player:new(scr, x, y)
    self.scr = scr
    self.x, self.y = x, y
    self.w, self.h = 30, 65
    self.name = "Player"
    
    self.flip = 1
    self.flipSpd = 0.2
    self.spd = 150
    self.moving = false

    -- Create sprite.
    self.sprite = scr.assets.sprites["drkarlovisky"]
    self.sprW, self.sprH = 30, 65
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())

    -- Create animations.
    self.anim = {}
    self.anim["idle"]    = anim8.newAnimation(g('1-4', 1), 0.1)
    self.anim["walking"] = anim8.newAnimation(g('1-3', 2), 0.1)
    self.anim.current = self.anim["idle"]

    scr.world:add(self, 0, 0, 30, 65) -- Add to collision world.
end

function Player:update(dt)
    flux.update(dt)
    self.anim.current:update(dt)

    -- Movement.
    self.moving = false
    if (love.keyboard.isDown("up")) then
        self.moving = true
        self.y = self.y - self.spd * dt
    elseif (love.keyboard.isDown("down")) then
        self.moving = true
        self.y = self.y + self.spd * dt
    end
    if (love.keyboard.isDown("left")) then
        self.moving = true
        self.x = self.x - self.spd * dt
        flux.to(self, self.flipSpd, {flip = 1})
    elseif (love.keyboard.isDown("right")) then
        self.moving = true
        self.x = self.x + self.spd * dt
        flux.to(self, self.flipSpd, {flip = -1})
    end

    -- Collision resolution.
    local actualX, actualY, cols, len = self.scr.world:move(self, self.x, self.y)
    self.x, self.y = actualX, actualY

    -- Animation.
    if (self.moving) then
        self.anim.current = self.anim["walking"]
    else
        self.anim.current = self.anim["idle"]
    end
end

function Player:draw()
    -- Draw debug outline.
    if (_G.gameDebug) then
        love.graphics.rectangle("line", self.x, self.y, self.w, self.h, 0, 0)
    end

    -- Draw sprite.
    self.anim.current:draw(
        self.sprite, 
        self.x + self.sprW/2, 
        self.y + self.sprH/2, 
        0, self.flip, 1, 
        self.sprW/2,
        self.sprH/2
    )
end

return Player