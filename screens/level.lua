local function loadAssets()
    local assets = {}

    -- Sprites.
    assets.sprites = {}

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

    
end

function screen:Update(dt)
    --
end

function screen:Draw()
    --
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