-- Libs.
local ScreenManager = require("libs.ScreenManager")
_G.push = require("libs.push")
---------------------------------------------------

function love.load()
    _G.gameDebug = false

    _G.normalMode = true
    _G.levelMusic = love.audio.newSource("assets/music/levelmusic.mp3", "stream")
    _G.levels = {
        "assets/tilemaps/level1.lua",
        "assets/tilemaps/level2.lua",
        "assets/tilemaps/level3.lua",
        "assets/tilemaps/level4.lua",
        "assets/tilemaps/level5.lua",
        "assets/tilemaps/level6.lua",
    }
    _G.currentLevel = 1

    -- Set up screen.
    love.graphics.setDefaultFilter("nearest", "nearest") -- Set's pixel art filter.
    _G.gameWidth, _G.gameHeight = 384, 216
    local windowWidth, windowHeight = _G.gameWidth*3, _G.gameHeight*3
    _G.push:setupScreen(_G.gameWidth, _G.gameHeight, windowWidth, windowHeight, {
        fullscreen = false,
        resizable  = true,
        stretched  = false
    })

    ScreenManager:SwitchStates("menu")
end

function love.update(dt)
    ScreenManager:Update(dt)
end

function love.draw()
    push:start()
        ScreenManager:Draw()
    push:finish()
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    ScreenManager:KeyPressed(key)
end

function love.keyreleased(key)
    ScreenManager:KeyReleased(key)
end

function love.mousepressed(x, y, button)
    ScreenManager:MousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
    ScreenManager:MouseReleased(x, y, button)
end

function love.mousemoved(x, y, dx, dy, istouch)
    ScreenManager:MouseMoved(x, y, dx, dy, istouch)
end
