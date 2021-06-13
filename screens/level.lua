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
    assets.sfx["life"] = love.audio.newSource("assets/sfx/life.mp3", "static")
    assets.sfx["coin"] = love.audio.newSource("assets/sfx/coin.wav", "static")
    assets.sfx["step"] = love.audio.newSource("assets/sfx/footstep.wav", "static")
    assets.sfx["hurt"] = love.audio.newSource("assets/sfx/hurt.ogg", "static")
    assets.sfx["death"] = love.audio.newSource("assets/sfx/death.ogg", "static")
    assets.sfx["bounce"] = love.audio.newSource("assets/sfx/bounce.ogg", "static")
    assets.sfx["switch"] = love.audio.newSource("assets/sfx/switch.wav", "static")

    -- Fonts.
    assets.fonts = {}
    assets.fonts["gameboy"] = love.graphics.newFont("assets/fonts/gameboy.ttf", 8)
    assets.fonts["gameboyBig"] = love.graphics.newFont("assets/fonts/gameboy.ttf", 24)

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

    -- Create objects.
    self.objects = {}
    self.world = bump.newWorld(32)
    self.map = cartographer.load(_G.levels[_G.currentLevel])
    mapStuff.createObjects(self, self.map, self.map.layers.Objects, self.objects)
    mapStuff.createSolids(self, self.map, self.map.layers.Solid, self.objects)

    -- Camera.
    self.paused = false
    self.camera = gamera.new(0, 0, self.map.width * self.map.tilewidth, self.map.height * self.map.tileheight)
    self.camera:setWindow(0, 0, _G.gameWidth, _G.gameHeight)
    self.fade = {r=0, g=0, b=0}
    flux.to(self.fade, 2, {r=1, g=1, b=1})

    -- UI.
    self.livesSpr = self.assets.sprites["lives"]
    local g = anim8.newGrid(75, 21, self.livesSpr:getWidth(), self.livesSpr:getHeight())
    self.frame = g:getFrames(1, 1, 1, 2, 1, 3, 1, 4)
    self.levelTxt = {}
    self.levelTxt.string = love.graphics.newText(self.assets.fonts["gameboyBig"], "LEVEL " .. _G.currentLevel)
    self.levelTxt.x = _G.gameWidth/2 - self.levelTxt.string:getWidth()/2
    self.levelTxt.y = -self.levelTxt.string:getHeight()
    flux.to(self.levelTxt, 1, {y = 0})
        :after(self.levelTxt, 2, {y = -self.levelTxt.string:getHeight()})
        :delay(3)

    -- Switches.
    self.coins = 0
    self.greyButton = false
    self.redButton = false
    self.blueButton = false
end

function screen:Update(dt)
    flux.update(dt)
    self.map:update(dt)
    _G.levelMusic:setVolume(self.fade.r)

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

    -- Loop level music.
    if (not _G.levelMusic:isPlaying()) then
        _G.levelMusic:play()
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
    love.graphics.draw(self.levelTxt.string, self.levelTxt.x, self.levelTxt.y)
    love.graphics.setFont(self.assets.fonts["gameboy"])
    love.graphics.print("COINS: " .. self.coins , 10, 15)
end

function screen:resetScreen()
    local function resetLevel()
        if _G.currentLevel + 1 <= 5 then
            if self.objects.player.dying == false then
                _G.currentLevel = _G.currentLevel + 1
                self.ScreenManager:SwitchStates("level")
            else
                self.ScreenManager:SwitchStates("level")
            end
        else
            self.ScreenManager:SwitchStates("endgame")
        end
    end

    self.paused = true
    flux.to(self.fade, 2, {r=0, g=0, b=0}):oncomplete(resetLevel)
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