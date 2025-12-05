local Settings = loadfile("config/settings.lua")()
local Logger = loadfile("utils/logger.lua")()

local BL = {}

function BL.Add(name)
    if not Settings.BLACKLIST then Settings.BLACKLIST = {} end
    if not table.find(Settings.BLACKLIST, name) then
        table.insert(Settings.BLACKLIST, name)
        Logger.Event("BlacklistAdd", name)
    end
end

function BL.Remove(name)
    if not Settings.BLACKLIST then return end
    for i, v in ipairs(Settings.BLACKLIST) do
        if v == name then
            table.remove(Settings.BLACKLIST, i)
            Logger.Event("BlacklistRemove", name)
            break
        end
    end
end

function BL.Search(query)
    local results = {}
    if not Settings.BLACKLIST then return results end
    for _, name in ipairs(Settings.BLACKLIST) do
        if string.lower(name):sub(1, #query) == string.lower(query) then
            table.insert(results, name)
        end
    end
    return results
end

return BL