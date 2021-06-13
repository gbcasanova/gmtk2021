-- Libs.
local flux = require("libs.flux")
---------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["background"] = love.graphics.newImage("assets/sprites/ui/endgame.png")

    -- Music.
    assets.music = {}

    -- Sound effects.
    assets.sfx = {}

    return assets
end

local screen = {}

function screen:Load(ScreenManager) -- pass a reference to the ScreenManager. Avoids circlular require()
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.
    self.ScreenManager = ScreenManager

    self.fade = {r=0, g=0, b=0}
    flux.to(self.fade, 4, {r=1, g=1, b=1})
    self.fading = false
end

function screen:Update(dt)
    flux.update(dt)
end

function screen:Draw()
    love.graphics.setColor(self.fade.r, self.fade.g, self.fade.b)
    love.graphics.draw(self.assets.sprites["background"], 0, 0)
end

function screen:MousePressed(x, y, button)
    --
end

function screen:MouseReleased(x, y, button)
    --
end

function screen:KeyPressed(key)
    local function switch()
        self.ScreenManager:SwitchStates("menu")
    end

    if (key == "return") then
        if (not self.fading) then
            self.fading = true
            flux.to(self.fade, 4, {r=0, g=0, b=0}):oncomplete(switch)
        end
    end
end

function screen:KeyReleased(key)
    --
end

return screen