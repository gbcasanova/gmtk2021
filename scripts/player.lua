-- Libs.
local flux = require("libs.flux")
local anim8  = require("libs.anim8")
local Object = require("libs.classic")
--------------------------------------

local Player = Object:extend()

function Player:new(scr, x, y)
    self.scr = scr
    self.x, self.y = x, y
    self.w, self.h = 22, 9
    self.name = "Player"
    self.alive = true
    
    self.flip = 1
    self.flipSpd = 0.4
    self.spd = 150
    self.moving = false
    self.canMove = true

    -- Hurt action, lives, etc.
    self.lives = 4
    self.hurtSpd = 20
    self.hurtMax = 100
    self.hurtTimer = 0
    self.opacity = 1
    self.opacityTweenPlaying = false
    self.dying = false

    -- Create sprite.
    self.sprite = scr.assets.sprites["drkarlovisky"]
    self.sprW, self.sprH = 30, 65
    local g = anim8.newGrid(self.sprW, self.sprH, self.sprite:getWidth(), self.sprite:getHeight())

    -- Create animations.
    self.anim = {}
    self.anim["idle"]    = anim8.newAnimation(g('1-4', 1), 0.1)
    self.anim["walking"] = anim8.newAnimation(g('1-3', 2), 0.1)
    self.anim.current = self.anim["idle"]

    -- Camera.
    self.camVar = {}
    self.camVar.x, self.camVar.y = self.x, self.y

    scr.world:add(self, self.x, self.y, self.w, self.h) -- Add to collision world.
end

function Player:hurt()
    if (self.hurtTimer <= 0) then 
        if (self.lives >= 3) then
            self.hurtTimer = self.hurtMax
            self.lives = self.lives - 1
        else
            self.scr:resetScreen()
            self.dying = true
        end
    end
end

function Player:update(dt)
    self.anim.current:update(dt)

    -- Movement.
    self.moving = false
    if (self.canMove) then
        local walkSound = self.scr.assets.sfx["step"]

        if (love.keyboard.isDown("up")) then
            self.moving = true
            self.y = self.y - self.spd * dt
            if (not walkSound:isPlaying()) then walkSound:play() end
        elseif (love.keyboard.isDown("down")) then
            self.moving = true
            self.y = self.y + self.spd * dt
            if (not walkSound:isPlaying()) then walkSound:play() end
        end
        if (love.keyboard.isDown("left")) then
            self.moving = true
            self.x = self.x - self.spd * dt
            flux.to(self, self.flipSpd, {flip = 1})
            if (not walkSound:isPlaying()) then walkSound:play() end
        elseif (love.keyboard.isDown("right")) then
            self.moving = true
            self.x = self.x + self.spd * dt
            flux.to(self, self.flipSpd, {flip = -1})
            if (not walkSound:isPlaying()) then walkSound:play() end
        end
    end

    -- Collision resolution.
    if (not self.dying) then
        local actualX, actualY, cols, len = self.scr.world:move(self, self.x, self.y)
        self.x, self.y = actualX, actualY
    end

    -- Animation.
    if (self.moving) then
        self.anim.current = self.anim["walking"]
    else
        self.anim.current = self.anim["idle"]
    end

    -- Smooth Camera.
    flux.to(self.camVar, 0.5, {x = (self.x + self.sprW/2) - (self.sprW/2 - self.w/2)})
    flux.to(self.camVar, 0.5, {y = (self.y + self.sprH/2) - (self.sprH - self.h)})

    self.scr.camera:setPosition(self.camVar.x, self.camVar.y)

    -- Hurt timer.
    if (self.hurtTimer > 0) then
        self.hurtTimer = self.hurtTimer - self.hurtSpd * dt

        -- Hurt Opacity Tween (God help me).
        local function notPlaying()
            self.opacityTweenPlaying = true
        end
        local function playingTween()
            self.opacityTweenPlaying = false
        end

        if (not self.opacityTweenPlaying) then
            flux.to(self, 0.5, {opacity = 0.5})
                :onstart(notPlaying)
                :after(self, 0.5, {opacity = 1})
                :oncomplete(playingTween)
        end
    end

    print(self.opacityTweenPlaying)
end

function Player:draw()
    love.graphics.setColor(self.scr.fade.r, self.scr.fade.g, self.scr.fade.b, self.opacity)

    -- Draw debug outline.
    if (_G.gameDebug) then
        love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
    end

    -- Draw sprite centered and above
    -- the collision box.
    self.anim.current:draw(
        self.sprite, 
        (self.x + self.sprW/2) - (self.sprW/2 - self.w/2), 
        (self.y + self.sprH/2) - (self.sprH - self.h), 
        0, self.flip, 1, 
        self.sprW/2,
        self.sprH/2
    )

    love.graphics.setColor(self.scr.fade.r, self.scr.fade.g, self.scr.fade.b, 1)
end

return Player