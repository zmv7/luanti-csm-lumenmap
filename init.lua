local nums = {
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAEAAAAFCAYAAACEhIafAAAAAXNSR0IArs4c6QAAABhJREFUGFdj+Pf//3+G///+/WdAsP4DxQD4xxPn/st9SwAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACVJREFUGFdVirENAAAIg8r/P4sx0cFOBIpqdhxoSalnmBtAQl5puJQT9jhrf30AAAAASUVORK5CYIIA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACdJREFUGFdVybENADAQwkC8/87vCLrQGOlQzWZYSTxlUsNQ6tf75QEpNBnuExbGbAAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAAChJREFUGFclyMENACAMw0Cb/WeuEfQT6+JUR63a+ZgFAYICCU0v+z5cTqEd8SvZOG0AAAAASUVORK5CYIIA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAAChJREFUGFcti8ENACAQg8D9ZxZzal8QUndlgGEjSwm8hTcHxtr1yv8cce0Z9M90kkkAAAAASUVORK5CYIIA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACZJREFUGFcli0EOACAAgqT/vzla6gWZk6uShS8H6qjGtgkw9tMleVrtGvWd6vjGAAAAAElFTkSuQmCC",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACRJREFUGFdtirENAAAIwuD/n63BMNqlKcEAOpAdWWKIujNf9La9cxXvsnEbjwAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACdJREFUGFddi7ENADAMg0z+v9lUjTqVFUA1JiGh6gzYyprFz9yM9xwaJh7vIZYXDQAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAAChJREFUGFdFirENACAMgMD/by6mLrIRcCoDBFs52kz+Egrs9Y5XWOIC7TQc75PaMNoAAAAASUVORK5CYIIA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAADxJREFUGFc9ykEKAwEMw0Ar+f+TYy3dlp4Eg2jr7tI7Q6IErcPSt8P1/OHQKgte/R4z9HQ+2D/uewQTkweeFTfoqm8NegAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAAXNSR0IArs4c6QAAACVJREFUGFdNi0EKADAMg3D/f3McZJTuJCKiygGjVOBxS/4y0ideEqQn7yc4wwUAAAAASUVORK5CYIIA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAADtJREFUGFctjMERAEEIwoz2X/KSG53jBwEwykCegqUUGruHOllvYdRpOIOHSHT+eU+zbfazN0ysorb7AUo7LvJOxXZvAAAAAElFTkSuQmCC",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAADxJREFUGFcli8ERA0EMg4Tdf8krbpw8hQBbZ5b2GZJIaHV2SAyS10rVHbiR5CdzObvEP6hnVneH9+rBez6W8Svu0S9gAQAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAADlJREFUGFctisENADEMwgrZf+TgE+3xQbasBGwLgiyVL1jWJsz0QbkwyoYjTvekRxVV2Zb88kUnLB9oVTPs+V/wxwAAAABJRU5ErkJgggAA",
	"[png:iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAAXNSR0IArs4c6QAAADtJREFUGFclyoEJADEMw0Ar2X/kt0r7IDCYw1Z2aGskuVlloOrMgIZWZ8GvBqJP1tnFJPe56Mld3iZ/B0xIMfDfPHbUAAAAAElFTkSuQmCC"
}

local enabled = false
local radius, tick, timeofday, min, max, size

local function lumenmap()
	if enabled then
		local ppos = vector.round(core.camera:get_pos())
		for x = ppos.x-radius, ppos.x+radius do
			for y = ppos.y-radius, ppos.y+radius do
				for z = ppos.z-radius, ppos.z+radius do
					local pos = {x=x,y=y,z=z}
					local dist = vector.distance(ppos,pos)
					if dist <= radius then
						local light = core.get_node_light(pos, timeofday) or 0
						if light >= min and light <= max then
							core.add_particle({
								pos = pos,
								velocity = {x=0, y=0, z=0},
								acceleration = {x=0, y=0, z=0},
								expirationtime = tick,
								size = size,
								collisiondetection = false,
								collision_removal = false,
								vertical = false,
								texture = nums[light].."^[opacity:"..17*light,
								glow = light/2
							})
						end
					end
				end
			end
		end
		core.after(tick,lumenmap)
	end
end

core.register_chatcommand("lmap",{
	description = "Toggle lumenmap",
	params = "[-td <timeofday>] [-r <radius>] [-t <tick period>] [-min <minlevel>] [-max <maxlevel>] [-s <size>]",
	func = function(param)
		if param:match("help") then
			core.chatcommands.help.func("lmap")
			return false
		end
		local params = {}
		for k, v in param:gmatch("%-(%S+) +(%S+)") do
			params[k] = v
		end
		radius = tonumber(params.r) or 10
		tick = tonumber(params.t) or 1
		timeofday = tonumber(params.td) or nil
		min = tonumber(params.min) and math.min(math.max(tonumber(params.min),1),15) or 1
		max = tonumber(params.max) and math.min(math.max(tonumber(params.max),1),15) or 15
		size = tonumber(params.s) or 1
		if enabled and next(params) then
			enabled = false
			core.after(tick+0.1, function()
				enabled = true
				lumenmap()
			end)
			return true, "Lumenmap params have been updated"
		else
			enabled = not enabled
			lumenmap()
		end
		return true, "Lumenmap has been "..(enabled and "enabled" or "disabled")
end})
