---@enum AssetTypes
local AssetTypes = {
 sound = 's',
 image = 'i',
 font = 'f'
}

---@alias DrawFun fun(s:Asset,x:number,y:number,r?:number)

---@class Asset
---@field name string
---@field path string
---@field type AssetTypes
---@field origin Vectic
---@field scale Vectic
---@field draw? DrawFun
---@field asset? love.graphics.Image|love.audio.Source

---@param lst table<string,Asset>
local loadAssets = function(lst)
 for _, asst in pairs(lst) do
  if asst.type == AssetTypes.image then
   asst.asset = love.graphics.newImage(asst.path)
  elseif asst.type == AssetTypes.sound then
   asst.asset = love.audio.newSource(asst.path, "static")
  end
 end
end

return { types = AssetTypes, load = loadAssets }
