local TweenService = game:GetService("TweenService")

local Tabs = {}

function Tabs.Highlight(btn, frame)
    for _, b in ipairs(btn.Parent:GetChildren()) do
        if b:IsA("TextButton") then
            TweenService:Create(b, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
        end
    end
    TweenService:Create(btn, TweenInfo.new(0.25), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()

    for _, f in pairs(frame.Parent:GetChildren()) do
        if f:IsA("Frame") and f ~= frame then
            f.Visible = false
        end
    end

    frame.Visible = true
    frame.BackgroundTransparency = 1
    TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()
end

return Tabs
