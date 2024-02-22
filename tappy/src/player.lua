local al = require('tappy.lib.asset_list')
local v = require('tappy.lib.vectic')

local p = {
 position = v.new(),
 animation = { al.plane0, al.plane1, al.plane2, al.plane1 },
 accel = v.new(),
 vel = v.new(),
 r_accel = 0,
 r_vel = 0,
 r = 0,
 size = v.new()
}

local frame_switch = 0
local frame_time = 3
local anim_idx = 0

local function update_animation()
 if frame_switch == frame_time then
  frame_switch = 0
  anim_idx = ((anim_idx + 1) % (#p.animation))
 end
 frame_switch = frame_switch + 1
end

local function input()
 p.vel.y = -15
 p.accel.y = 1
 p.r_vel = math.pi * .01
 p.r = -math.pi * .25
 if al.jump.asset:isPlaying() then
  al.jump.asset:stop()
 end
 al.jump.asset:play()
end

---@type GameFun
local function kinematics(g)
 p.vel = p.vel + p.accel
 p.position = p.position + p.vel
 p.r = p.r + p.r_vel
 p.r_vel = p.r_vel + p.r_accel
 p.size.x = p.animation[1].asset:getWidth()
 p.size.y = p.animation[1].asset:getHeight()
 p.position:limit_constraint(0, g.width, 0, g.height)
end

function p.center()
 return p.position + v.new(p.size.x, p.size.y) * .5
end

---@type GameFun
function p.setup(g)
 p.position.x = g.width * .3
 p.position.y = g.height * .5
 for _, sp in pairs(p.animation) do
  sp.scale = v.new(.7, .7)
 end
end

---@type GameFun
function p.draw(g)
 p.animation[anim_idx + 1]:draw(p.position.x, p.position.y, p.r)
end

---@type GameFun
function p.update(g)
 update_animation()
 kinematics(g)
 if g.keys_pressed['j'] ~= nil then
  input()
 end
end

return p
