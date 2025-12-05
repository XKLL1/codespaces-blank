local Logger = {}

local function ts()
    return "[" .. os.date("%H:%M:%S") .. "]"
end

Logger.Info = function(m)
    print(ts() .. " [INFO] " .. tostring(m))
end

Logger.Warn = function(m)
    warn(ts() .. " [WARN] " .. tostring(m))
end

Logger.Error = function(m)
    warn(ts() .. " [ERROR] " .. tostring(m))
end

Logger.Event = function(e, d)
    print(ts() .. " [EVENT] " .. tostring(e) .. " | " .. tostring(d))
end

return Logger
