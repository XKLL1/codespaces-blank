local Theme = loadfile("gui/theme.lua")()
local Anim = loadfile("gui/animations.lua")()
local Settings = loadfile("config/settings.lua")()

local Dashboard = {}

local ScreenGui
local Main
local Tabs
local ContentFrames = {}
local MinBtn

local function clearFrames()
    for _, f in pairs(ContentFrames) do
        f.Visible = false
    end
end

local function createTab(name)
    local b = Instance.new("TextButton", Tabs)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundTransparency = 1
    b.Font = Theme.Font
    b.Text = name
    b.TextColor3 = Theme.Colors.Text
    b.TextSize = 16
    return b
end

local function createPage(name)
    local f = Instance.new("Frame", Main)
    f.Size = UDim2.new(1, -120, 1, -20)
    f.Position = UDim2.new(0, 120, 0, 10)
    f.BackgroundTransparency = 1
    f.Visible = false
    ContentFrames[name] = f
    return f
end

local function createMinimizeButton()
    local btn = Instance.new("Frame", ScreenGui)
    btn.Size = UDim2.new(0, 90, 0, 26)
    btn.Position = UDim2.new(0.5, -45, 0, 10)
    btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
    local c = Instance.new("UICorner", btn)
    c.CornerRadius = Theme.Round
    local t = Instance.new("TextLabel", btn)
    t.Size = UDim2.new(1,0,1,0)
    t.BackgroundTransparency = 1
    t.Text = "Open Bot"
    t.Font = Theme.Font
    t.TextColor3 = Theme.Colors.Text
    t.TextSize = 14
    btn.Visible = false
    return btn
end

function Dashboard.Init()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false

    local bg = Instance.new("Frame", ScreenGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    local g = Instance.new("UIGradient", bg)
    g.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Colors.BackgroundTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.BackgroundBottom)
    })

    Main = Instance.new("Frame", bg)
    Main.Size = UDim2.new(0, 550, 0, 380)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.BackgroundColor3 = Color3.fromRGB(22,22,22)
    local c = Instance.new("UICorner", Main)
    c.CornerRadius = Theme.Round

    Tabs = Instance.new("Frame", Main)
    Tabs.Size = UDim2.new(0, 110, 1, 0)
    Tabs.BackgroundTransparency = 1

    local t1 = createTab("Blacklist")
    local t2 = createTab("System Instructions")
    local t3 = createTab("AI Settings")
    local t4 = createTab("Settings")

    t1.Position = UDim2.new(0,0,0,0)
    t2.Position = UDim2.new(0,0,0,40)
    t3.Position = UDim2.new(0,0,0,80)
    t4.Position = UDim2.new(0,0,0,120)

    local p1 = createPage("Blacklist")
    local p2 = createPage("System Instructions")
    local p3 = createPage("AI Settings")
    local p4 = createPage("Settings")

    t1.MouseButton1Click:Connect(function()
        clearFrames()
        p1.Visible = true
    end)
    t2.MouseButton1Click:Connect(function()
        clearFrames()
        p2.Visible = true
    end)
    t3.MouseButton1Click:Connect(function()
        clearFrames()
        p3.Visible = true
    end)
    t4.MouseButton1Click:Connect(function()
        clearFrames()
        p4.Visible = true
    end)

    p1.Visible = true

    MinBtn = createMinimizeButton()

    local minimize = Instance.new("TextButton", Main)
    minimize.Size = UDim2.new(0, 80, 0, 26)
    minimize.Position = UDim2.new(0.5, -40, 0, -34)
    minimize.Text = "Minimize"
    minimize.Font = Theme.Font
    minimize.TextSize = 14
    minimize.TextColor3 = Theme.Colors.Text
    minimize.BackgroundColor3 = Color3.fromRGB(20,20,20)
    local cm = Instance.new("UICorner", minimize)
    cm.CornerRadius = Theme.Round

    minimize.MouseButton1Click:Connect(function()
        Main.Visible = false
        MinBtn.Visible = true
        Anim.SlideIn(MinBtn, 40)
    end)

    MinBtn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            MinBtn.Visible = false
            Main.Visible = true
            Anim.SlideIn(Main, 50)
        end
    end)
end

task.spawn(Dashboard.Init)

return Dashboard