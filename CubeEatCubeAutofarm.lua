-- Edit anything you want just leave credits lol

local uicfg = {
    ["HeaderWidth"] = 250,
    ["AccentColor"] = Color3.new(0.6,0,0)
}

local gui = loadstring(game:HttpGet("https://gitlab.com/0x45.xyz/droplib/-/raw/master/drop-minified.lua"))():Init(uicfg,game.CoreGui)

getgenv().Autofarm = false
getgenv().setPos = nil

-- Code

local x 
x = hookmetamethod(game, "__namecall", function(self, ...)
    local Args = {...}

    if not checkcaller() and self.Name == "Event" then
        Args[2] = getgenv().setPos or Args[2]
    end

    return x(self, unpack(Args))
end)

local lCube = workspace.CubesFolder[game.Players.LocalPlayer.Name]

local function getClosestFood()
    local closest, cf
    for  _,food in pairs(workspace.FoodsFolder:GetChildren()) do
        local distance = (lCube.Position - food.Position).Magnitude
  
        if not closest or distance < closest then closest=distance cf=food end
    end
    return cf
end

local function pathfindMove(part)
    local showpath = false
    local destination = part.Position
    local pathfindingService = game:GetService("PathfindingService")
    local path = pathfindingService:CreatePath()
    path:ComputeAsync(lCube.Position, destination)
    local waypoints = path:GetWaypoints()
    repeat wait(1) getgenv().setPos = part.Position path:ComputeAsync(lCube.Position, destination) until path.Status == Enum.PathStatus.Success
    local waypoints = path:GetWaypoints()
    for k, waypoint in pairs(waypoints) do
        if path.Status == Enum.PathStatus.Success then
            getgenv().setPos = waypoint.Position
        else
            repeat path:ComputeAsync(body.Position,destination) until path.Status == Enum.PathStatus.Success
        end
    end
end

coroutine.wrap(function()
    pcall(function()
        while true do
            if getgenv().Autofarm then
                local closest = getClosestFood()
                
                local rayOrigin = lCube.Position
                local rayDirection = closest.Position
                
                local raycastParams = RaycastParams.new()
                raycastParams.FilterDescendantsInstances = {closest.Parent, lCube.Parent}
                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                
                if raycastResult then
                    pathfindMove(closest)
                else
                    getgenv().setPos = closest.Position
                    repeat
                        wait(.1)
                    until (lCube.Position-closest.Position).Magnitude < 1
                end
            else
                getgenv().setPos = nil
            end
            wait(.1)
        end
    end)
end)()

-- UI

local main = gui:CreateCategory("Main")

-- Main

main:CreateSwitch("Autofarm", function(x)
    getgenv().setPos = nil
    getgenv().Autofarm = x
end)

main:CreateButton("[Destroy Gui]", function()
    gui:CleanUp()
end)

-- Credits

local credits = main:CreateSection("Credits")

credits:CreateTextLabel("Made by Nameless#6118")

credits:CreateButton("[Copy V3rm Link]", function()
    setclipboard("https://v3rmillion.net/member.php?action=profile&uid=901556")
end)

credits:Collapse()
