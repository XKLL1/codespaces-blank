local Players = game:GetService("Players")

local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local E = {}
local bot = Players.LocalPlayer

local emotes = {
    wave = "rbxassetid://507770239",
    point = "rbxassetid://507770453",
    dance = "rbxassetid://507771019",
    dance2 = "rbxassetid://507771955",
    dance3 = "rbxassetid://507772104"
}

function E.PlayRandom()
    local char = bot.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if not h then return end

    local keys = {}
    for k in pairs(emotes) do table.insert(keys, k) end
    local pick = keys[math.random(#keys)]

    local anim = Instance.new("Animation")
    anim.AnimationId = emotes[pick]
    local track = h:LoadAnimation(anim)
    track:Play()
end

return E
