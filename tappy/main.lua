local Asset = require('tappy.lib.assets')
local AssetList = require('tappy.lib.asset_list')
local State = require('tappy.src.entry-state')
local v = require('tappy.lib.vectic')
local game = { state = State, width = 400, height = 750, keys_pressed = {}, touches = {} }

function love.keypressed(k)
 game.keys_pressed[k] = true
end

function love.keyreleased(k)
 game.keys_pressed[k] = nil
end

function love.touchpressed(id, x, y, dx, dy, pressure)
 game.touches[id] = v.new(x, y)
end

function love.load()
 Asset.load(AssetList)
 love.window.setMode(game.width, game.height, { fullscreen = false })
end

function love.update()
 game.state.update(game)
end

function love.draw()
 game.state.draw(game)
 game.keys_pressed = {}
end
