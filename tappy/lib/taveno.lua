---@class tvn
local tvn = {}

---@class RunFun
---@field name string
---@field run fun(rf:RunFun)
---@field kill fun()
---@field duration number
---@field delay number


---@type table<string,RunFun>
tvn.runfuns = {}

function tvn.void() end

function tvn.has(name)
 return tvn.runfuns[name] ~= nil
end

---@param name string
function tvn.del(name)
 tvn.runfuns[name] = nil
end

---@type fun(run:fun()):fun(rf:RunFun)
local createRF = function(run)
 ---@type fun(rf:RunFun)
 return function(rf)
  if rf.delay > 0 then
   rf.delay = rf.delay - 1
   return
  end
  rf.duration = rf.duration - 1
  if rf.duration ~= 0 then
   run()
  else
   rf.kill()
  end
 end
end

---@param name string
---@param kill fun():fun()
local createKill = function(name, kill)
 return function()
  kill()
  tvn.del(name)
 end
end

---@param name string
---@param run fun()
---@param duration number
---@param kill? fun()
---@param delay? number
function tvn.add(name, run, duration, kill, delay)
 if tvn.has(name) then return end
 if kill == nil then kill = tvn.void end
 if delay == nil then delay = 0 end
 tvn.runfuns[name] = {
  name = name,
  duration = duration,
  ---@type fun(rf:RunFun)
  run = createRF(run),
  kill = createKill(name, kill),
  delay = delay,
 }
end

function tvn.run()
 for _, rf in pairs(tvn.runfuns) do
  rf:run()
 end
end

return tvn
