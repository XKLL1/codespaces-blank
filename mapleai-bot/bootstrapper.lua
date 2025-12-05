local base = "https://raw.githubusercontent.com/XKLL1/codespaces-blank/refs/heads/main/mapleai-bot/"

local files1 = {
    "main.lua",
    "config/defaults.lua",
    "config/settings.lua",
    "utils/json.lua",
    "utils/http.lua",
    "utils/logger.lua",
    "utils/tween.lua",
    "utils/performance.lua",
    "utils/updater.lua"
}

local files2 = {
    "gui/theme.lua",
    "gui/animations.lua",
    "gui/auth_gui.lua",
    "gui/dashboard_gui.lua",
    "gui/tab_transitions.lua",
    "gui/blur.lua",
    "gui/sliders.lua"
}

local files3 = {
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

local function fetch(list)
    for _, p in ipairs(list) do
        local ok, res = pcall(function()
            return game:HttpGet(base .. p)
        end)
        if ok then
            storage[p] = res
        end
    end
end

fetch(files1)
fetch(files2)
fetch(files3)

local function vload(path)
    local src = storage[path]
    if not src then return end
    local fn = loadstring(src)
    if not fn then return end
    local ok, result = pcall(fn)
    if not ok then return end
    return result
end

getgenv().loadfile = vload

vload("main.lua")