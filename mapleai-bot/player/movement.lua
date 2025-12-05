local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local Move = {}
local bot = Players.LocalPlayer

function Move.Face(target)
    if not Settings.SHOULD_FACE_PLAYER then return end
    if not bot.Character or not target.Character then return end
    local h = bot.Character:FindFirstChild("HumanoidRootPart")
    local th = target.Character:FindFirstChild("HumanoidRootPart")
    if not h or not th then return end
    local look = CFrame.lookAt(h.Position, th.Position)
    h.CFrame = h.CFrame:Lerp(look, 0.15)
end

function Move.WalkTo(target)
    if not Settings.SHOULD_WALK_TO_PLAYER then return end
    if not bot.Character or not target.Character then return end
    local h = bot.Character:FindFirstChild("Humanoid")
    local th = target.Character:FindFirstChild("HumanoidRootPart")
    if not h or not th then return end
    h:MoveTo(th.Position)
end

return Move