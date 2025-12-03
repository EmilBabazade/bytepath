local Shape = require('shape')

local Circle = Shape.extend(Shape)

function Circle:new(x, y, radius, speed)
    self.radius = radius
    Circle.super.new(self, x, y, speed)
end

function Circle:draw()
    love.graphics.circle('line', self.x, self.y, self.radius)
end

function Circle.newRandom()
    return Circle(
        math.random(0, love.graphics.getWidth()),
        math.random(0, love.graphics.getHeight()),
        math.random(0, 400),
        math.random(100, 500)
    )
end

return Circle