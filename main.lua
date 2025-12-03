if arg[2] == "debug" then
    require("lldebugger").start()
end

local figures = {}

function love.load()
    Object = require("classic")
    require('rectangel')
    require('circle')

    -- r1 = Rectangle(100, 100, 200, 150, 100)
    -- r2 = Rectangle(200, 300, 50, 150, 100)
    -- c3 = Cirlce(200, 300, 50, 150)
end

function love.update(dt)
    for _, f in pairs(figures) do
        f:update(dt)
    end
end

function love.keypressed(key)
    if key == 'space' then
        local r = Rectangle.newRandom()
        table.insert(figures, r)

        local c = Circle.newRandom()
        table.insert(figures, c)
    end
end

function love.draw()
    for _, f in pairs(figures) do
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
