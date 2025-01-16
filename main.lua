function newHitbox(x, y, w, h)
    return {x=x, y=y, w=w, h=h}
end

function isColliding(a, b)
    return a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h
end

function handleInputs(player)
    if(love.keyboard.isDown("w")) then
        player.yVel = -1
    end
    if(love.keyboard.isDown("s")) then
        player.yVel = 1
    end
    if(love.keyboard.isDown("a")) then
        player.xVel = -1
    end
    if(love.keyboard.isDown("d")) then
        player.xVel = 1
    end
end

function updateVelocity(token, tokens)

    token.hitbox.x = token.hitbox.x + token.xVel
    for index, value in ipairs(tokens) do
        if(value ~= token) then
            if(isColliding(token.hitbox, value.hitbox)) then
                if (token.xVel > 0) then
                    token.hitbox.x = value.hitbox.x - token.hitbox.w
                elseif (token.xVel < 0) then
                    token.hitbox.x = value.hitbox.x + value.hitbox.w
                end
            end
        end
    end

    token.hitbox.y = token.hitbox.y + token.yVel
    for index, value in ipairs(tokens) do
        if(value ~= token) then
            if(isColliding(token.hitbox, value.hitbox)) then
                if (token.yVel > 0) then
                    token.hitbox.y = value.hitbox.y - token.hitbox.h
                elseif (token.yVel < 0) then
                    token.hitbox.y = value.hitbox.y + value.hitbox.h
                end
            end
        end
    end
end


function love.load()
    tiles = {}
    tileSelected = nil
    text = "PLACE HOLDER"
    local size = 20
    for i=1,16,1 do
        tiles[i] = {x=100+(size+20)*(i%4), y=100+(size+20)*math.floor((i-1)/4), w=size, h=size}
        tiles[i] = {hitbox=love.physics.newRectangleShape(100+(size+20)*(i%4), 100+(size+20)*math.floor((i-1)/4), size, size)}
    end

    hitbox = {x=0, y=0, w=10, h=10}
    player = { hitbox = newHitbox(0, 0, 10, 10), r=0.5, g=0.5, b=0, xVel = 0, yVel = 0}
    enemy = { hitbox = newHitbox(60, 20, 10, 10), r=0.5, g=0, b=0.5, xVel = 0, yVel = 0}
    enemy2 = { hitbox = newHitbox(70, 25, 15, 20), r=0.5, g=0, b=0.5, xVel = 0, yVel = 0}
    tokens = {enemy, player, enemy2}
end

function love.draw()
    love.graphics.print(text, 400, 300)
    for index, value in ipairs(tokens) do
        love.graphics.setColor(value.r, value.g, value.b)
        love.graphics.rectangle("fill", value.hitbox.x, value.hitbox.y, value.hitbox.w, value.hitbox.h)
    end
end

function love.update()

    player.xVel = 0
    player.yVel = 0

    handleInputs(player)
    for index, token in ipairs(tokens) do
        updateVelocity(token, tokens)
    end

    if(isColliding(player.hitbox, enemy.hitbox)) then
        text = "Colliding"
    else
        text = "Safe"
    end

end
function newHitbox(x, y, w, h)
    return {x=x, y=y, w=w, h=h}
end

function isColliding(a, b)
    return a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h
end

function handleInputs(player)
    if(love.keyboard.isDown("w")) then
        player.yVel = -1
    end
    if(love.keyboard.isDown("s")) then
        player.yVel = 1
    end
    if(love.keyboard.isDown("a")) then
        player.xVel = -1
    end
    if(love.keyboard.isDown("d")) then
        player.xVel = 1
    end
end

function updateVelocity(token, tokens)

    token.hitbox.x = token.hitbox.x + token.xVel
    for index, value in ipairs(tokens) do
        if(value ~= token) then
            if(isColliding(token.hitbox, value.hitbox)) then
                if (token.xVel > 0) then
                    token.hitbox.x = value.hitbox.x - token.hitbox.w
                elseif (token.xVel < 0) then
                    token.hitbox.x = value.hitbox.x + value.hitbox.w
                end
            end
        end
    end

    token.hitbox.y = token.hitbox.y + token.yVel
    for index, value in ipairs(tokens) do
        if(value ~= token) then
            if(isColliding(token.hitbox, value.hitbox)) then
                if (token.yVel > 0) then
                    token.hitbox.y = value.hitbox.y - token.hitbox.h
                elseif (token.yVel < 0) then
                    token.hitbox.y = value.hitbox.y + value.hitbox.h
                end
            end
        end
    end
end


function love.load()
    tiles = {}
    tileSelected = nil
    text = "PLACE HOLDER"
    local size = 20
    for i=1,16,1 do
        tiles[i] = {x=100+(size+20)*(i%4), y=100+(size+20)*math.floor((i-1)/4), w=size, h=size}
        tiles[i] = {hitbox=love.physics.newRectangleShape(100+(size+20)*(i%4), 100+(size+20)*math.floor((i-1)/4), size, size)}
    end

    hitbox = {x=0, y=0, w=10, h=10}
    player = { hitbox = newHitbox(0, 0, 10, 10), r=0.5, g=0.5, b=0, xVel = 0, yVel = 0}
    enemy = { hitbox = newHitbox(60, 20, 10, 10), r=0.5, g=0, b=0.5, xVel = 0, yVel = 0}
    enemy2 = { hitbox = newHitbox(70, 25, 15, 20), r=0.5, g=0, b=0.5, xVel = 0, yVel = 0}
    tokens = {enemy, player, enemy2}
end

function love.draw()
    love.graphics.print(text, 400, 300)
    for index, value in ipairs(tokens) do
        love.graphics.setColor(value.r, value.g, value.b)
        love.graphics.rectangle("fill", value.hitbox.x, value.hitbox.y, value.hitbox.w, value.hitbox.h)
    end
end

function love.update()

    player.xVel = 0
    player.yVel = 0

    handleInputs(player)
    for index, token in ipairs(tokens) do
        updateVelocity(token, tokens)
    end

    if(isColliding(player.hitbox, enemy.hitbox)) then
        text = "Colliding"
    else
        text = "Safe"
    end

end
