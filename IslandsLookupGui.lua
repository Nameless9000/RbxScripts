local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Body = Instance.new("Frame")
local PlayerList = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local InfoScreen = Instance.new("Frame")
local PlayerImage_2 = Instance.new("ImageLabel")
local DisplayName = Instance.new("TextLabel")
local Data = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Refresh = Instance.new("TextButton")
local JoinIsland = Instance.new("TextButton")
local UIPageLayout = Instance.new("UIPageLayout")
local Footer = Instance.new("Frame")
local Header = Instance.new("Frame")
local Minify = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

--------------------------
local dragger = {}

local function Roundify(instance, scale)
	local UICorner = Instance.new("UICorner")
	
	UICorner.Name = math.random(tick()%math.random(tick()))
	UICorner.Parent = instance
	UICorner.CornerRadius = UDim.new(scale, 0)
end

local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local inputService = game:GetService('UserInputService')
local heartbeat	= game:GetService("RunService").Heartbeat

-- // credits to Ririchi / Inori for this drag function (100% skidded)
function dragger.new(frame)
	local s, event = pcall(function()
		return frame.MouseEnter
	end)

	if s then
		frame.Active = true

		event:connect(function()
			local input = frame.InputBegan:connect(function(key)
				if key.UserInputType == Enum.UserInputType.MouseButton1 then
					local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y)
					while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						pcall(function()
							frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X, 0, mouse.Y - objectPosition.Y), 'Out', 'Linear', 0.1, true)
						end)
					end
				end
			end)

			local leave
			leave = frame.MouseLeave:connect(function()
				input:disconnect()
				leave:disconnect()
			end)
		end)
	end
end
--------------------------

ScreenGui.Name = math.random(tick()%math.random(tick()))
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 9999999

Main.Name = math.random(tick()%math.random(tick()))
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.35, 0, 0.15, 0)
Main.Size = UDim2.new(0.3, 0, 0.7, 0)
Main.ZIndex = 1
Roundify(Main, 0.025)
dragger.new(Main)

UIAspectRatioConstraint.Name = math.random(tick()%math.random(tick()))
UIAspectRatioConstraint.Parent = Main

Body.Name = math.random(tick()%math.random(tick()))
Body.Parent = Main
Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Body.BorderSizePixel = 0
Body.Position = UDim2.new(0, 0, 0.1, 0)
Body.Size = UDim2.new(1, 0, 0.8, 0)

PlayerList.Name = math.random(tick()%math.random(tick()))
PlayerList.Parent = Body
PlayerList.Active = true
PlayerList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerList.BackgroundTransparency = 1
PlayerList.BorderSizePixel = 0
PlayerList.Size = UDim2.new(1, 0, 1.1, 0)

UIGridLayout.Parent = PlayerList
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
UIGridLayout.CellSize = UDim2.new(0.2, 0, 0.115, 0)

InfoScreen.Name = math.random(tick()%math.random(tick()))
InfoScreen.Parent = Body
InfoScreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoScreen.BackgroundTransparency = 1
InfoScreen.BorderSizePixel = 0
InfoScreen.Size = UDim2.new(1, 0, 1.1, 0)
Roundify(InfoScreen, 0.05)

PlayerImage_2.Name = math.random(tick()%math.random(tick()))
PlayerImage_2.Parent = InfoScreen
PlayerImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerImage_2.BackgroundTransparency = 1
PlayerImage_2.Position = UDim2.new(0.0250000004, 0, 0.0500000007, 0)
PlayerImage_2.Size = UDim2.new(0.25, 0, 0.25, 0)
PlayerImage_2.SizeConstraint = Enum.SizeConstraint.RelativeXX
PlayerImage_2.Image = "rbxthumb://type=AvatarHeadShot&id=1442876605&w=420&h=420"
PlayerImage_2.ImageRectSize = Vector2.new(420, 420)
Roundify(PlayerImage_2, 0.1)

DisplayName.Name = math.random(tick()%math.random(tick()))
DisplayName.Parent = InfoScreen
DisplayName.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
DisplayName.BorderSizePixel = 0
DisplayName.Position = UDim2.new(0.025, 0, 0.325, 0)
DisplayName.Size = UDim2.new(0.25, 0, 0.05, 0)
DisplayName.Font = Enum.Font.SourceSans
DisplayName.Text = "X"
DisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
DisplayName.TextScaled = true
DisplayName.TextSize = 14
DisplayName.TextWrapped = true
Roundify(DisplayName, 0.5)

