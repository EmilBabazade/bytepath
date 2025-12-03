local Object = require('classic')

local Shape = Object.extend(Object)

function Shape:new(x, y, speed)
    self.x = x;
    self.y = y;
    self.speed = speed;
end

function Shape:update(dt)
    self.x = self.x + self.speed * dt
end

return Shape