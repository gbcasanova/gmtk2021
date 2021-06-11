-- Libs.
local anim8 = require("libs.anim8")
local Object = require("libs.classic")
--------------------------------------

local Player = Object:extend()

function Player:new(scr, x, y)
    self.scr = scr
    self.x, self.y = x, y
    self.w, self.h = 30, 65
    self.spd = 1
    self.name = "Player"

    -- Create sprite.
    self.sprite = scr.assets.sprites["drkarlovisky"]
    local g = anim8.newGrid(30, 65, self.sprite:getWidth(), self.sprite:getHeight())

    -- Create animations.
    self.anim = {}
    self.anim["idle"]    = anim8.newAnimation(g('1-4', 1), 0.1)
    self.anim["walking"] = anim8.newAnimation(g('1-3', 2), 0.1)
    self.anim.current = self.anim["idle"]

    scr.world:add(self, 0, 0, 30, 65) -- Add to collision world.
end

function Player:update(dt)
    self.anim.current:update(dt)

    -- Movement.
    if (love.keyboard.isDown("up")) then
        self.y = self.y - self.spd
    elseif (love.keyboard.isDown("down")) then
        self.y = self.y + self.spd
    end
    if (love.keyboard.isDown("left")) then
        self.x = self.x - self.spd
    elseif (love.keyboard.isDown("right")) then
        self.x = self.x + self.spd
    end


    -- Collision resolution.
    local actualX, actualY, cols, len = self.scr.world:move(self, self.x, self.y)
    self.x, self.y = actualX, actualY
end

function Player:draw()
    -- Draw debug outline.
    if (_G.gameDebug) then
        love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    end

    -- Draw sprite.
    self.anim.current:draw(self.sprite, self.x, self.y)
end

return Player