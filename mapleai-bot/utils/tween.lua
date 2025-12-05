local TweenService = game:GetService("TweenService")

local T = {}

T.Tween = function(o, d, p)
    local tw = TweenService:Create(o, TweenInfo.new(d or 0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), p)
    tw:Play()
    return tw
end

return T
