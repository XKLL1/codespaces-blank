local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")

local Blur = {}

local b = Instance.new("BlurEffect", Lighting)
b.Size = 0

function Blur.On()
    TweenService:Create(b, TweenInfo.new(0.4), {Size = 12}):Play()
end

function Blur.Off()
    TweenService:Create(b, TweenInfo.new(0.4), {Size = 0}):Play()
end

return Blur
