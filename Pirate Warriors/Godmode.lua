local Char = game.Players.LocalPlayer.Character
local Args = {"DmgCentral","calculateDmg",nil,Char,"Combat","Melee",-math.huge}
game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(Args))
