local HttpService = game:GetService("HttpService")

local Updater = {}

Updater.Check = function(url)
    local ok, res = pcall(function()
        return game:HttpGet(url)
    end)
    if ok then
        return res
    else
        return nil
    end
end

return Updater
