local at = require('tappy.lib.assets')
local v = require('tappy.lib.vectic')

---@type table<string,Asset>
local AssetList = {
 plane0 = {
  name = 'plane0',
  path = 'assets/planeRed1.png',
  type = at.types.image,
  origin = v.new(0, 0),
  scale = v.new(1, 1),
  ---@type DrawFun
  draw = function(s, x, y, r)
   love.graphics.draw(s.asset, x, y, r, s.scale.x, s.scale.y, s.origin.x, s.origin.y)
  end
 },
 plane1 = {
  name = 'plane1',
  path = 'assets/planeRed2.png',
  type = at.types.image,
  origin = v.new(0, 0),
  scale = v.new(1, 1),
  ---@type DrawFun
  draw = function(s, x, y, r)
   love.graphics.draw(s.asset, x, y, r, s.scale.x, s.scale.y, s.origin.x, s.origin.y)
  end
 },
 plane2 = {
  name = 'plane2',
  path = 'assets/planeRed3.png',
  type = at.types.image,
  origin = v.new(0, 0),
  scale = v.new(1, 1),
  ---@type DrawFun
  draw = function(s, x, y, r)
   love.graphics.draw(s.asset, x, y, r, s.scale.x, s.scale.y, s.origin.x, s.origin.y)
  end
 },
 jump = {
  name = 'plane2',
  path = 'assets/BUBBLE_OPEN.wav',
  type = at.types.sound,
  origin = v.new(0, 0),
  scale = v.new(1, 1)
 }
}

return AssetList
