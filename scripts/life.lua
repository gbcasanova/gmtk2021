-- Libs.
local anim8 = require("libs.anim8")
local Object = require("libs.classic")
--------------------------------------

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local Life = Object:extend()

function Life:new(scr, x, y)
    -- Position.
    self.x, self.y = x, y
    self.w, self.h = 34, 34

    self.sprite = scr.assets.sprites["tileset"]
    local g = anim8.newGrid(self.w, self.h, self.sprite:getWidth(), self.sprite:getHeight())
    self.frame = g:getFrames(4, 5)

    self.scr = scr
    self.alive = true
end

function Life:update(dt)
    local player = self.scr.objects.player

    -- Destroy object.
    if CheckCollision(self.x, self.y, self.w, self.h, player.x, player.y, player.w, player.h) then
        if (player.lives <= 3) then 
            self.scr.assets.sfx["life"]:play()
            player.lives = player.lives + 1
            self.alive = false
        end
    end
end

function Life:draw()
    love.graphics.draw(self.sprite, self.frame[1], self.x, self.y)
end

return Life
  