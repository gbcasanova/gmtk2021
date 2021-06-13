-- Libs.
local flux = require("libs.flux")
---------------------------------

local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}
    assets.sprites["bg"] = love.graphics.newImage("assets/sprites/ui/background.png")
    assets.sprites["logo"] = love.graphics.newImage("assets/sprites/ui/logo.png")

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

    self.assets.music["newerwave"]:play()

    self.fade = {r=0, g=0, b=0}
    flux.to(self.fade, 7, {r=1, g=1, b=1})

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