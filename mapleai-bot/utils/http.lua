-- utils/http.lua
-- Basic HTTP wrapper for executor compatibility

local Http = {}

function Http.GET(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)

    if not success then
        warn("[MapleAI Bot] HTTP GET Failed: " .. tostring(result))
        return nil
    end

    return result
end

return Http
