Circle = Object.extend(Object)

function Circle:new(x, y, radius, speed)
    self.x = x
    self.y = y
    self.radius = radius
    self.speed = speed
end

function Circle:update(dt)
    self.x = self.x + self.speed * dt
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