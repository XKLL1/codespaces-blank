local Players = game:GetService("Players")

local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local Emote = {}
local bot = Players.LocalPlayer

local acts = {
    "wave",
    "laugh",
    "point",
    "dance",
    "dance2",
    "dance3"
}

function Emote.PlayRandom()
    if not bot.Character then return end
    local h = bot.Character:FindFirstChildOfClass("Humanoid")
    if not h then return end
    h:LoadAnimation(Instance.new("Animation", script)).AnimationId = "rbxassetid://507770818"
end

return Emote