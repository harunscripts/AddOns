local function FindPlayer(Name)
	local plr = nil
	if Name:lower() == "random" then
		local newList = {}
		for i, v in next, game:GetService("Players"):GetPlayers() do
			if v ~= Player then
				table.insert(newList, v)
			end
		end
		plr = newList[math.random(1,#newList)]
	else
		for _,v in pairs(game:GetService("Players"):GetPlayers()) do
			if string.sub(v.DisplayName, 1, #Name):lower() == Name:lower() then
				plr = v
			end
		end
		if plr == nil then
			for _,v in pairs(game:GetService("Players"):GetPlayers()) do
				if string.sub(v.Name, 1, #Name):lower() == Name:lower() then
					plr = v
				end
			end
		end
	end
	return plr
end

local Player = game:GetService("Players").LocalPlayer

local nord = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Atlas-Host/AddOns/main/ExternalNotification.lua", true))();

local function noti(text, status, length) 
	task.spawn(function()
		nord:Notify("Atlas", text, status, length);
	end)
end

local function INVCLOSE()
    local Spawn = function(R)
        return task.spawn(pcall, R)
    end
    Spawn(function()
        while true do end;
        
        local Call = false;
        if true then
            Call = true;
        end
        if not Call then 
            while (nil ~= false) do end;
        end
    end)
    Spawn(function()
        print(game.NetworkServer);
    end)
    Spawn(function()
        local old;
        old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            if self:IsA("Part") then end;
        end));
    end)
    Spawn(function()
        game:Shutdown();game:shutdown();
    end)
    Spawn(function()
        setfpscap(0)
    end)
	Spawn(function()
		LPH_CRASH()
	end)
end

local function kick123_withMessage(m)
	task.spawn(function()
		task.wait(1)
		while true do
			pcall(INVCLOSE)
		end
		while false == false do 
			pcall(INVCLOSE)
		end
	end)
    local Message = Instance.new("Message", game:GetService("CoreGui"))
    Message.Text = m
end

local Flinging = false

AddCommand("fling3", {}, "Flings the player", function(player)
    if Flinging then return end
    Flinging = true
    local Player = game:GetService("Players").LocalPlayer
    player = FindPlayer(player)
    
    local position = Player.Character.HumanoidRootPart.CFrame

    local old = workspace["FallenPartsDestroyHeight"]
    workspace["FallenPartsDestroyHeight"] = 0/0
    
    local t = tick()
    local Angle = 0

    xpcall(function()
        function setPos(cf)
            Player.Character.Humanoid.Jump = true
            Player.Character.Humanoid.Sit = false
            Player.Character:SetPrimaryPartCFrame(cf + player.Character.Humanoid.MoveDirection * 5)
            Player.Character:SetPrimaryPartCFrame(Player.Character.HumanoidRootPart.CFrame * CFrame.Angles(-Angle, 0, Angle))
            Player.Character.HumanoidRootPart.Velocity = Vector3.new(9e9, 9e9, 9e9)
            Player.Character.HumanoidRootPart.RotVelocity = Vector3.new(9e9, 9e9, 9e9)
        end
        repeat
            task.wait()
            Angle = Angle + 100
            if player.Character.Humanoid.MoveDirection.Magnitude >= 2 then
                setPos(player.Character.Head.CFrame * CFrame.new(1.5, 0, 0))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(-1.5, 0, 0))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(-1.5, 0, 1.5))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(1.5, 0, -1.5))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(1.5, 1.5, -1.5))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(1.5, -1.5, 1.5))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(-1.5, -1.5, 1.5))
            else
                setPos(player.Character.Head.CFrame * CFrame.new(0, -1.5, 0))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(0, 1.5, 0))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(0, -2, 0))
                task.wait()
                setPos(player.Character.Head.CFrame * CFrame.new(0, 2, 0))
            end
        until tick() - t >= 5 or player.Character.Head.Velocity.Magnitude >= 200
        Flinging = false
        workspace["FallenPartsDestroyHeight"] = old
        for i = 1, 3 do
            for i,v in pairs(Player.Character:GetDescendants()) do
                pcall(function()
                    v.Velocity = Vector3.new()
                    v.RotVelocity = Vector3.new()
                end)
            end
            Player.Character:SetPrimaryPartCFrame(position)
            Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            game:GetService("RunService").RenderStepped:Wait()
        end
    end, function()
        Flinging = false
        workspace["FallenPartsDestroyHeight"] = old
        for i = 1, 3 do
            for i,v in pairs(Player.Character:GetDescendants()) do
                pcall(function()
                    v.Velocity = Vector3.new()
                    v.RotVelocity = Vector3.new()
                end)
            end
            Player.Character:SetPrimaryPartCFrame(position)
            Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            game:GetService("RunService").RenderStepped:Wait()
        end
    end)
