-- ai/ai_manager.lua
-- MapleAI response manager & cooldown

local Settings = loadfile("config/settings.lua")()
local MapleRequest = loadfile("ai/maple_request.lua")()

local AIManager = {}

local lastResponse = 0

function AIManager.CanSpeak()
    return (os.clock() - lastResponse) >= (Settings.COOLDOWN or 2)
end

function AIManager.GetResponse(prompt)
    if not Settings.AI_ENABLED then
        return nil
    end

    if not AIManager.CanSpeak() then
        return nil
    end

    lastResponse = os.clock()

    local response = MapleRequest.Request(
        Settings.API_KEY,
        Settings.MODEL,
        prompt,
        Settings.SYSTEM_INSTRUCTIONS
    )

    return response
end

return AIManager
