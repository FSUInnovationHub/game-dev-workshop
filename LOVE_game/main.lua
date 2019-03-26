
--Lua has tables, much like objects
player = {}	--This is how a table is created

function love.load()

	--Sets size of the window
	success = love.window.setMode(512, 256)

	--load player spritesheet
	playerImg = love.graphics.newImage("assets/sheet_hero_idle.png")
	playerAnimation = newAnimation(playerImg, 64, 64, 0.7)

	--load background
	love.graphics.setBackgroundColor(0,230/255,100/255)
	
	background1 = love.graphics.newImage("assets/background/background1.png")
	background2 = love.graphics.newImage("assets/background/background2.png")
	background3 = love.graphics.newImage("assets/background/background3.png")
	background4 = love.graphics.newImage("assets/background/background4.png")
	background5 = love.graphics.newImage("assets/background/background5.png")
	background6 = love.graphics.newImage("assets/background/background6.png")
	
	-- Player Variables
	player.x = 50
	
	player.speedLeft = 0
	player.speedRight = 0
	player.speedMax = 500
	player.acceleration = 15
	player.deceleration = 25

	
end

function love.update(dt)

--Keyboard Controls
	
	-- A key
	if love.keyboard.isDown("a") then
		--Accelerates player until max speed towards left.
		player.x = player.x - player.speedLeft * dt
		player.speedLeft = player.speedLeft + player.acceleration
		
		if player.speedLeft >= player.speedMax then
			player.speedLeft = player.speedMax
		end
	else
		--Friction to slow player to a stop
		player.x = player.x - player.speedLeft * dt
		player.speedLeft = player.speedLeft - player.deceleration
		if player.speedLeft <= 0 then
			player.speedLeft = 0
		end
	end
		
	-- D Key
	if love.keyboard.isDown("d") then
		--Accelerates player until max speed towards right.
		player.x = player.x + player.speedRight * dt
		player.speedRight = player.speedRight + player.acceleration
		
		if player.speedRight >= player.speedMax then
			player.speedRight = player.speedMax
		end
	else
		--Friction to slow player to a stop
		player.x = player.x + player.speedRight * dt
		player.speedRight = player.speedRight - player.deceleration
		if player.speedRight <= 0 then
			player.speedRight = 0
		end
	end
	
	
	
	
	
	
	
	
	
	--Moving through spritesheet here
	playerAnimation.currentTime = playerAnimation.currentTime + love.timer.getDelta()
	if playerAnimation.currentTime >= playerAnimation.duration then
		playerAnimation.currentTime = playerAnimation.currentTime - playerAnimation.duration
	end
	
	
end

function love.draw()

	--Draw Background Image
	love.graphics.draw(background1)
	love.graphics.draw(background2)
	love.graphics.draw(background3)
	love.graphics.draw(background4)
	love.graphics.draw(background5)

	--floors the number so the spriteSheet goes to the next sprite rather than in between.
	local spriteNum =  math.floor(playerAnimation.currentTime / playerAnimation.duration * #playerAnimation.quads) + 1
	
	--Draw Animation: love.graphics.draw( texture, quad, x, y, orientation, scale x, scale y, offset x, offset y, Shearing x, Shearing y )
	--https://www.love2d.org/wiki/love.graphics.draw
	love.graphics.draw(playerAnimation.spriteSheet, playerAnimation.quads[spriteNum], player.x, 176, 0, 1)
	
	
	--final background image to be in front of the player
	love.graphics.draw(background6)

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
		
		
		
		
		
		
		
		
		
		
		