local ChatService = game:GetService("Chat")
local Players = game:GetService("Players")

local AIManager = loadfile("ai/ai_manager.lua")()
local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local Responder = {}

function Responder.Send(message)
    local bot = Players.LocalPlayer
    Logger.Event("BotReply", message)
    ChatService:Chat(bot.Character.Head, message, Enum.ChatColor.White)
end

function Responder.Process(player, msg)
    if not Settings.AI_ENABLED then return end
    if not AIManager.CanSpeak() then
        Logger.Warn("Cooldown active")
        return
    end

    local response = AIManager.GetResponse(msg)
    if response then
        Responder.Send(response)
    else
        Logger.Warn("AI response nil")
    end
end

return Responder
