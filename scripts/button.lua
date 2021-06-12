-- Libs.
local anim8 = require("libs.anim8")
local Object = require("libs.classic")
-----------------------------------------

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

local Button = Object:extend()

function Button:new(scr, x, y, type)
    self.x, self.y = x, y
    self.w, self.h = 34, 34
    self.type = type
    self.scr = scr
    self.alive = true

    -- Sprite.
    self.sprite = scr.assets.sprites["tileset"]
    local g = anim8.newGrid(self.w, self.h, self.sprite:getWidth(), self.sprite:getHeight())
    if (type == "grey") then self.frame = g:getFrames(5, 5,  6, 5) 
    elseif (type == "red") then self.frame = g:getFrames(5, 6,  6, 6) 
    end

    self.index = 1
end

function Button:update(dt)
    local player = self.scr.objects.player

    -- Activate button.
    if (self.index == 1) then
        if (self.type == "grey") then
            if (CheckCollision(self.x, self.y, self.w, self.h, player.x, player.y, player.w, player.h)) then
                self.scr.greyButton = true
                self.index = 2
                self.scr.assets.sfx["switch"]:play()
            end
        end

        if (self.type == "red") then
            for i, v in pairs(self.scr.objects) do
                if (v.name == "Demony") then 
                    if (CheckCollision(self.x, self.y, self.w, self.h, v.x, v.y, v.w, v.h) and 
                    v.limiter == true) then
                        self.scr.redButton = true
                        self.index = 2
                        self.scr.assets.sfx["switch"]:play()
                    end
                end
            end
        end
        
    end
end

function Button:draw()
    -- Draw sprite centered and above
    -- the collision box.
    love.graphics.draw(
        self.sprite, self.frame[self.index],
        (self.x + self.w/2) - (self.w/2 - self.w/2), 
        (self.y + self.h/2) - (self.h - self.h), 
        0, 1, 1, 
        self.w/2,
        self.h/2
    )
end

return Button