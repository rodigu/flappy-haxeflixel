local al = require('tappy.lib.asset_list')
local v = require('tappy.lib.vectic')
local player = require('tappy.src.player')

local has_setup = false

---@param g Game
local setup = function(g)
 player.setup(g)
end

---@param g Game
local update = function(g)
 if not has_setup then setup(g) end
 has_setup = true
 player.update(g)
end

---@param g Game
local draw = function(g)
 player.draw(g)
end

---@type GameState
local PlayState = { update = update, draw = draw, setup = setup }

return PlayState