Data.Name = math.random(tick()%math.random(tick()))
Data.Parent = InfoScreen
Data.Active = true
Data.BackgroundColor3 = Color3.fromRGB(238, 238, 238)
Data.BorderSizePixel = 0
Data.Position = UDim2.new(0.3, 0, 0, 0)
Data.Size = UDim2.new(0.7, 0, 1, 0)
Data.CanvasSize = UDim2.new(0, 0, 4, 0)

UIListLayout.Parent = Data
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.005, 0)

Refresh.Name = math.random(tick()%math.random(tick()))
Refresh.Parent = InfoScreen
Refresh.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Refresh.BorderSizePixel = 0
Refresh.Position = UDim2.new(0.025, 0, 0.915, 0)
Refresh.Size = UDim2.new(0.25, 0, 0.085, 0)
Refresh.Font = Enum.Font.TitilliumWeb
Refresh.Text = "Refresh"
Refresh.TextColor3 = Color3.fromRGB(255, 255, 255)
Refresh.TextScaled = true
Refresh.TextSize = 14
Refresh.TextWrapped = true
Roundify(Refresh, 0.25)

JoinIsland.Name = math.random(tick()%math.random(tick()))
JoinIsland.Parent = InfoScreen
JoinIsland.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
JoinIsland.BorderSizePixel = 0
JoinIsland.Position = UDim2.new(0.025, 0, 0.411, 0)
JoinIsland.Size = UDim2.new(0.25, 0, 0.085, 0)
JoinIsland.Font = Enum.Font.TitilliumWeb
JoinIsland.Text = "Join Island"
JoinIsland.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinIsland.TextScaled = true
JoinIsland.TextSize = 14
JoinIsland.TextWrapped = true
Roundify(JoinIsland, 0.25)

UIPageLayout.Name = math.random(tick()%math.random(tick()))
UIPageLayout.Parent = Body
UIPageLayout.Animated = false

Footer.Name = math.random(tick()%math.random(tick()))
Footer.Parent = Main
Footer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Footer.BorderSizePixel = 0
Footer.Position = UDim2.new(0, 0, 0.85, 0)
Footer.Size = UDim2.new(1, 0, 0.15, 0)
Footer.ZIndex = 0
Roundify(Footer, 0.15)

Header.Name = math.random(tick()%math.random(tick()))
Header.Parent = Main
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 1
Header.Position = UDim2.new(0, 0, 0, 0)
Header.Size = UDim2.new(1, 0, 0.1, 0)
Roundify(Header, 0.15)

Minify.Name = math.random(tick()%math.random(tick()))
Minify.Parent = Header
Minify.BackgroundColor3 = Color3.fromRGB(255, 169, 30)
Minify.BorderSizePixel = 0
Minify.Position = UDim2.new(0.875, 0, 0.35, 0)
Minify.Size = UDim2.new(0.03, 0, 0.03, 0)
Minify.SizeConstraint = Enum.SizeConstraint.RelativeXX
Minify.Font = Enum.Font.SciFi
Minify.Text = ""
Minify.TextColor3 = Color3.fromRGB(85, 85, 85)
Minify.TextScaled = true
Minify.TextSize = 14
Minify.TextTransparency = 0.500
Minify.TextWrapped = true
Roundify(Minify, 0.5)

Close.Name = math.random(tick()%math.random(tick()))
Close.Parent = Header
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.925, 0, 0.35, 0)
Close.Size = UDim2.new(0.03, 0, 0.03, 0)
Close.SizeConstraint = Enum.SizeConstraint.RelativeXX
Close.Font = Enum.Font.SciFi
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14
Close.TextTransparency = 0.500
Close.TextWrapped = true
Roundify(Close, 0.5)

Title.Name = math.random(tick()%math.random(tick()))
Title.Parent = Header
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Size = UDim2.new(1, 0, 0.9, 0)
Title.ZIndex = 0
Title.Font = Enum.Font.SourceSansLight
Title.Text = "Players"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14
Title.TextWrapped = true

----------------------------------------

local selectedPlayer
local connections = {}

local function ac(connection) -- adds a connection
	table.insert(connections,connection)
end	

