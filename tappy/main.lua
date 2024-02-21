local Asset = require('tappy.lib.assets')
local AssetList = require('tappy.lib.asset_list')
local State = require('tappy.src.entry-state')
local game = { state = State, width = 400, height = 800 }


function love.load()
 Asset.load(AssetList)
 love.window.setMode(game.width, game.height, { fullscreen = false })
end

function love.update()
 game.state.update(game)
end

function love.draw()
 game.state.draw(game)
end
