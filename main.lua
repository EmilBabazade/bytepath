if arg[2] == "debug" then
    require("lldebugger").start()
end

local shapes = {}
local monkey = {}
function love.load()
    Rectangle = require('rectangel')
    Circle = require('circle')
    monkey.image = love.graphics.newImage('monkey.png')
    monkey.x = 100
    monkey.y = 100
end

function love.update(dt)
    for _, f in pairs(shapes) do
        f:update(dt)
    end
end

function love.keypressed(key)
    if key == 'space' then
        local r = Rectangle.newRandom()
        table.insert(shapes, r)

        local c = Circle.newRandom()
        table.insert(shapes, c)
        
        monkey.x = math.random(0, 500)
        monkey.y = math.random(0, 500)
    end
end

function love.draw()
    love.graphics.draw(monkey.image, monkey.x, monkey.y, 0, 0.25, 0.25)
    for _, f in pairs(shapes) do
        f:draw()
    end
end

local function movement(dt)
    if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
        Y = Y + Speed * dt
        if Y > Height + Len / 2 then
            Y = -Len
        end
    elseif love.keyboard.isDown("w") or love.keyboard.isDown("up") then
        Y = Y - Speed * dt
        if Y < -Len / 2 then
            Y = Height + Len
        end
    end
        
    if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
        X = X - Speed * dt
        if X < -Len / 2 then
            X = Width + Len
        end
    elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
        X = X + Speed * dt
        if X > Width + Len / 2 then
            X = Len
        end
    end
end

local function createBook(title, author, pages)
    return {
        title=title, 
        author=author, 
        pages=pages
    }
end

function CreateRect()
    local rect = {}
    rect.x = math.random(100, 500)
    rect.y = math.random(100, 500)
    rect.width = 70
    rect.height = 90
    rect.speed = 100
    return rect
end

function CreateCircle()
    return {
        x = math.random(100, 500),
        y = math.random(100, 500),
        radius = 70,
        speed = 100
    }
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
