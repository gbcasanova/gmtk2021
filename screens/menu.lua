-- Libs.
local flux = require("libs.flux")

-- Scripts.
local UiButton = require("scripts.ui.uibutton")
-----------------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["bg"] = love.graphics.newImage("assets/sprites/ui/background.png")
    assets.sprites["logo"] = love.graphics.newImage("assets/sprites/ui/logo.png")
    assets.sprites["buttons"] = love.graphics.newImage("assets/sprites/ui/buttons.png")

    -- Music.
    assets.music = {}
    assets.music["newerwave"] = love.audio.newSource("assets/music/newerwave.mp3", "stream")

    -- Sound effects.
    assets.sfx = {}

    return assets
end

local screen = {}

function screen:Load(ScreenManager) -- pass a reference to the ScreenManager. Avoids circlular require()
    collectgarbage()  -- Unload assets.
    self.assets = loadAssets() -- Load assets.
    self.ScreenManager = ScreenManager

    love.audio.stop()
    self.assets.music["newerwave"]:play()

    self.fade = {r=0, g=0, b=0}
    flux.to(self.fade, 4, {r=1, g=1, b=1})
    self.fading = false

    self.easyButton = UiButton(self, 152, 130, 1)
    self.normalButton = UiButton(self, 152, 155, 2)

    -- Logo.
    self.logo = {}
    self.logo.sprite = self.assets.sprites["logo"]
    self.logo.tweenPlaying = false
    self.logo.x = 80
    self.logo.y = 5
    self.logo.startY = 0
    self.logo.endY = 5
end

function screen:Update(dt)
    flux.update(dt)
    self.assets.music["newerwave"]:setVolume(self.fade.r)

    self.easyButton:update(dt)
    self.normalButton:update(dt)
end

function screen:Draw()
    love.graphics.setColor(self.fade.r, self.fade.g, self.fade.b)
    love.graphics.draw(self.assets.sprites["bg"], 0, 0)

    -- Loop tween animation.
    local function notPlaying()
        self.logo.tweenPlaying = true
    end
    local function playingTween()
        self.logo.tweenPlaying = false
    end
    if (not self.logo.tweenPlaying) then
        flux.to(self.logo, 0.5, {y = self.logo.startY})
            :onstart(notPlaying)
            :after(self.logo, 0.5, {y = self.logo.endY})
            :oncomplete(playingTween)
    end

    -- Draw logo.
    love.graphics.draw(
        self.assets.sprites["logo"], 
        self.logo.x, 
        self.logo.y
    )

    self.easyButton:draw()
    self.normalButton:draw()
end

function screen:MousePressed(x, y, button)
    local function switch()
        self.ScreenManager:SwitchStates("level")
        love.audio.stop()
        self.ScreenManager:SwitchStates("level")
        _G.levelMusic:play()
    end

    local function easyFunc()
        self.fading = true
        _G.normalMode = true
        flux.to(self.fade, 4, {r=0, g=0, b=0}):oncomplete(switch)
    end

    local function hardFunc()
        self.fading = true
        _G.normalMode = false
        flux.to(self.fade, 4, {r=0, g=0, b=0}):oncomplete(switch)
    end

    if (not self.fading) then
        self.easyButton:mousepressed(x,y,button, easyFunc)
        self.normalButton:mousepressed(x,y,button,hardFunc)
    end
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