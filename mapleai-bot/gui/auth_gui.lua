local Theme = loadfile("gui/theme.lua")()
local Anim = loadfile("gui/animations.lua")()

local AuthGUI = {}

local ScreenGui
local Frame
local InputBox
local ConfirmButton

AuthGUI.OnAuthenticated = function(apiKey) end

function AuthGUI.Init()
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = game.CoreGui

    local bg = Instance.new("Frame", ScreenGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.new(0,0,0)

    local grad = Instance.new("UIGradient", bg)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Theme.Colors.BackgroundTop),
        ColorSequenceKeypoint.new(1, Theme.Colors.BackgroundBottom)
    })

    Frame = Instance.new("Frame", bg)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Frame.Size = UDim2.new(0, 320, 0, 200)
    Frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    local c = Instance.new("UICorner", Frame)
    c.CornerRadius = Theme.Round

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 36)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Font = Theme.Font
    Title.Text = "MapleAI Authentication"
    Title.TextColor3 = Theme.Colors.Text
    Title.TextSize = 18

    InputBox = Instance.new("TextBox", Frame)
    InputBox.Size = UDim2.new(0.8, 0, 0, 40)
    InputBox.Position = UDim2.new(0.5, 0, 0.45, 0)
    InputBox.AnchorPoint = Vector2.new(0.5, 0.5)
    InputBox.BackgroundColor3 = Color3.fromRGB(15,15,15)
    InputBox.ClearTextOnFocus = false
    InputBox.PlaceholderText = "Enter Your MapleAI API Key"
    InputBox.Text = ""
    InputBox.Font = Theme.Font
    InputBox.TextColor3 = Theme.Colors.Text
    InputBox.TextSize = 16
    local c2 = Instance.new("UICorner", InputBox)
    c2.CornerRadius = Theme.Round

    ConfirmButton = Instance.new("TextButton", Frame)
    ConfirmButton.Size = UDim2.new(0.8, 0, 0, 38)
    ConfirmButton.Position = UDim2.new(0.5, 0, 0.8, 0)
    ConfirmButton.AnchorPoint = Vector2.new(0.5, 0.5)
    ConfirmButton.BackgroundColor3 = Theme.Colors.Accent
    ConfirmButton.Font = Theme.Font
    ConfirmButton.TextColor3 = Color3.new(1,1,1)
    ConfirmButton.TextSize = 16
    ConfirmButton.Text = "Authenticate"
    local c3 = Instance.new("UICorner", ConfirmButton)
    c3.CornerRadius = Theme.Round

    ConfirmButton.MouseButton1Click:Connect(function()
        local key = InputBox.Text
        if key and #key > 5 then
            Anim.FadeOut(Frame, 0.4)
            task.wait(0.4)
            ScreenGui:Destroy()
            AuthGUI.OnAuthenticated(key)
        else
            ConfirmButton.BackgroundColor3 = Theme.Colors.Error
            task.wait(0.15)
            ConfirmButton.BackgroundColor3 = Theme.Colors.Accent
        end
    end)
end

return AuthGUI
