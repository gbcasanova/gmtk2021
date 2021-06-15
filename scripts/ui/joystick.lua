-- Libs
local Object = require("libs.classic")
--------------------------------------

local Button = Object:extend()

function Button:new(scr, x, y, w, h)
    self.x, self.y = x, y
    self.w, self.h = w, h
    self.scr = scr

    self.touches = {}
end

function Button:update(dt, func)
    for k, v in pairs(self.touches) do
        if v[1] ~= nil and v[2] ~= nil then
            if v[1] >= self.x and v[1] <= self.x + self.w then
                if v[2] >= self.y and v[2] < self.y + self.h then
                    func()
                end
            end
        end
    end
end

function Button:draw()
    love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
end

function Button:touchpressed(id, x, y)
    self.touches[id] = {x, y}
end

function Button:touchmoved(id, x, y)
    self.touches[id][1] = x
    self.touches[id][2] = y
end

function Button:touchreleased(id, x, y)
    self.touches[id] = nil
end

--
local Joystick = Object:extend()

function Joystick:new(scr, x, y)
    self.x, self.y = x, y
    self.scr = scr
    local s = 30

    self.buttons = {}

    for i = 0, 2 do
        for j = 0, 2 do
            table.insert(self.buttons, Button(scr, (j*s) + x, (i*s) + y, s, s))
        end
    end
end

function Joystick:update(dt)
    local player = self.scr.objects.player

    function leftUp() player.x = player.x - player.spd * dt player.y = player.y - player.spd * dt end
    function up() player.y = player.y - player.spd * dt end
    function rightUp() player.x = player.x + player.spd * dt player.y = player.y - player.spd * dt end
    function left() player.x = player.x - player.spd * dt end
    function right() player.x = player.x + player.spd * dt end
    function leftDown() player.x = player.x - player.spd * dt player.y = player.y + player.spd * dt end
    function down() player.y = player.y + player.spd * dt end
    function rightDown() player.x = player.x + player.spd * dt player.y = player.y + player.spd * dt end

    for i, v in ipairs(self.buttons) do
        if i == 1 then v:update(dt, leftUp)
        elseif i == 2 then v:update(dt, up)
        elseif i == 3 then v:update(dt, rightUp)
        elseif i == 4 then v:update(dt, left)
        elseif i == 6 then v:update(dt, right)
        elseif i == 7 then v:update(dt, leftDown)
        elseif i == 8 then v:update(dt, down)
        elseif i == 9 then v:update(dt, rightDown)
        end
    end
end 

function Joystick:draw()
    for i, v in pairs(self.buttons) do
        v:draw()
    end
end

function Joystick:touchpressed(id, x, y)
    for i, v in pairs(self.buttons) do
        v:touchpressed(id, x, y)
    end
end

function Joystick:touchmoved(id, x, y)
    for i, v in pairs(self.buttons) do
        v:touchmoved(id, x, y)
    end
end

function Joystick:touchreleased(id, x, y)
    for i, v in pairs(self.buttons) do
        v:touchreleased(id, x, y)
    end
end

return Joystick
