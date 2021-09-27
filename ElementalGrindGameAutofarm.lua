if game.PlaceId ~= 4375458071 then return game:Shutdown() end -- https://www.roblox.com/games/4375458071/Elemental-Grind-Game

_G.AutoFarm = true

part = Instance.new("Part", workspace)
part.Name = "part"
part.Material = "SmoothPlastic"
part.CFrame = CFrame.new(0, 999998, 0)
part.BrickColor = BrickColor.new(315)
part.Transparency = 1
part.CanCollide = true
part.Anchored = true
part.Size = Vector3.new(math.huge, 1, math.huge)

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 999999, 0)

local id = game.Players.LocalPlayer.UserId
local idclientf = game:GetService("ReplicatedStorage")[id.."Client"]

local StartMove = idclientf.StartMove
local EndMove = idclientf.EndMove

while _G.AutoFarm do
   for _,skill in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
       StartMove:FireServer(skill.Name);
       EndMove:FireServer(skill.Name);
   end
   wait(.5)
end  
