if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    X = 0
    Width = love.graphics.getWidth()
    Radius = 100
end

function love.update(dt)
    X = X + 500 * dt
    if X - Radius > Width then
        X = - Radius
    end
end

function love.draw()
    love.graphics.circle('line', X, 300, Radius, 200)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
