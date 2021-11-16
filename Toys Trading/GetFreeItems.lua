-- THIS DOES NOT LET U SELL THEM | backspace to drop item

getgenv().freeitem = true

local rs = game:GetService("ReplicatedStorage")
local r = rs.Events.Coin.CoinMarketRE
local m = require(rs.ModuleScripts.ItemConfig)
local old = nil

old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and getgenv().freeitem == true and self == r and method == "FireServer" and args[1] == "purchase" then
        rs.Events.PickAndDrop.TakeToolRE:FireServer(args[2])
        return nil
    end

    return old(self, ...)
end)
