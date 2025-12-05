local TweenService = game:GetService("TweenService")

local Animations = {}

local function t(o, p, d, s, r)
    local info = TweenInfo.new(d or 0.35, s or Enum.EasingStyle.Sine, r or Enum.EasingDirection.Out)
    local tw = TweenService:Create(o, info, p)
    tw:Play()
    return tw
end

Animations.FadeIn = function(gui, d)
    gui.Visible = true
    gui.BackgroundTransparency = 1
    t(gui, { BackgroundTransparency = 0 }, d or 0.4)
end

Animations.FadeOut = function(gui, d)
    t(gui, { BackgroundTransparency = 1 }, d or 0.4).Completed:Wait()
    gui.Visible = false
end

Animations.SlideIn = function(gui, offset)
    gui.Visible = true
    local o = gui.Position
    gui.Position = o + UDim2.new(0, offset or 50, 0, 0)
    t(gui, { Position = o }, 0.45)
end

Animations.SlideOut = function(gui, offset)
    local o = gui.Position
    t(gui, { Position = o + UDim2.new(0, offset or -50, 0, 0) }, 0.4)
    task.wait(0.4)
    gui.Visible = false
end

return Animations
