if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    Image = love.graphics.newImage('monkey.png')
end

function love.update()

end

function love.draw()
    love.graphics.draw(Image, love.math.random(0, 800), love.math.random(0, 600))
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
