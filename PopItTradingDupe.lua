local loaded

local load = function(autoexec)
    loaded = true
    if autoexec then
        repeat wait() until game:IsLoaded()
        wait(2)
    end
    
    autodupe()
end

repeat wait(1) until loaded end

shared.item = shared.item or "Gummy Rainbow" -- change to item u want to duper

shared.timing = shared.timing or 0.085 -- change to 0.05 - 0.3 depending on wifi speed

if game.PlaceId == 7346416636 then
    if not game.Players:FindFirstChild(shared.altName or "*") and #game.Players:GetChildren() > 7 then
        game:Shutdown()
    end

    for _,m in pairs(workspace:GetChildren()) do 
        if m:IsA("Model") and m:FindFirstChild("HumanoidRootPart") then
            if m == game.Players.LocalPlayer.Character then continue end
            m:Destroy()
        end
    end



    game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
end)

    local TeleportService = game:GetService("TeleportService")
    local lplr = game.Players.LocalPlayer

local function dupe()
    wait(0.2)
    game:GetService("ReplicatedStorage").RemoteEvents.Jumped:FireServer()
    if shared.timing then wait(shared.timing) end
    game.Players.LocalPlayer:Kick("DUPED")
end


   local function getBoard(plr)
        for i,v in pairs(game:GetService("Workspace").Boards:GetChildren()) do
            local plr1 = v.Player1.Value
            local plr2 = v.Player2.Value
            if plr then
                if plr1 == plr or plr2 == plr then
                    return v
                end
            else
                if plr1 == lplr or plr2 == lplr then
                    return v
                end
            end
        end
    end

   local function getEmptyBoard()
        for i,v in pairs(game:GetService("Workspace").Boards:GetChildren()) do
            local plr1 = v.Player1.Value
            local plr2 = v.Player2.Value
            if plr then
                if plr1 == nil or plr2 == nil then
                    lplr.Character:MoveTo(v.PrimaryPart.Position)
                end
            else
                if plr1 == nil or plr2 == nil then
                    lplr.Character:MoveTo(v.PrimaryPart.Position)
                end
            end
        end
    end

   local function autodrop(b)
        for i = 1,b do
            game:GetService("ReplicatedStorage").RemoteEvents.Drop:FireServer(shared.item)
            wait(0.5)
            game:GetService("ReplicatedStorage").RemoteEvents.Equip:FireServer(shared.item)
            wait(0.5)
            game:GetService("ReplicatedStorage").RemoteEvents.Drop:FireServer(shared.item)
        end
    end

   local function autodupe()
        getEmptyBoard()
        wait(2)
        local brd = getBoard()
        local x = brd:WaitForChild("Controls").Close.Pad
        wait()
        lplr.Character:MoveTo(x.Position)
        autodrop(15)
        wait(0.2)
        lplr.Character:MoveTo(x.Position)
        wait(0.05)
        dupe()
    end
    ()

    if success then
        warn("No errors")
    end
end

return load
