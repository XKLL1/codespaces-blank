-- ai/maple_request.lua
-- Handles all requests to MapleAI's API (executor friendly)

local HttpService = game:GetService("HttpService")

local MapleRequest = {}

function MapleRequest.Request(apiKey, model, prompt, system)
    local url = "https://api.mapleai.de/v1/chat/completions"

    local data = {
        model = model,
        messages = {
            { role = "system", content = system or "" },
            { role = "user", content = prompt }
        }
    }

    local encoded = HttpService:JSONEncode(data)

    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. tostring(apiKey)
    }

    local success, response = pcall(function()
        return game:HttpPost(url, encoded, Enum.HttpContentType.ApplicationJson, false, headers)
    end)

    if not success then
        warn("[MapleAI Bot] Request failed: " .. tostring(response))
        return nil
    end

    local decoded = nil
    pcall(function()
        decoded = HttpService:JSONDecode(response)
    end)

    if decoded and decoded.choices and decoded.choices[1] then
        return decoded.choices[1].message.content
    end

    return nil
end

return MapleRequest
