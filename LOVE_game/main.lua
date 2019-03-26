

function love.load()

	--load player spritesheet
	playerImg = love.graphics.newImage("assets/sheet_hero_idle.png")
	playerAnimation = newAnimation(playerImg, 64, 64, 0.7)
	love.graphics.setNewFont(12)
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(255,255,255)
	
	--Variables
	playerX = 50
	
	playerSpeed = 0
	playerSpeedMax = 200
	playerAcceleration = 15
	
end

function love.update(dt)
	if love.keyboard.isDown("left") then
		playerX = playerX - playerSpeed * dt
		playerSpeed = playerSpeed + playerAcceleration
	end
	if love.keyboard.isDown("left") == false then
		playerSpeed = 0
	end
	if love.keyboard.isDown("right") then
		playerX = playerX + playerSpeed * dt
		playerSpeed = playerSpeed + playerAcceleration
	end
	if love.keyboard.isDown("right") == false then
		playerSpeed = 0
	end
	
	--Moving through spritesheet here
	playerAnimation.currentTime = playerAnimation.currentTime + love.timer.getDelta()
	if playerAnimation.currentTime >= playerAnimation.duration then
		playerAnimation.currentTime = playerAnimation.currentTime - playerAnimation.duration
	end
	
	
end

function love.draw()

	local spriteNum =  math.floor(playerAnimation.currentTime / playerAnimation.duration * #playerAnimation.quads) + 1
	love.graphics.draw(playerAnimation.spriteSheet, playerAnimation.quads[spriteNum], playerX, 210, 0, 4)

end

function love.quit()
	print("Thanks for playing!")
end

--Support functions down here

function newAnimation(image, width, height, duration)
	local animation = {}
	animation.spriteSheet = image
	animation.quads = {}
	
	for y = 0, image:getHeight() - height, height do
		for x = 0, image:getWidth() - width, width do
			table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
		end
	end
	
	animation.duration = duration or 1
	animation.currentTime = 0
	
	return animation
end
		
		
		
		
		
		
		
		
		
		
		