local Http = loadfile("utils/http.lua")()
local JSON = loadfile("utils/json.lua")()
local Logger = loadfile("utils/logger.lua", true)() -- if logger exists later
local Settings = loadfile("config/settings.lua")()
local Defaults = loadfile("config/defaults.lua")()

local Theme = loadfile("gui/theme.lua")()
local Animations = loadfile("gui/animations.lua")()
local AuthGUI = loadfile("gui/auth_gui.lua")()
local DashboardGUI -- loaded after auth

local AIManager = loadfile("ai/ai_manager.lua")()
local ChatListener = nil -- loaded after dash
local ChatResponder = nil
local BlacklistManager = nil
local EmoteManager = nil
local MovementManager = nil

print("[MapleAI Bot] Loading MapleAI Apple‑Pro System...")

local function startDashboard()
    DashboardGUI = loadfile("gui/dashboard_gui.lua")()

    ChatListener = loadfile("chat/chat_listener.lua")()
    ChatResponder = loadfile("chat/chat_responder.lua")()

    BlacklistManager = loadfile("player/blacklist.lua")()
    EmoteManager = loadfile("player/emotes.lua")()
    MovementManager = loadfile("player/movement.lua")()

    print("[MapleAI Bot] Dashboard Loaded.")
end

-- Authentication Flow
AuthGUI.OnAuthenticated = function(apiKey)
    print("[MapleAI Bot] Received API key. Saving...")
    Settings.API_KEY = apiKey
    
    -- Load Dashboard after fade transition
    task.spawn(function()
        task.wait(1.4)
        startDashboard()
    end)
end

-- Start Authentication GUI first
AuthGUI.Init()

print("[MapleAI Bot] System started successfully.")
