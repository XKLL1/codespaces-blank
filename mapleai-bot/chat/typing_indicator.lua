local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Indicator = {}
local dot = 0
local gui = nil
local char = nil

function Indicator.Init()
    local p = Players.LocalPlayer
    if not p.Character then p.CharacterAdded:Wait() end
    char = p.Character

    gui = Instance.new("BillboardGui")
    gui.Size = UDim2.new(0,120,0,40)
    gui.StudsOffset = Vector3.new(0,3,0)
    gui.AlwaysOnTop = true
    gui.Enabled = false

    local label = Instance.new("TextLabel", gui)
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.Text = ""

    gui.Parent = char:WaitForChild("Head")

    RunService.RenderStepped:Connect(function()
        if gui.Enabled then
            dot = dot + 1
            if dot > 3 then dot = 1 end
            label.Text = "typing" .. string.rep(".", dot)
        end
    end)
end

function Indicator.Show()
    if gui then gui.Enabled = true end
end

function Indicator.Hide()
    if gui then gui.Enabled = false end
end

task.spawn(function()
    Indicator.Init()
end)

return Indicator
