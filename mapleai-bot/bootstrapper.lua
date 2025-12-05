local base = "https://raw.githubusercontent.com/XKLL1/codespaces-blank/refs/heads/main/mapleai-bot/"

local files = {
    "main.lua",
    "config/defaults.lua",
    "config/settings.lua",
    "utils/json.lua",
    "utils/http.lua",
    "utils/logger.lua",
    "utils/tween.lua",
    "utils/performance.lua",
    "utils/updater.lua",
    "gui/theme.lua",
    "gui/animations.lua",
    "gui/auth_gui.lua",
    "gui/dashboard_gui.lua",
    "gui/tab_transitions.lua",
    "gui/blur.lua",
    "gui/sliders.lua",
    "ai/maple_request.lua",
    "ai/ai_manager.lua",
    "ai/personality.lua",
    "player/movement.lua",
    "player/emotes.lua",
    "player/blacklist.lua",
    "chat/chat_listener.lua",
    "chat/chat_responder.lua",
    "chat/typing_indicator.lua"
}

local storage = {}

for _, path in ipairs(files) do
    local url = base .. path
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok then
        storage[path] = res
    else
        warn("Failed to load file:", path, url)
    end
end

local function vload(path)
    if storage[path] then
        return loadstring(storage[path])()
    end
    warn("Missing virtual file:", path)
end

getgenv().loadfile = vload

vload("main.lua")