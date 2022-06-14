$gtk.reset

def setup args
	args.state.player.x ||= 12
	args.state.player.y ||= 12
	args.state.player.dx ||= -1
	args.state.player.dy ||= 0
	args.state.plane.x ||= 0
	args.state.plane.y ||= 0.66
	
	args.state.currentFrame = args.tick_count
	args.state.previousFrame = args.tick_count

	args.state.mapWidth = 24
	args.state.mapHeight = 24
	args.state.screenWidth = 1280
	args.state.screenHeight = 720

	args.state.level =
	[
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
	]
	
	args.outputs.solids << [0, 0, 1280, 720, 30, 30, 30]
end

def calc args
	x = 0
	while x < args.state.screenWidth
		args.state.cameraX = 2 * x / args.state.screenWidth.to_f - 1 # X-coordinate in camera space
		args.state.rayDirX = args.state.player.dx + args.state.plane.x * args.state.cameraX
		args.state.rayDirY = args.state.player.dy + args.state.plane.y * args.state.cameraX
		
		# Which box of the map we're in
		args.state.mapX = args.state.player.x
		args.state.mapY = args.state.player.y
		
		# Length of ray from one x or y-side to next x or y-side
		args.state.deltaDistX = (args.state.rayDirX == 0) ? 1e30 : (1 / args.state.rayDirX).abs
		args.state.deltaDistY = (args.state.rayDirY == 0) ? 1e30 : (1 / args.state.rayDirY).abs
		
		# Calculate step and initial sideDist
		if args.state.rayDirX < 0
			args.state.stepX = -1
			args.state.sideDistX = (args.state.player.x - args.state.mapX) * args.state.deltaDistX
		else
			args.state.stepX = 1
			args.state.sideDistX = (args.state.mapX + 1.0 - args.state.player.x) * args.state.deltaDistX
		end
		if args.state.rayDirY < 0
			args.state.stepY = -1
			args.state.sideDistY = (args.state.player.y - args.state.mapY) * args.state.deltaDistY
		else
			args.state.stepY = 1
			args.state.sideDistY = (args.state.mapY + 1.0 - args.state.player.y) * args.state.deltaDistY
		end
		
		hit = 0 # Was there a wall hit?
		side = Integer
		
		while hit == 0
			if args.state.sideDistX < args.state.sideDistY
				args.state.sideDistX += args.state.deltaDistX
				args.state.mapX += args.state.stepX
				side = 0
			else
				args.state.sideDistY += args.state.deltaDistY
				args.state.mapY += args.state.stepY
				side = 1
			end
			args.state.level.map_2d do |y, x, levelTile|
				if levelTile > 0
					hit = 1
					args.state.tileNumber = levelTile
				end
			end
		end
		
		if side == 0
			args.state.perpWallDist = (args.state.sideDistX - args.state.deltaDistX)
		else
			args.state.perpWallDist = (args.state.sideDistY - args.state.deltaDistY)
		end
		
		args.state.lineHeight = args.state.screenHeight / args.state.perpWallDist
		
		args.state.drawStart = -args.state.lineHeight / 2 + args.state.screenHeight / 2
		if args.state.drawStart < 0
			args.state.drawStart = 0
		end
		
		args.state.drawEnd = args.state.lineHeight / 2 + args.state.screenHeight / 2
		if args.state.drawEnd < 0
			args.state.drawEnd = args.state.screenHeight - 1
		end
		
		args.state.wallColor = 255
		if side == 1
			args.state.wallColor = 255 / 2
		end
		
		if args.state.tileNumber == 2
			puts args.state.tileNumber
		end
		
		if args.state.tileNumber == 1
			args.outputs.solids << [x, args.state.drawStart, x + 10, args.state.drawEnd - args.state.drawStart, 0, args.state.wallColor, 0]
		elsif args.state.tileNumber == 2
		end
		
		x += 10
	end
	
	args.state.rotSpeed = 0.5
	
	if args.inputs.up
		args.state.player.x += 5
		args.state.player.y += 5
	end
	
	if args.inputs.down
		args.state.player.x -= 5
		args.state.player.y -= 5
	end
	
	if args.inputs.right
		args.state.player.dx_old = args.state.player.dx
		args.state.player.dx = args.state.player.dy * Math.cos(-args.state.rotSpeed) - args.state.player.dy * Math.sin(-args.state.rotSpeed)
		args.state.player.dy = args.state.player.dx_old * Math.sin(-args.state.rotSpeed) - args.state.player.dy * Math.cos(-args.state.rotSpeed)
		args.state.plane.x_old = args.state.plane.x
		args.state.plane.x = args.state.plane.x * Math.cos(-args.state.rotSpeed) - args.state.plane.y * Math.sin(-args.state.rotSpeed)
		args.state.plane.y = args.state.plane.x_old * Math.sin(-args.state.rotSpeed) - args.state.plane.y * Math.cos(-args.state.rotSpeed)
	end
	if args.inputs.left
		args.state.player.dx_old = args.state.player.dx
		args.state.player.dx = args.state.player.dy * Math.cos(args.state.rotSpeed) - args.state.player.dy * Math.sin(args.state.rotSpeed)
		args.state.player.dy = args.state.player.dx_old * Math.sin(args.state.rotSpeed) - args.state.player.dy * Math.cos(args.state.rotSpeed)
		args.state.plane.x_old = args.state.plane.x
		args.state.plane.x = args.state.plane.x * Math.cos(args.state.rotSpeed) - args.state.plane.y * Math.sin(args.state.rotSpeed)
		args.state.plane.y = args.state.plane.x_old * Math.sin(args.state.rotSpeed) - args.state.plane.y * Math.cos(args.state.rotSpeed)
	end
	
	puts args.state.player.x
	puts args.state.player.y
end

def tick args
	setup args
	calc args
	args.outputs.labels << [600, 600, "framerate: #{args.gtk.current_framerate.round}", 255, 255, 255]
end
