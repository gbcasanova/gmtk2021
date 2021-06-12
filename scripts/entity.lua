-- Libs.
local Object = require("libs.classic")
-----------------------------------------

local Entity = Object:extend()

function Entity:new(scr, x, y, w, h)
    self.x, self.y = x, y
    self.w, self.h = w, h

    self.name = "Entity"
    self.scr = scr
    self.alive = true

    -- Add to collision world.
    scr.world:add(self, self.x, self.y, self.w, self.h)
end

function Entity:update(dt)
end

function Entity:draw()
    -- Draw debug outline.
    if (_G.gameDebug) then
        love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    end
end

return Entity