local function loadPlayerData()
	Title.Text = selectedPlayer.Name
	PlayerImage_2.Image = "rbxthumb://type=AvatarHeadShot&id="..selectedPlayer.UserId.."&w=420&h=420"
	DisplayName.Text = selectedPlayer.DisplayName or selectedPlayer.Name
	
	for _, frame in ipairs(PlayerList:GetChildren()) do
		if frame:IsA("UIGridLayout") then continue end

		frame:Destroy()
	end
	
	for _, stat in ipairs(selectedPlayer:GetChildren()) do
		if not stat:IsA("ValueBase") then continue end
		
		local value
		
		if stat.Value == false then
			value = "No"
		elseif stat.Value == true then
			value = "Yes"
		elseif stat:IsA("ObjectValue") then
			value = "[Instance]"
		else
			value = tostring(stat.Value)
		end
		
		local TemplateFrame = Instance.new("Frame")
		local Label = Instance.new("TextLabel")
		
		TemplateFrame.Name = math.random(tick()%math.random(tick()))
		TemplateFrame.Parent = Data
		TemplateFrame.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
		TemplateFrame.BorderSizePixel = 0
		TemplateFrame.Size = UDim2.new(0.9, 0, 0.015, 0)
		Roundify(TemplateFrame, 0.5)
		
		Label.Name = math.random(tick()%math.random(tick()))
		Label.Parent = TemplateFrame
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0.05, 0, 0, 0)
		Label.Size = UDim2.new(0.9, 0, 1, 0)
		Label.Font = Enum.Font.SourceSans
		Label.Text = '"'..stat.Name..'": '..value
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextScaled = true
		Label.TextSize = 14
		Label.TextWrapped = true
		Label.TextXAlignment = Enum.TextXAlignment.Left
	end
end

local function inspectPlayer(player)
	selectedPlayer = player
	
	InfoScreen.Visible = true
	PlayerList.Visible = false
	UIPageLayout:JumpTo(InfoScreen)
	loadPlayerData()
end

local function loadPlayerList()
	for _, frame in ipairs(PlayerList:GetChildren()) do
		if frame:IsA("UIGridLayout") then continue end
		
		frame:Destroy()
	end
	
	for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
		local TemplateFrame = Instance.new("Frame")
		local PlayerTitle = Instance.new("TextLabel")
		local PlayerImage = Instance.new("ImageButton")
		
		TemplateFrame.Name = player.UserId
		TemplateFrame.Parent = PlayerList
		TemplateFrame.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
		TemplateFrame.BorderSizePixel = 0
		TemplateFrame.Size = UDim2.new(0, 100, 0, 100)
		Roundify(TemplateFrame, 0.05)
		
		PlayerTitle.Name = math.random(tick()%math.random(tick()))
		PlayerTitle.Parent = TemplateFrame
		PlayerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PlayerTitle.BackgroundTransparency = 1
		PlayerTitle.BorderSizePixel = 0
		PlayerTitle.Position = UDim2.new(0, 0, 0.9, 0)
		PlayerTitle.Size = UDim2.new(1, 0, 0.1, 0)
		PlayerTitle.Font = Enum.Font.Roboto
		PlayerTitle.Text = player.DisplayName or player.Name
		PlayerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		PlayerTitle.TextScaled = true
		PlayerTitle.TextSize = 14
		PlayerTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		PlayerTitle.TextWrapped = true

		PlayerImage.Name = math.random(tick()%math.random(tick()))
		PlayerImage.Parent = TemplateFrame
		PlayerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PlayerImage.BackgroundTransparency = 1
		PlayerImage.BorderSizePixel = 0
		PlayerImage.Size = UDim2.new(1, 0, 0.9, 0)
		PlayerImage.AutoButtonColor = false
		PlayerImage.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=420&h=420"
		PlayerImage.ImageRectSize = Vector2.new(420, 420)
		
		local function playerImageClicked()
			inspectPlayer(player)
		end
		
		ac(PlayerImage.MouseButton1Click:Connect(playerImageClicked))
	end
end

local function exitGui()
	for _, connection in ipairs(connections) do
		connection:Disconnect()
	end
	
	connections = {}
	
	ScreenGui:Destroy()
	ScreenGui = nil
end

local function joinIsland()
	local ohTable1 = {
		["joinCode"] = selectedPlayer.JoinCode.Value
	}

	game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.VISIT_ONLINE_ISLAND:InvokeServer(ohTable1)
end

local function homePage()
	PlayerList.Visible = true
	InfoScreen.Visible = false
	UIPageLayout:JumpTo(PlayerList)
	loadPlayerList()
	Title.Text = "Players"
end

ac(JoinIsland.MouseButton1Click:Connect(joinIsland))
ac(Refresh.MouseButton1Click:Connect(loadPlayerData))
ac(Minify.MouseButton1Click:Connect(homePage))
ac(Close.MouseButton1Click:Connect(exitGui))

ac(game:GetService("Players").ChildAdded:Connect(loadPlayerList))
ac(game:GetService("Players").ChildRemoved:Connect(loadPlayerList))

InfoScreen.Visible = false
homePage()
