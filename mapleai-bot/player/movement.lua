local Players = game:GetService("Players")

local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local M = {}
local bot = Players.LocalPlayer

function M.Face(target)
    local c1 = bot.Character
    local c2 = target.Character
    if not c1 or not c2 then return end
    local h = c1:FindFirstChild("HumanoidRootPart")
    local th = c2:FindFirstChild("HumanoidRootPart")
    if not h or not th then return end
    h.CFrame = h.CFrame:Lerp(CFrame.lookAt(h.Position, th.Position),0.14)
end

function M.WalkTo(target)
    if not Settings.SHOULD_WALK_TO_PLAYER then return end
    local c1 = bot.Character
    local c2 = target.Character
    if not c1 or not c2 then return end
    local h = c1:FindFirstChildOfClass("Humanoid")
    local th = c2:FindFirstChild("HumanoidRootPart")
    if not h or not th then return end
    h:MoveTo(th.Position)
end

return M
