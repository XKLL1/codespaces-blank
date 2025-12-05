local Theme = loadfile("gui/theme.lua")()
local Anim = loadfile("gui/animations.lua")()
local TabsLib = loadfile("gui/tab_transitions.lua")()
local Settings = loadfile("config/settings.lua")()

local D = {}

local SG
local Main
local Tabs
local Pages = {}
local MinBtn

local function NewPage(name)
    local f = Instance.new("Frame", Main)
    f.Size = UDim2.new(1, -110, 1, -20)
    f.Position = UDim2.new(0, 110, 0, 10)
    f.BackgroundTransparency = 1
    f.Visible = false
    Pages[name] = f
    return f
end

local function NewTab(name, page)
    local b = Instance.new("TextButton", Tabs)
    b.Size = UDim2.new(1,0,0,40)
    b.BackgroundTransparency = 1
    b.Font = Theme.Font
    b.TextSize = 16
    b.TextColor3 = Theme.Colors.Text
    b.Text = name
    b.MouseButton1Click:Connect(function()
        TabsLib.Highlight(b, Pages[page])
    end)
end

local function NewMinButton()
    local btn = Instance.new("Frame", SG)
    btn.Size = UDim2.new(0,90,0,26)
    btn.Position = UDim2.new(0.5,-45,0,10)
    btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    local c = Instance.new("UICorner", btn)
    c.CornerRadius = Theme.Round
    local t = Instance.new("TextLabel", btn)
    t.Size = UDim2.new(1,0,1,0)
    t.BackgroundTransparency = 1
    t.Text = "Open Bot"
    t.Font = Theme.Font
    t.TextSize = 14
    t.TextColor3 = Theme.Colors.Text
    btn.Visible = false
    return btn
end

function D.Init()
    SG = Instance.new("ScreenGui")
    SG.Parent = game.CoreGui
    SG.IgnoreGuiInset = true
    SG.ResetOnSpawn = false

    local bg = Instance.new("Frame", SG)
    bg.Size = UDim2.new(1,0,1,0)
    local g = Instance.new("UIGradient", bg)
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Colors.BackgroundTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.BackgroundBottom)
    })

    Main = Instance.new("Frame", bg)
    Main.Size = UDim2.new(0,550,0,380)
    Main.AnchorPoint = Vector2.new(0.5,0.5)
    Main.Position = UDim2.new(0.5,0,0.5,0)
    Main.BackgroundColor3 = Color3.fromRGB(22,22,22)
    local c = Instance.new("UICorner", Main)
    c.CornerRadius = Theme.Round

    Tabs = Instance.new("Frame", Main)
    Tabs.Size = UDim2.new(0,110,1,0)
    Tabs.BackgroundTransparency = 1

    NewTab("Blacklist","Blacklist").Position = UDim2.new(0,0,0,0)
    NewTab("System Instructions","System Instructions").Position = UDim2.new(0,0,0,40)
    NewTab("AI Settings","AI Settings").Position = UDim2.new(0,0,0,80)
    NewTab("Settings","Settings").Position = UDim2.new(0,0,0,120)

    local P1 = NewPage("Blacklist")
    local P2 = NewPage("System Instructions")
    local P3 = NewPage("AI Settings")
    local P4 = NewPage("Settings")

    P1.Visible = true

    MinBtn = NewMinButton()

    local mini = Instance.new("TextButton", Main)
    mini.Size = UDim2.new(0,80,0,26)
    mini.Position = UDim2.new(0.5,-40,0,-34)
    mini.Text = "Minimize"
    mini.Font = Theme.Font
    mini.TextSize = 14
    mini.TextColor3 = Theme.Colors.Text
    mini.BackgroundColor3 = Color3.fromRGB(20,20,20)
    local cm = Instance.new("UICorner", mini)
    cm.CornerRadius = Theme.Round

    mini.MouseButton1Click:Connect(function()
        Main.Visible = false
        MinBtn.Visible = true
    end)

    MinBtn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            MinBtn.Visible = false
            Main.Visible = true
        end
    end)
end

task.spawn(D.Init)

return D
