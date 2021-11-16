local Args = {"SkillsControl","skillsControl",nil,"Combat",Enum.KeyCode.Z,"Release"}

local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
   if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Z) then return end
   game:GetService("ReplicatedStorage").Remotes.ServerHandler:FireServer(unpack(Args))
end)
