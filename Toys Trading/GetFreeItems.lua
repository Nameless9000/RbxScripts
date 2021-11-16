-- THIS DOES NOT LET U SELL THEM | backspace to drop item

local itemTypes = {
	NORMAL = 1, 
	GOLDEN = 2, 
	RAINBOW = 3, 
	COLORED = 4
}

getgenv().freeItem = true
getgenv().itemType = itemTypes.RAINBOW

if getgenv().ran then return end
getgenv().ran = true

local rs = game:GetService("ReplicatedStorage")
local r = rs.Events.Coin.CoinMarketRE
local old = nil

old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if not checkcaller() and getgenv().freeItem == true and self == r and method == "FireServer" and args[1] == "purchase" then
        x = tostring(args[2])
        x = x:gsub(x:sub(1,1),getgenv().itemType,1)
        rs.Events.PickAndDrop.TakeToolRE:FireServer(tonumber(x))
        return nil
    end

    return old(self, ...)
end)
