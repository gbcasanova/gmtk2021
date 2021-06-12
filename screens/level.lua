-- Libs.
local bump = require("libs.bump")
local flux = require("libs.flux")
local gamera = require("libs.gamera")
local cartographer = require("libs.cartographer")

-- Scripts.
local mapStuff = require("scripts.mapStuff")
local Demony = require("scripts.demony")
local Player = require("scripts.player")
----------------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["demony"] = love.graphics.newImage("assets/sprites/demony.png")
    assets.sprites["tileset"] = love.graphics.newImage("assets/sprites/tileset.png")
    assets.sprites["drkarlovisky"] = love.graphics.newImage("assets/sprites/drkarlovisky.png")

    -- Music.
    assets.music = {}

    -- Sound effects.
    assets.sfx = {}
    assets.sfx["coin"] = love.audio.newSource("assets/sfx/coin.wav", "static")
    assets.sfx["bounce"] = love.audio.newSource("assets/sfx/bounce.ogg", "static")
    assets.sfx["step"] = love.audio.newSource("assets/sfx/footstep.ogg", "static")

    return assets
end

local function sortVertically(a, b)
    return a.y < b.y
end

local screen = {}

function screen:Load(ScreenManager)
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.

    -- Camera.
    self.camera = gamera.new(0,0,2000,2000)
    self.camera:setWindow(0, 0, _G.gameWidth, _G.gameHeight)

    -- Create objects.
    self.objects = {}
    self.world = bump.newWorld()
    self.objects.player = Player(self, 100, 100)
    self.map = cartographer.load("assets/tilemaps/level.lua")
    mapStuff.createObjects(self, self.map, self.map.layers.Objects, self.objects)
    mapStuff.createSolids(self, self.map, self.map.layers.Solid, self.objects)

    table.insert(self.objects, Demony(self, 50, 50, false))
    table.insert(self.objects, Demony(self, 50+34, 50, true))
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
    -- Draw inside camera.
    self.camera:draw(function(l,t,w,h)
        self.map:draw()

        -- Draw objects.
        table.sort(self.objects, sortVertically)
        for i, v in pairs(self.objects) do
            v:draw()
        end
    end)
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