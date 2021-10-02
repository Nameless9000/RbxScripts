-- lol use on alt because u will get reported

local r = game:GetService("ReplicatedStorage").Events.Trade.TradeRE

for _,p in pairs(game:GetService("Workspace").TradePlates:GetChildren()) do
    coroutine.wrap(function(p,r)
        while true do
            r:FireServer("plate_join", p)
            wait(.05)
            r:FireServer("plate_event", p.CancelBtns.Cancel, p)
            wait(.05)
            r:FireServer("plate_event", p.AcceptBtns.Accept, p)
            wait(2)
        end
    end)(p,r)
end
