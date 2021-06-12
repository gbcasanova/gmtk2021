-- Libs.
local bump = require("libs.bump")
local flux = require("libs.flux")
local anim8 = require("libs.anim8")
local gamera = require("libs.gamera")
local cartographer = require("libs.cartographer")

-- Scripts.
local mapStuff = require("scripts.mapStuff")
-------------------------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["lives"] = love.graphics.newImage("assets/sprites/ui/lives.png")
    assets.sprites["tileset"] = love.graphics.newImage("assets/sprites/tileset.png")
    assets.sprites["redDemony"] = love.graphics.newImage("assets/sprites/redDemony.png")
    assets.sprites["blueDemony"] = love.graphics.newImage("assets/sprites/blueDemony.png")
    assets.sprites["drkarlovisky"] = love.graphics.newImage("assets/sprites/drkarlovisky.png")

    -- Music.
    assets.music = {}

    -- Sound effects.
    assets.sfx = {}
    assets.sfx["coin"] = love.audio.newSource("assets/sfx/coin.wav", "static")
    assets.sfx["step"] = love.audio.newSource("assets/sfx/footstep.ogg", "static")
    assets.sfx["hurt"] = love.audio.newSource("assets/sfx/hurt.ogg", "static")
    assets.sfx["death"] = love.audio.newSource("assets/sfx/death.ogg", "static")
    assets.sfx["bounce"] = love.audio.newSource("assets/sfx/bounce.ogg", "static")
    assets.sfx["switch"] = love.audio.newSource("assets/sfx/switch.wav", "static")

    -- Fonts.
    assets.fonts = {}
    assets.fonts["gameboy"] = love.graphics.newFont("assets/fonts/gameboy.ttf", 8)

    return assets
end

local function sortVertically(a, b)
    return a.y < b.y
end

local screen = {}

function screen:Load(ScreenManager)
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.
    self.ScreenManager = ScreenManager

    -- Camera.
    self.paused = false
    self.camera = gamera.new(0,0,2000,2000)
    self.camera:setWindow(0, 0, _G.gameWidth, _G.gameHeight)
    self.fade = {r=0, g=0, b=0}
    flux.to(self.fade, 2, {r=1, g=1, b=1})

    -- Create objects.
    self.objects = {}
    self.world = bump.newWorld(32)
    self.map = cartographer.load("assets/tilemaps/level.lua")
    mapStuff.createObjects(self, self.map, self.map.layers.Objects, self.objects)
    mapStuff.createSolids(self, self.map, self.map.layers.Solid, self.objects)

    -- UI.
    love.graphics.setFont(self.assets.fonts["gameboy"])
    self.livesSpr = self.assets.sprites["lives"]
    local g = anim8.newGrid(75, 21, self.livesSpr:getWidth(), self.livesSpr:getHeight())
    self.frame = g:getFrames(1, 1, 1, 2, 1, 3, 1, 4)

    -- Switches.
    self.coins = 0
    self.greyButton = false
    self.redButton = false
end

function screen:Update(dt)
    flux.update(dt)
    self.map:update(dt)

    if (not self.paused) then
        -- Update objects.
        for i, v in pairs(self.objects) do
            v:update(dt)

            -- Remove objects.
            if (not v.alive) then
                table.remove(self.objects, i)
            end
        end
    end
end

function screen:Draw()
    love.graphics.setColor(self.fade.r, self.fade.g, self.fade.b)

    -- Draw inside camera.
    self.camera:draw(function(l,t,w,h)
        self.map:draw()

        -- Draw objects.
        local playerDrawn = false
        table.sort(self.objects, sortVertically)
        for i, v in ipairs(self.objects) do

            if playerDrawn == false and v.y > self.objects.player.y then
                -- If the character is above the objects,
                -- draw below them.
                playerDrawn = true
                self.objects.player:draw()
            end
            v:draw()
        end

        -- Leave the foor loop so the action
        -- doesn't repeat for every single object.
        if playerDrawn == false then
            -- If the character is below the objects,
            -- draw above them.
            self.objects.player:draw()
        end
    end)

    -- Draw UI.
    love.graphics.draw(self.livesSpr, self.frame[self.objects.player.lives], _G.gameWidth - 85, 10)
    love.graphics.print("COINS: " .. self.coins , 10, 15)
end

function screen:resetScreen()
    local function resetLevel()
        self.ScreenManager:SwitchStates("level")
    end

    self.paused = true
    flux.to(self.fade, 2, {r=0, g=0, b=0}):oncomplete(resetLevel)
end

function screen:MousePressed(x, y, button)
    self:resetScreen()
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