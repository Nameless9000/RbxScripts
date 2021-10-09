-- https://v3rmillion.net/showthread.php?tid=1140358
--[[ how to use:
  1. run script
  2. buy stock (if u don't have any)
  3. wait for stock to go up
  4. sell stock
  5. inf exp given rejoin for it to save
]]

game:GetService("RunService").RenderStepped:Connect(function()
    local x = math.random(999999,999999999)
    game:GetService("ReplicatedStorage").PortfolioFunctions.Experience:InvokeServer(x, 0)
end)
