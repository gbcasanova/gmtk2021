-- Libs.
local bump = require("libs.bump")
local flux = require("libs.flux")
local cartographer = require("libs.cartographer")

-- Scripts.
local mapStuff = require("scripts.mapStuff")
local Entity = require("scripts.entity")
local Demony = require("scripts.demony")
local Player = require("scripts.player")
----------------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["drkarlovisky"] = love.graphics.newImage("assets/sprites/drkarlovisky.png")
    assets.sprites["demony"] = love.graphics.newImage("assets/sprites/demony.png")

    -- Music.
    assets.music = {}

    -- Sound effects.
    assets.sfx = {}

    return assets
end

local function sortVertically(a, b)
    return a.y < b.y
end

local screen = {}

function screen:Load(ScreenManager)
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.

    self.world = bump.newWorld()

    self.objects = {}
    self.objects.player = Player(self, 100, 100)
    self.map = cartographer.load("assets/tilemaps/level.lua")
    mapStuff.createSolids(self, self.map, self.map.layers.Solid, self.objects)

    table.insert(self.objects, Demony(self, 50, 50, false))
    table.insert(self.objects, Demony(self, 50+34, 50, false))
    table.insert(self.objects, Demony(self, 50+34*2, 50, false))
end

function screen:Update(dt)
    flux.update(dt)
    self.map:update(dt)

    -- Update objects.
    for i, v in pairs(self.objects) do
        v:update(dt)
    end
end

function screen:Draw()
    self.map:draw()

    -- Draw objects.
    table.sort(self.objects, sortVertically)
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