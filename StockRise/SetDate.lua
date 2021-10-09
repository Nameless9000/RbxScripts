-- lol

local Day = shared.day or 1
local Month = shared.month or "January"
local Year = shared.year or 2021

game:GetService("ReplicatedStorage").PortfolioFunctions.UpdateInformation:InvokeServer(Day.." "..Month.." "..Year)
game:GetService("Players").LocalPlayer:Kick("Date set.")
