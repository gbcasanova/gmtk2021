-- Libs.
local bump = require("libs.bump")

-- Scripts.
local Player = require("scripts.player")
----------------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["drkarlovisky"] = love.graphics.newImage("assets/sprites/drkarlovisky.png")

    -- Music.
    assets.music = {}

    -- Sound effects.
    assets.sfx = {}

    return assets
end

local screen = {}

function screen:Load(ScreenManager)
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.

    self.world = bump.newWorld()

    self.objects = {}
    self.objects.player = Player(self, 0, 0)
end

function screen:Update(dt)
    -- Update objects.
    for i, v in pairs(self.objects) do
        v:update(dt)
    end
end

function screen:Draw()
    -- Draw objects.
    for i, v in pairs(self.objects) do
        v:draw()
    end
end

function screen:MousePressed(x, y, button)
    --
end

function screen:MouseReleased(x, y, button)
    --
end

function screen:KeyPressed(key)
    --
end

function screen:KeyReleased(key)
    --
end

return screen