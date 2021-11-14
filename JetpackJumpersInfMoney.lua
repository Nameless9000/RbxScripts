-- Credits for discovery: https://v3rmillion.net/member.php?action=profile&uid=541399

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = game:GetService("Players").LocalPlayer
local RootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local NewLaunchEvent = ReplicatedStorage["ProjectBlue_ClientNewLaunchEvent"]
local StopLaunchEvent = ReplicatedStorage["ProjectBlue_ClientStopLaunchEvent"]

local Collision = workspace.World.Lobby.Launcher.Collision

if getgenv().Autofarm then
    getgenv().Autofarm:Disconnect()
    getgenv().Autofarm = nil
    LocalPlayer:Kick()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
    return
end

local function GetMoney()
    RootPart.CFrame = CFrame.new(0, 9999999999, 0)

    NewLaunchEvent:FireServer(Collision)
    RunService.RenderStepped:Wait()
    StopLaunchEvent:FireServer()
end

getgenv().Autofarm = RunService.RenderStepped:Connect(GetMoney)
