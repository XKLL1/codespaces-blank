-- utils/json.lua
-- Safe JSON decode wrapper

local HttpService = game:GetService("HttpService")

local JSON = {}

function JSON.Decode(data)
    local success, result = pcall(function()
        return HttpService:JSONDecode(data)
    end)

    if not success then
        warn("[MapleAI Bot] JSON Decode Error: " .. tostring(result))
        return nil
    end

    return result
end

return JSON
