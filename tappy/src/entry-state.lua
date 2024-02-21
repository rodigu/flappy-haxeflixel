local al = require('tappy.lib.asset_list')
local v = require('tappy.lib.vectic')

local has_setup = false

local player = {
 position = v.new(10, 10),
 asset = al.plane0
}

---@param g Game
local setup = function(g)
 player.position.x = g.width * .5
 player.position.y = g.height * .5
end

---@param g Game
local update = function(g)
 if not has_setup then setup(g) end
 has_setup = true
end

---@param g Game
local draw = function(g)
 player.asset:draw(player.position.x, player.position.y)
end

---@type GameState
local PlayState = { update = update, draw = draw, setup = setup }

return PlayState
