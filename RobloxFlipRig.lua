-- by Nameless#6118

if getgenv().rig then getgenv().rig:Disconnect() getgenv().rig = nil end

local roulette_info = game:GetService("ReplicatedStorage").Events["roulette_info"]
local roulette_request = game:GetService("ReplicatedStorage").Events.roulette_request

local Cash = game:GetService("Players")["LocalPlayer"].Cash

local function riggedLOL(spin, color)
    if spin ~= "Spin" then return end
    
    roulette_request:InvokeServer("Betting", Cash.Value, color)
end

getgenv().rig = roulette_info.OnClientEvent:Connect(riggedLOL)