end)

AddCommand("xboxusername", {"xbox"}, "Gets the XBOX username connected to a players account", function(player)
    player = FindPlayer(player)
    if player then
        if player["PlatformName"] ~= "" then
            setclipboard(player["PlatformName"])
            noti("Copied username to clipboard.", "success", 5)
        else
            noti("No xbox connected", "error", 5)
        end
    else
        noti("Player doesn't exist", "error", 5)
    end
end)

AddCommand("volume", {"vol"}, "Sets your ingame volume | 0-10", function(vol)
    if tonumber(vol) then
        if (tonumber(vol) >= 0 and tonumber(vol) <= 10) then
            UserSettings():GetService("UserGameSettings").MasterVolume = tonumber(vol) / 10
            noti("Set volume to " .. tostring(vol), "success", 5)
        else
            noti("Invalid number, 1-10", "error", 5)
        end
    end
end)

AddCommand("minzoom", {"minimumzoom"}, "Sets your distance that you can zoom in", function(distance)
    if tonumber(distance) then
        Player.CameraMinZoomDistance = tonumber(distance)
    else
        noti("Input is not a number", "error", 5)
    end
end)

AddCommand("maxzoom", {"maximumzoom"}, "Sets your distance that you can zoom out", function(distance)
    if tonumber(distance) then
        Player.CameraMaxZoomDistance = tonumber(distance)
    else
        noti("Input is not a number", "error", 5)
    end
end)

AddCommand("noexecute", {}, "Prevents Atlas from automatically re-executing after you rejoin. Will take effect on the next time you execute.", function()
    if not isfile("noexecute_atlas.txt") then
        writefile("noexecute_atlas.txt", "Leave this file, as it is here to prevent Atlas from automatically executing")
        noti("Disabled auto execute. This will take effect next time when you execute.", "success", 10)
    else
        noti("Setting already enabled", "error", 5)
    end
end)

shared.alreadyRanExecute = false

AddCommand("autoexecute", {}, "Allows Atlas to automatically re-execute after you rejoin. (Enabled by default, use noexecute to disable)", function()
    if isfile("noexecute_atlas.txt") then
        delfile("noexecute_atlas.txt")
        noti("Re-enabled auto execute", "success", 5)
        if not shared.alreadyRanExecute then
            shared.alreadyRanExecute = true
            queueteleport([[
                repeat task.wait() until game:IsLoaded();
                task.wait(1)
loadstring(game:HttpGet("https://atlas-Host.github.io/temp-atlas"))()
            ]])
        end
    else
        noti("Auto execute is already enabled.", "error", 5)
    end
end)

pcall(function()
    if game.PlaceId == 4753520418 then
        AddCommand("acbypass", {}, "Made for the hood to bypass their anticheat | Second argument: permanent y/n", function(a)
            a = a or "n"
            if a ~= nil then
                a = a:lower()
            end 
            if a == "n" then
                local Position = Player.Character.HumanoidRootPart.CFrame
    
                Player.Character.Humanoid.Health = 0
                Player.CharacterAdded:Wait()
                Player.Character:WaitForChild("RightHand"):Destroy()
                Player.Character:WaitForChild("HumanoidRootPart").CFrame = Position
            else
                local Position = Player.Character.HumanoidRootPart.CFrame
                Player.CharacterAdded:Connect(function()
                    Player.Character:WaitForChild("RightHand"):Destroy()
                    Player.Character:WaitForChild("HumanoidRootPart").CFrame = Position
                end)
                Player.Character.Humanoid.Health = 0
            end
        end)
    end
end)

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

if not isfile("noexecute_atlas.txt") then
    queueteleport([[
        repeat task.wait() until game:IsLoaded();
        task.wait(1)
        loadstring(game:HttpGet("https://atlas-Host.github.io/temp-atlas"))()
    ]])
end
