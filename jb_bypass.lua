--[[
    NAME: Jailbreak WalkSpeed and JumpPower Bypass
    AUTHOR: tealingg
    LAST MODIFIED: 2021-06-28
--]]

-- Variables
local gmt = getrawmetatable(game);
local old_newindex;
local players = game:GetService("Players");
local player = players.LocalPlayer;

-- Start of script
setreadonly(gmt, false);

old_newindex = hookfunction(gmt.__newindex, newcclosure(function(table, index, value)
    if table ~= (player.Character or player.CharacterAdded:Wait()):WaitForChild("Humanoid") then
        return old_newindex(table, index, value);
    end;
    if not checkcaller() and (tostring(index) == "WalkSpeed" or tostring(index) == "JumpPower") then
        return;
    end;
    return old_newindex(table, index, value);
end));

setreadonly(gmt, true);
