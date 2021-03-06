local class = require "game.modules.class"

local M = class:extend()

local function acquire (url)
	url = url or "."
	msg.post(url, "acquire_input_focus")
end

local function release (url)
	url = url or "."
	msg.post(url, "release_input_focus")
end

function M:init()
	self.action_map = {}
end

function M:on_input (action_id, action)
	if action.pressed then
		self.action_map [action_id] = true
	elseif action.released then
		self.action_map [action_id] = false
	end
end

return M