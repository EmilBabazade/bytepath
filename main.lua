if arg[2] == "debug" then
    require("lldebugger").start()
end

local rects = {}

function love.load()
    table.insert(rects, CreateRect())
end

function love.update(dt)
    for _,rect in pairs(rects) do
        rect.x = rect.x + rect.speed * dt
    end
end

function love.keypressed(key)
    if key == 'space' then
       table.insert(rects, CreateRect())
    end
end

function love.draw()
    for _,rect in pairs(rects) do
        love.graphics.rectangle('line', rect.x, rect.y, rect.width, rect.height)
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
    rect.x = 100
    rect.y = 100
    rect.width = 70
    rect.height = 90
    rect.speed = 100
    return rect
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
