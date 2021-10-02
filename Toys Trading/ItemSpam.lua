-- lol

local rs = game:GetService("ReplicatedStorage")
local m = require(rs.ModuleScripts.ItemConfig)
local lp = game.Players.LocalPlayer
for _,v in pairs(m.ITEM_LIST) do
    rs.Events.PickAndDrop.TakeToolRE:FireServer(v.Name)
    local x = workspace[lp.Name]:WaitForChild(v.Name)
    x.Parent = workspace
    wait()
    x.Parent=workspace.Dropped[lp.UserId]
end
