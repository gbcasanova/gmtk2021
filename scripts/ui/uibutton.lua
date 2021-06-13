-- Libs.
local Object = require("libs.classic")
local anim8 = require("libs.anim8")
--------------------------------------

local UiButton = Object:extend()

function UiButton:new(scr, x, y, im1)
    self.x, self.y = x, y
    self.w, self.h = 79, 22
    self.sprite = scr.assets.sprites["buttons"]
    local g = anim8.newGrid(self.w, self.h, self.sprite:getWidth(), self.sprite:getHeight())
    self.frame = g:getFrames(1, im1, 2, im1)
    self.actualFrame = 1
end

function UiButton:update(dt)
    local mx, my = push:toGame(love.mouse.getPosition())

    if mx ~= nil then -- Checking if the window isn't resizing.
        if my ~= nil then
            if mx >= self.x and mx <= self.x + self.w then
                if my >= self.y and my < self.y + self.h then
                    self.actualFrame = 2
                else
                    self.actualFrame = 1
                end
            else
                self.actualFrame = 1
            end
        end
    end
end

function UiButton:draw()
    love.graphics.draw(self.sprite, self.frame[self.actualFrame], self.x, self.y)
end

function UiButton:mousepressed(x, y, button, func)
    local mx, my = push:toGame(love.mouse.getPosition())

    if mx ~= nil then -- Checking if the window isn't resizing.
        if my ~= nil then
            if mx >= self.x and mx <= self.x + self.w then
                if my >= self.y and my < self.y + self.h then
                    if (button == 1) then
                        func()
                    end
                end
            end
        end
    end
end


return UiButton