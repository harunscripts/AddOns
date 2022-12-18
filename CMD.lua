AddCommand("af2", {"antifling2"}, "Makes you unable to be flung in some cases ", function()
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")

local Properties = PhysicalProperties.new(0, 0, 0, 0, 0)
local Properties2 = PhysicalProperties.new(1/0, 1/0, 1/0, 1/0, 1/0)

rs.Stepped:Connect(function()
    for i,v in pairs(lp.Parent:GetPlayers()) do
        if v.Name ~= lp.Name then
            pcall(function()
                if v.Character then
                    for j, x in pairs(v.Character:GetDescendants()) do
                        if x.ClassName:lower():find("part") then
                            pcall(function()
                                x.CanCollide = false
                                x.Velocity = Vector3.new()
                                x.RotVelocity = Vector3.new()
                                x.CustomPhysicalProperties = Properties
                                x.CanCollide = false
                            end) 
                        end
                    end
                end
            end) 
        end
    end
    pcall(function()
        for i,v in pairs(lp.Character:GetDescendants()) do
            if v.ClassName:lower():find("part") then
                v.CustomPhysicalProperties = Properties2
            end
        end
    end)
end)
end)
