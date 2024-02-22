---@class GameState
---@field update fun(game:Game)
---@field setup fun(game:Game)
---@field draw fun(game:Game)

---@class Touch
---@field position Vectic

---@class Game
---@field state GameState
---@field width number
---@field height number
---@field keys_pressed table<string,boolean>
---@field touches table<string,Touch>

---@alias GameFun fun(g:Game)
