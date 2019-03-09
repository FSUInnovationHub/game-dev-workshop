

function love.load()
	playerImg = love.graphics.newImage("assets/sheet_hero_idle.png")
	playerAnimation = newAnimation(playerImg, 64, 64, 0.5)
	love.graphics.setNewFont(12)
	love.graphics.setColor(255,255,255)
	--love.graphics.setBackgroundColor(255,255,255)
	num = 0
end

function love.update(dt)
	if love.keyboard.isDown("down") then
		num = num + 100 * dt
	end
	
	playerAnimation.currentTime = playerAnimation.currentTime + love.timer.getDelta()
	if playerAnimation.currentTime >= playerAnimation.duration then
		playerAnimation.currentTime = playerAnimation.currentTime - playerAnimation.duration
	end
	
	
end

function love.draw()
		local spriteNum =  math.floor(playerAnimation.currentTime / playerAnimation.duration * #playerAnimation.quads) + 1
		love.graphics.draw(playerAnimation.spriteSheet, playerAnimation.quads[spriteNum], 0, 0, 0, 4)
	

	love.graphics.print("Click and drag the eyes", 100, 100)
	love.graphics.print("whaT", 200, num)
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
		
		
		
		
		
		
		
		
		
		
		