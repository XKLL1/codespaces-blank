local UserInputService = game:GetService("UserInputService")
local Sliders = {}

function Sliders.Create(parent, min, max, default, callback)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(0, 240, 0, 28)
    f.BackgroundColor3 = Color3.fromRGB(30,30,30)
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1, -20, 0, 6)
    bar.Position = UDim2.new(0,10,0.5,-3)
    bar.BackgroundColor3 = Color3.fromRGB(50,50,50)
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new((default-min)/(max-min),0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(120,120,255)
    local knob = Instance.new("Frame", fill)
    knob.Size = UDim2.new(0,14,0,14)
    knob.AnchorPoint = Vector2.new(0.5,0.5)
    knob.Position = UDim2.new(1,0,0.5,0)
    knob.BackgroundColor3 = Color3.fromRGB(255,255,255)

    local dragging = false

    knob.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = (game:GetService("UserInputService"):GetMouseLocation().X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
            rel = math.clamp(rel, 0, 1)
            fill.Size = UDim2.new(rel,0,1,0)
            local v = min + (max-min)*rel
            callback(math.floor(v))
        end
    end)

    return f
end

return Sliders
