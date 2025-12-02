if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    -- Width, Height = love.graphics.getDimensions()
    -- Len = 50
    -- X = Width / 2 - Len / 2
    -- Y = Height / 2 - Len / 2
    -- Speed = 300
    ------
    -- Fruits = {'apple', 'banana'}
    -- for i = 1, #Fruits do
    --     print(Fruits[i])
    -- end
    ------
    Books = {
        createBook("Bob in bobland", "bob", 23),
        createBook("Tom in bobland the long awaited sequel", "bob", 50),
        createBook("Geremy in bobland the failed triqual", "bob", 67),
    }
end

function love.update(dt)
    --table.insert(Fruits, "monkey")
    -- movement(dt)
end

function love.draw()
    -- love.graphics.rectangle('line', X, Y, Len, Len)
    for i,v in ipairs(Books) do
        love.graphics.print(v.title, 100, 100 + 50 * i)
        love.graphics.print(v.author, 500, 100 + 50 * i)
        love.graphics.print(v.pages, 600, 100 + 50 * i)
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

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
