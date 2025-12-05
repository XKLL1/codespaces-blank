local RunService = game:GetService("RunService")

local Perf = {}
local fps = 60
local dt = 0

RunService.RenderStepped:Connect(function(delta)
    dt = delta
    fps = math.floor(1 / delta)
end)

function Perf.FPS()
    return fps
end

function Perf.Delta()
    return dt
end

return Perf
