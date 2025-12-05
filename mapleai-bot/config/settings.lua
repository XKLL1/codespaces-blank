-- config/settings.lua

local defaults = loadfile("config/defaults.lua")()

local Settings = {}

-- Loads defaults initially
for k, v in pairs(defaults) do
    Settings[k] = v
end

print("[MapleAI Bot] Settings initialized.")

return Settings
