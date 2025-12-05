local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")

local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local Listener = {}

Listener.OnMessage = function() end

local function inRange(player, bot)
    if not Settings.CHAT_RANGE then
        return true
    end
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    if not bot.Character or not bot.Character:FindFirstChild("HumanoidRootPart") then
        return false
    end
    local dist = (player.Character.HumanoidRootPart.Position - bot.Character.HumanoidRootPart.Position).Magnitude
    return dist <= Settings.CHAT_RANGE
end

local bot = Players.LocalPlayer

ChatService.Chat:Connect(function(msg, recipient, speaker)
    if not speaker then return end
    if speaker == bot.Name then return end

    if Settings.BLACKLIST and table.find(Settings.BLACKLIST, speaker) then
        Logger.Event("BlacklistBlocked", speaker)
        return
    end

    local plr = Players:FindFirstChild(speaker)
    if not plr then return end

    if not inRange(plr, bot) then
        return
    end

    Logger.Event("PlayerMessage", speaker .. ": " .. msg)
    Listener.OnMessage(speaker, msg)
end)

return Listener
