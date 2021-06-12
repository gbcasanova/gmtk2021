-- Libs.
local flux = require("libs.flux")
local anim8 = require("libs.anim8")
local Object = require("libs.classic")
--------------------------------------

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local EndLevel = Object:extend()

function EndLevel:new(scr, x, y)
    -- Position.
    self.x, self.y = x, y
    self.w, self.h = 34, 68

    self.sprite = scr.assets.sprites["tileset"]
    local g = anim8.newGrid(self.w, self.h, self.sprite:getWidth(), self.sprite:getHeight())
    self.frame = g:getFrames(7, 4)

    self.scr = scr
    self.alive = true

    -- Animation.
    self.startY = self.y
    self.endY = self.y - 10
    self.tweenPlaying = false
end

function EndLevel:update(dt)
    local player = self.scr.objects.player

    -- Destroy object.
    if CheckCollision(self.x, self.y, self.w, self.h, player.x, player.y, player.w, player.h) then
        self.scr:resetScreen()
        _G.currentLevel = _G.currentLevel + 1
    end

    -- Loop tween animation.
    local function notPlaying()
        self.tweenPlaying = true
    end
    local function playingTween()
        self.tweenPlaying = false
    end

    if (not self.tweenPlaying) then
        flux.to(self, 1, {y = self.startY})
            :onstart(notPlaying)
            :after(self, 1, {y = self.endY})
            :oncomplete(playingTween)
    end
end

function EndLevel:draw()
    love.graphics.draw(self.sprite, self.frame[1], self.x, self.y)
end

return EndLevel
  