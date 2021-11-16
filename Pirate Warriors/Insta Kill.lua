local old

old = hookmetamethod(game, "__namecall", function(Self, ...)
   local Args = {...}

   if Args[1] == "DmgCentral" and Args[2] == "calculateDmg" and Args[6] == "Melee" then
       Args[7] = getgenv().meleeDamage or math.huge
   end

   return old(Self, unpack(Args))
end)
