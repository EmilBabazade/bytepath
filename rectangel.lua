local Shape = require('shape')

local Rectangle = Shape.extend(Shape)

function Rectangle:new(x, y, width, height, speed)
    self.width = width
    self.height = height
    Rectangle.super.new(self, x, y, speed)
end


function Rectangle:draw()
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function Rectangle.newRandom()
    return Rectangle(
        math.random(0, love.graphics.getWidth()),
        math.random(0, love.graphics.getHeight()),
        math.random(0, 400),
        math.random(0, 400),
        math.random(100, 500)
    )
end

return Rectangle