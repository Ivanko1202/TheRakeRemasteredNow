---@diagnostic disable: undefined-global
if game.GameId == 847722000 then
	if getgenv().RakeGui then
		return
	end

	if syn or KRNL_LOADED or is_sirhurt_closure or pebc_execute then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Info",
			Text = "You are a synapse x user! This script will 100% work",
			Duration = 5
		})
	else
		game.StarterGui:SetCore("SendNotification", {
			Title = "Info",
			Text = "You are not a synapse x user. This script is likely not to work",
			Duration = 5
		})
	end


	local Me = {
		LocalPlayer = game.Players.LocalPlayer,
		Character = game.Players.LocalPlayer.Character,
	}




	local AllowRunService = true

	-- Stamina Table
    --[[
    for i,v in pairs(getgc(true)) do
        if type(v) == "table" then
            if rawget(v,"stamina") then
                _G.StaminaTable = v
            end
        end
    end
    ]]

	local HidePart = Instance.new("Part")
	HidePart.Size = Vector3.new(20,1000,20)
	HidePart.Parent = game:GetService("Workspace")
	HidePart.Position = Vector3.new(0,10000,0)
	HidePart.Anchored = true

	local HidePartHightLight = Instance.new("Highlight")
	HidePartHightLight.Name = "HidePartHightLight"
	HidePartHightLight.FillColor = Color3.new(255,255,255)
	HidePartHightLight.OutlineColor = Color3.new(170,0,0)
	HidePartHightLight.FillTransparency = .8
	HidePartHightLight.OutlineTransparency = .8
	HidePartHightLight.Parent = HidePart

	
	local function getHum()
		if game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			return game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		else
			return false
		end
	end
	
	local function GET_HRP()
		if not game.Players.LocalPlayer.Character then

		else
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				return game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			end
		end
		return nil
	end

	local function SET_HRP_CFRAME(cframer : CFrame)
		GET_HRP().CFrame = cframer	
	end




	local function openhousedoor()
		for i = 1,1 do
			local lastpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame

			SET_HRP_CFRAME(game:GetService("Workspace").Map.SafeHouse.Door.Door.CFrame+Vector3.new(0,-7,0))
			wait()
			GET_HRP().Anchored = true
			wait(.4)
			local ohString1 = "Door"

			workspace.Map.SafeHouse.Door.RemoteEvent:FireServer(ohString1)
			wait(.4)
			SET_HRP_CFRAME(lastpos)
			wait()
			GET_HRP().Anchored = false
			wait(.4)
		end
	end

	local function MOUSETP()
		local mouse = game.Players.LocalPlayer:GetMouse()

		local tweenService = game:GetService("TweenService")
		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
		local part = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		local goal = {CFrame = CFrame.new(mouse.Hit.Position)}
		local tween = tweenService:Create(part, tweenInfo, goal)
		tween:Play()
	end

	local function opencrate()
		local ohString1 = "Open"
		local ohBoolean2 = true

		game:GetService("ReplicatedStorage").SupplyClientEvent:FireServer(ohString1, ohBoolean2)
	end

	local function aigoto(pos : Vector3)
		local path = game:GetService("PathfindingService"):CreatePath()

		path:ComputeAsync(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position,pos)

		local waypoints = path:GetWaypoints()

		for i,v in pairs(waypoints) do
			getHum():MoveTo(v.Position)
		end
	end


	local function restorepower()
		local lastpos = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
		wait()
		for i = 1,1000 do
			SET_HRP_CFRAME(CFrame.new(-280.808014, 20.3924561, -212.159821, -0.10549771, -1.16743761e-08, -0.994419575, 9.45945828e-08, 1, -2.17754046e-08, 0.994419575, -9.63639621e-08, -0.10549771))
		end
		GET_HRP().Anchored = true
		wait()
		local ohString1 = "StationStart"

		workspace.Map.PowerStation.StationFolder.RemoteEvent:FireServer(ohString1)
		wait(20)
		GET_HRP().Anchored = false
	end



	local function airdropchams(mode)
		if tostring(mode) == "Enable" then
			if game:GetService("Workspace").Debris.SupplyCrates:FindFirstChild("Box") then
				if game:GetService("Workspace").Debris.SupplyCrates.Box:FindFirstChild("SleepyDropChams") then

				else
					local chams = Instance.new("Highlight")
					chams.FillColor = Color3.new(0.317647, 1, 0)
					chams.OutlineColor = Color3.new(0, 1, 0.250980)
					chams.Parent = game:GetService("Workspace").Debris.SupplyCrates.Box
					chams.Adornee = game:GetService("Workspace").Debris.SupplyCrates.Box
					chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					chams.OutlineTransparency = 0
					chams.FillTransparency = 1
					chams.Name = "SleepyDropChams"
				end
			end
		elseif tostring(mode) == "Disable" then
			for i,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetDescendants()) do
				if v.Name == "SleepyDropChams" then
					v:Destroy()
				end
			end		
		end

	end

	local function rakechams()
		if game:GetService("Workspace"):FindFirstChild("Rake") then
			if game:GetService("Workspace").Rake:FindFirstChild("SleepyRakeChams") then

			else
				local chams = Instance.new("Highlight")
				chams.FillColor = Color3.new(170, 0, 0)
				chams.OutlineColor = Color3.new(255,255,255)
				chams.Parent = game:GetService("Workspace").Rake
				chams.Adornee = game:GetService("Workspace").Rake
				chams.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				chams.OutlineTransparency = .9
				chams.FillTransparency = 0.5
				chams.Name = "SleepyRakeChams"
			end

		end

	end

	local function disablerakechams()
		if game:GetService("Workspace"):FindFirstChild("Rake") then
			for i,v in pairs(game:GetService("Workspace"):FindFirstChild("Rake"):GetDescendants()) do
				if v.Name == "SleepyRakeChams" then
					v:Destroy()
				end
			end
		end
	end



	local RunService = game:GetService("RunService")
	local InputService = game:GetService("UserInputService")
	local FreeCamPart = Instance.new("Part")
	FreeCamPart.Anchored = true
	FreeCamPart.Size = Vector3.new(1,1,1)
	FreeCamPart.Parent = game:GetService("Workspace")
	FreeCamPart.CFrame = CFrame.new(0,10000,0)
	FreeCamPart.Transparency = 1
	FreeCamPart.Name = "FreeCamPart"





	pcall(function() getgenv().RakeGui = true end)


	local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ltseverydayyou/Rayfield-backup/main/Rayfield'))()


	local Window = Rayfield:CreateWindow({
		Name = "Project [The Rake]",
		LoadingTitle = "Project [The Rake]",
		LoadingSubtitle = "Sleepy Hub",
		ConfigurationSaving = {
			Enabled = true,
			FolderName = "ProjectTheRake",
			FileName = "Project"
		}
	})

	--Tabs
	local PlayerTab = Window:CreateTab("Player", 11252440515)
	local ClientTab = Window:CreateTab("Client", 4483345998)
	local ExploitsTab = Window:CreateTab("Exploits", 11252440817)
	local SettingsTab = Window:CreateTab("Settings", 11252440305)

	ClientTab:CreateToggle({
		Name = "FreeCam",
		CurrentValue = false,
		Flag = "freeCam",
		Callback = function(state)
			_G.FreeCam = state
			if _G.FreeCam == true then
				pcall(function()

					FreeCamPart.CFrame = game.Players.LocalPlayer.Character.Head.CFrame
				end)
				repeat task.wait(0.1)
					pcall(function()
						function tweenPart(time,partto,TSCF)
							local tweenService = game:GetService("TweenService")
							local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
							local part = partto
							local goal = {}
							goal.CFrame = TSCF
							local tween = tweenService:Create(part, tweenInfo, goal)
							tween:Play()
						end
						game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Scriptable
						local mouse = game.Players.LocalPlayer:GetMouse()
						game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
						game:GetService("Workspace").CurrentCamera.CameraSubject = FreeCamPart

						FreeCamPart.CFrame = CFrame.new(FreeCamPart.Position,mouse.Hit.Position)
						if InputService:IsKeyDown(Enum.KeyCode.Space) then
							tweenPart(0.04,FreeCamPart,FreeCamPart.CFrame + Vector3.new(0,_G.FreeCamSpeed,0))
							--FreeCamPart.CFrame = FreeCamPart.CFrame + Vector3.new(0,_G.FreeCamSpeed,0)
						elseif InputService:IsKeyDown(Enum.KeyCode.LeftShift) then
							tweenPart(0.04,FreeCamPart,FreeCamPart.CFrame + Vector3.new(0,-_G.FreeCamSpeed,0))
							--FreeCamPart.CFrame = FreeCamPart.CFrame + Vector3.new(0,-_G.FreeCamSpeed,0)
						end
						if true then
							if InputService:IsKeyDown(Enum.KeyCode.W) then
								tweenPart(0.04,FreeCamPart,FreeCamPart.CFrame+FreeCamPart.CFrame.LookVector * _G.FreeCamSpeed)
								-- FreeCamPart.CFrame = FreeCamPart.CFrame+FreeCamPart.CFrame.LookVector * _G.FreeCamSpeed
							elseif InputService:IsKeyDown(Enum.KeyCode.S) then
								tweenPart(0.04,FreeCamPart,FreeCamPart.CFrame+FreeCamPart.CFrame.LookVector * -_G.FreeCamSpeed)
								-- FreeCamPart.CFrame = FreeCamPart.CFrame+FreeCamPart.CFrame.LookVector * -_G.FreeCamSpeed
							end
						end
					end)
				until _G.FreeCam == false
				pcall(function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
					game:GetService("Workspace").CurrentCamera.CameraType = Enum.CameraType.Custom
					game:GetService("Workspace").CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Head
				end)
			end
		end,
	})

	ClientTab:CreateSlider({
		Name = "FreeCam Speed",
		Range = {0.01, 20},
		Increment = 0.01,
		CurrentValue = 0.2,
		Flag = "Speed",
		Callback = function(Value)
			_G.FreeCamSpeed = Value
		end,
	})

	ClientTab:CreateToggle({
		Name = "No Fog",
		CurrentValue = false,
		Flag = "NoFog",
		Callback = function(state)
			_G.NoFog = state
			if state == false then
				game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = 75
			end
		end,
	})

	-- no fog

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.NoFog == true then
				game:GetService("ReplicatedStorage").CurrentLightingProperties.FogEnd.Value = 9e9
			end
		end
	end)

	ClientTab:CreateButton({
		Name = "Third Person",
		Callback = function()
			game.Players.LocalPlayer.Character.RagdollTime.RagdollSwitch.Value = true
			game.Players.LocalPlayer.Character.RagdollTime.RagdollSwitch.Value = false
		end,
	})



	PlayerTab:CreateToggle({
		Name = "Inf Stamina",
		CurrentValue = false,
		Flag = "InfStamina",
		Callback = function(state)
			_G.InfStamina = state
			if _G.InfStamina == true then
				for i,v in pairs(getgc(true)) do
					if type(v) == "table" then
						if rawget(v,"STAMINA_REGEN") then
							v.STAMINA_REGEN = 100
							v.JUMP_STAMINA = 0
							v.JUMP_COOLDOWN = 0
							v.STAMINA_TAKE = 0
							v.stamina = 100
						end
					end
				end
			end
		end,
	})

	PlayerTab:CreateToggle({
		Name = "Inf Night Vision",
		CurrentValue = false,
		Flag = "InfNightVision",
		Callback = function(state)
			_G.InfNightVision = state
			if _G.InfNightVision == true then
				for i,v in pairs(getgc(true)) do
					if type(v) == "table" then
						if rawget(v,"NVG_TAKE") then
							v.NVG_TAKE = 0
							v.NVG_REGEN = 100
						end
					end
				end                
			end
		end,
	})

	local RakeKillauraToggle = ExploitsTab:CreateToggle({
		Name = "Rake Killaura",
		CurrentValue = false,
		Flag = "RakeAura",
		Callback = function(state)
			_G.RakeKillAura = state
			Rayfield:Notify({
				Title = "Rake Killaura",
				Content = "Rake Killaura : "..tostring(_G.RakeKillAura),
				Duration = 1,
				Image = 4483362458,
			})
			if _G.RakeKillAura == true then
				repeat task.wait(0.1)
					pcall(function()
						for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
							if game:GetService("Workspace"):FindFirstChild("Rake") then
								if (game:GetService("Workspace").Rake.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 200 then
									game.Players.LocalPlayer.Character.StunStick.Event:FireServer("S")
									wait()
									game.Players.LocalPlayer.Character.StunStick.Event:FireServer("H", workspace.Rake.HumanoidRootPart)	
								end
							end
						end
						wait(.1)
					end)
				until _G.RakeKillAura == false
			end
		end,
	})

	-- rake killaura hitpart 
	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.RakeKillAura == true then
				pcall(function()
					if game:GetService("Workspace"):FindFirstChild("Rake") then
						game.Players.LocalPlayer.Character.StunStick.HitPart.Position = game:GetService("Workspace"):FindFirstChild("Rake").HumanoidRootPart.Position
					end
				end)
			end
		end
	end)



	-- rake killaura bind

	ExploitsTab:CreateKeybind({
		Name = "Toggle Killaura",
		CurrentKeybind = "R",
		HoldToInteract = false,
		Flag = "KillAuraKeybind",
		Callback = function(state)
			if _G.RakeKillAura == true then
				RakeKillauraToggle:Set(false)
			elseif _G.RakeKillAura == false then
				RakeKillauraToggle:Set(true)
			end
		end,
	})

	ClientTab:CreateToggle({
		Name = "Rake Chams",
		CurrentValue = false,
		Flag = "RakeChams",
		Callback = function(state)
			_G.RakeChams = state
			for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
				if v.Name == "Rake" then
					v:SetAttribute("hasESP",false)
				end
			end
			if _G.RakeChams == true then
				repeat task.wait(0.1)

				until _G.RakeChams == false
			elseif _G.RakeChams == false then
				if game:GetService("Workspace"):FindFirstChild("Rake") then
					if game:GetService("Workspace"):FindFirstChild("Rake"):FindFirstChild("RakeChams") then
						game:GetService("Workspace"):FindFirstChild("Rake"):FindFirstChild("RakeChams"):Destroy()
					end
				end
			end
		end,
	})

	ClientTab:CreateToggle({
		Name = "Player ESP",
		CurrentValue = false,
		Flag = "PlrEsp",
		Callback = function(state)
			_G.PlayerESP = state
			if _G.PlayerESP == true then
				repeat task.wait(0.1)

				until _G.PlayerESP == false
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					pcall(function()
						if not v.Character then
						else
							if v.Character:GetAttribute("PlayerESP") == true then
								v.Character:SetAttribute("PlayerESP",false)
							end
							if v.Character:FindFirstChild("PlayerChams") then
								v.Character.PlayerChams:Destroy()

							end
						end
					end)
				end
			end
		end,
	})

	ClientTab:CreateToggle({
		Name = "Show Distance Travelled",
		CurrentValue = false,
		Flag = "ShowDistanceTravelled",
		Callback = function(state)
			_G.PlayerESPShowDistance = state
		end,
	})

	ExploitsTab:CreateButton({
		Name = "Bring Scraps",
		Callback = function()
			for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
				if v.Name:lower() == "scrap" then
					v:PivotTo(game.Players.LocalPlayer.Character:GetPivot())
				end
			end
		end,
	})

	ClientTab:CreateToggle({
		Name = "Flare Gun ESP",
		CurrentValue = false,
		Flag = "FlareGunESP",
		Callback = function(state)
			_G.FlareGunESP = state
			if _G.FlareGunESP == false then
				if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
					game:GetService("Workspace"):FindFirstChild("FlareGunPickUp"):SetAttribute("FlareGunESP",false)
				end
				for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
					if v.Name == "FlareGunPickUp" then
						if v:FindFirstChild("FlareGunChams") then
							v.FlareGunChams:Destroy()
						end
					end
				end
			end
		end,
	})

	ClientTab:CreateToggle({
		Name = "SupplyDrop ESP",
		CurrentValue = false,
		Flag = "SupplyDropESP",
		Callback = function(state)
			_G.SupplyDropESP = state
			for i,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do
				v:SetAttribute("SupplyDropESP",false)
			end
		end,
	})



	-- Flare Gun ESP 

	game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
		if AllowRunService == true then
			if _G.FlareGunESP == true then
				if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
					if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp"):GetAttribute("FlareGunESP") == true then

					else
						game:GetService("Workspace"):FindFirstChild("FlareGunPickUp"):SetAttribute("FlareGunESP",true)
						local esp = Drawing.new("Text")
						esp.Text = "Flare Gun"
						esp.Color = Color3.fromRGB(0, 225, 255)
						esp.Outline = false
						esp.Center = true
						esp.Font = 2
						esp.Size = 12
						esp.Visible = true
						game:GetService("RunService").Heartbeat:Connect(function()
							if AllowRunService == true then
								if _G.FlareGunESP == true then
									if game:GetService("Workspace"):FindFirstChild("FlareGunPickUp") then
										local cam = workspace.CurrentCamera
										local Pos,OnScreen = cam:WorldToViewportPoint(game:GetService("Workspace").FlareGunPickUp.FlareGun.Position)
										if OnScreen then
											esp.Visible = true
											esp.Position = Vector2.new(Pos.X,Pos.Y)
										else
											esp.Visible = false
										end
									else
										esp.Visible = false
									end
								else
									esp.Visible = false 
								end
							else
								esp.Visible = false
							end
						end)
					end
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "FlareGunPickUp" then
							if v:FindFirstChild("FlareGunChams") then
								v.FlareGunChams.Enabled = true
							else
								local FlareGunChams = Instance.new("Highlight")
								FlareGunChams.Parent = v
								FlareGunChams.Enabled = true
								FlareGunChams.Adornee = v
								FlareGunChams.FillColor = Color3.fromRGB(255, 0, 0)
								FlareGunChams.FillTransparency = 0.3
								FlareGunChams.OutlineTransparency = .8
								FlareGunChams.OutlineColor = Color3.fromRGB(170,170,170)
								FlareGunChams.Name = "FlareGunChams"
							end
						end
					end
				end 
			end
		end
	end)

	-- Rake Chams 



	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.RakeChams == true then
				for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
					if v.Name == "Rake" then
						if v:FindFirstChild("RakeChams") then
							v.RakeChams.Enabled = true
						else
							local RakeChams = Instance.new("Highlight")
							RakeChams.Parent = v
							RakeChams.Adornee = v
							RakeChams.FillColor = Color3.fromRGB(170,0,0)
							RakeChams.OutlineColor = Color3.fromRGB(255,255,255)
							RakeChams.FillTransparency = .3
							RakeChams.OutlineTransparency =.9
							RakeChams.Name = "RakeChams" -- add chams
						end
					end
				end
				for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
					if v.Name == "Rake" then
						if v:GetAttribute("hasESP") == true then

						else
							v:SetAttribute("hasESP",true) do
								local ESP = Drawing.new("Text")
								ESP.Center = true
								ESP.Outline = false
								ESP.Text = v.Name
								ESP.Font = 2
								ESP.Size = 12
								ESP.Color = Color3.fromRGB(255, 0, 0)
								ESP.Visible = true
								game:GetService("RunService").Heartbeat:Connect(function()
									pcall(function()
										if AllowRunService == true then
											if _G.RakeChams == true then
												if game:GetService("Workspace"):FindFirstChild(v.Name) then
													local cam = workspace.CurrentCamera
													local Pos,OnScreen = cam:WorldToViewportPoint(v.Head.Position)
													if OnScreen then
														ESP.Text = tostring(v)..", Health : "..tostring(v.Monster.Health)
														ESP.Visible = true
														ESP.Position = Vector2.new(Pos.X,Pos.Y)
													else
														ESP.Visible = false
													end
												else
													ESP.Visible = false
												end
											else
												ESP.Visible = false
											end
										else
											ESP.Visible = false
										end
									end)
								end)
							end
						end
					end
				end
			end
		end
	end)


	-- Player Esp 

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.PlayerESP == true then
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name ~= game.Players.LocalPlayer.Name then
						if not v.Character then

						else
							if v.Character:FindFirstChild("Head") then
								if v.Character:GetAttribute("PlayerESP") == true then

								else
									local ESP = Drawing.new("Text")
									ESP.Center = true
									ESP.Outline = false
									ESP.Color = Color3.fromRGB(0, 255, 34)
									ESP.Size = 12
									ESP.Font = 2
									ESP.Text = v.Name.." [Distance Travelled : "..tostring(v.DistanceTravelled.Value).."]"
									ESP.Visible = false

									v.Character:SetAttribute("PlayerESP",true)
									game:GetService("RunService").Heartbeat:Connect(function()
										pcall(function()
											if AllowRunService == true then
												if _G.PlayerESP == true then
													if game:GetService("Players"):FindFirstChild(tostring(v.Name)) then
														local cam = workspace.CurrentCamera
														local Pos,OnScreen = cam:WorldToViewportPoint(v.Character.Head.Position)
														if OnScreen then
															ESP.Visible = true
															ESP.Position = Vector2.new(Pos.X,Pos.Y)
															if _G.PlayerESPShowDistance == true then
																ESP.Text = v.Name.." [Distance Travelled : "..tostring(v.DistanceTravelled.Value).."]"
															else
																ESP.Text = v.Name
															end
														else
															ESP.Visible = false
														end
													else
														ESP.Visible = false
													end
												else
													ESP.Visible = false 
												end
											else
												ESP.Visible = false
											end
										end)
									end)

								end
							end
						end
					end
				end      
				for i,v in pairs(game.Players:GetPlayers()) do
					if not v.Character then 
					else
						if v.Name ~= game.Players.LocalPlayer.Name then
							if v.Character:FindFirstChild("PlayerChams") then
								v.Character.PlayerChams.Enabled = true
							else
								local PlayerChams = Instance.new("Highlight")
								PlayerChams.Parent = v.Character
								PlayerChams.Enabled = true
								PlayerChams.Adornee = v.Character
								PlayerChams.FillColor = Color3.fromRGB(0, 11, 170)
								PlayerChams.FillTransparency = 0.3
								PlayerChams.OutlineTransparency = .8
								PlayerChams.OutlineColor = Color3.fromRGB(170,170,170)
								PlayerChams.Name = "PlayerChams"
							end
						end
					end
				end
			end

		end
	end)

	-- SupplyDrop ESP

	game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
		if AllowRunService == true then
			if _G.SupplyDropESP == true then
				for i,v in pairs(game:GetService("Workspace").Debris.SupplyCrates:GetChildren()) do
					if v.Name == "Box" then
						if v:GetAttribute("SupplyDropESP") == true then

						else

							v:SetAttribute("SupplyDropESP",true) 
							local ESP = Drawing.new("Text")
							ESP.Color = Color3.fromRGB(251, 255, 0)
							ESP.Outline = false
							ESP.Size = 12
							ESP.Font = 2
							ESP.Text = "Supply Drop"
							ESP.Visible = true
							ESP.Center = true
							game:GetService("RunService").Heartbeat:Connect(function()
								pcall(function()
									if AllowRunService == true then
										if _G.SupplyDropESP == true then

											if game:GetService("Workspace").Debris.SupplyCrates:FindFirstChild(v.Name) then
												local cam = workspace.CurrentCamera
												local Pos,OnScreen = cam:WorldToViewportPoint(v.HitBox.Position)
												if OnScreen then

													ESP.Visible = true
													ESP.Position = Vector2.new(Pos.X,Pos.Y)
												else

													ESP.Visible = false
												end
											else
												ESP.Visible = false
											end
										else
											ESP.Visible = false
										end
									else
										ESP.Visible = false
									end
								end)
							end)
						end
					end
				end

			end
		end
	end)




	-- Location ESP 


	local Locations = {
		["Power_Station"] = {
			["Position"] = Vector3.new(-281.6848449707031, 21.50823974609375, -212.7472686767578),
			["hasESP"] = false,
		},
		["Safe_House"] = {
			["Position"] = Vector3.new(-363.491, 16.8744, 70.3037),
			["hasESP"] = false,
		},
		["Base_Camp"] = {
			["Position"] = Vector3.new(-70.7132568359375, 17.61418914794922, 209.00674438476562),
			["hasESP"] = false,
		},
		["Shop"] = {
			["Position"] = Vector3.new(-25.1567, 17.2076, -258.362),
			["hasESP"] = false
		}
	}

	ClientTab:CreateToggle({
		Name = "Location ESP",
		CurrentValue = false,
		Flag = "LocationESP",
		Callback = function(state)
			_G.LocationESP = state
			if _G.LocationESP == false then
				for i,v in pairs(Locations) do
					if v.hasESP == true then
						v.hasESP = false
					end
				end
			end
		end,
	})

	game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
		if AllowRunService == true then
			if _G.LocationESP == true then
				for i,v in pairs(Locations) do
					if v.hasESP == true then

					else
						v.hasESP = true
						local ESP = Drawing.new("Text")
						ESP.Size = 12
						ESP.Color = Color3.fromRGB(255, 136, 0)
						ESP.Font = 2
						ESP.Text = tostring(i)
						ESP.Visible = true
						ESP.Center = true
						ESP.Outline = false
						game:GetService("RunService").Heartbeat:Connect(function()
							if AllowRunService == true then
								if _G.LocationESP == true then
									local cam = workspace.CurrentCamera
									local Pos,OnScreen = cam:WorldToViewportPoint(v.Position)
									if OnScreen then
										ESP.Visible = true
										ESP.Text = "[LOCATION] "..tostring(i)
										ESP.Position = Vector2.new(Pos.X,Pos.Y)
									else
										ESP.Visible = false
									end
								else
									ESP.Visible = false
								end
							else
								ESP.Visible = false
							end
						end)
					end
				end 
			end
		end
	end)

	-- Scrap ESP

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.ScrapESP == true then
				for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
					if v.Name == "Scrap" then
						if v:GetAttribute("ScrapESP") == true then
						else
							v:SetAttribute("ScrapESP",true)
							local ScrapESP = Drawing.new("Text")
							ScrapESP.Center = true
							ScrapESP.Outline = false
							ScrapESP.Color = Color3.fromRGB(77, 35, 1)
							ScrapESP.Size = 12
							ScrapESP.Font = 2
							ScrapESP.Text = "Scrap"..", Points "..tostring(v.Parent.PointsVal.Value)..", Level "..tostring(v.Parent.LevelVal.Value)
							ScrapESP.Visible = false
							game:GetService("RunService").Heartbeat:Connect(function()
								if AllowRunService == true then
									if v.Parent == nil then
										ScrapESP.Visible = false
									else
										local cam = workspace.CurrentCamera
										local Vec3,OnScreen = cam:WorldToViewportPoint(v.Position)

										if OnScreen then
											if _G.ScrapESP == true then
												ScrapESP.Visible = true
												ScrapESP.Position = Vector2.new(Vec3.X,Vec3.Y)
											else
												ScrapESP.Visible = false
											end
										else
											ScrapESP.Visible = false
										end
									end
								else
									ScrapESP.Visible = false
								end
							end)
						end
					end
				end
				for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
					if v.Name == "Scrap" then
						if v:FindFirstChild("ScrapChams") then
							v.ScrapChams.Enabled = true
						else
							local ScrapChams = Instance.new("Highlight")
							ScrapChams.Parent = v
							ScrapChams.Adornee = v
							ScrapChams.FillColor = Color3.fromRGB(77, 35, 1)
							ScrapChams.FillTransparency = 0
							ScrapChams.OutlineTransparency = 0
							ScrapChams.OutlineColor = Color3.fromRGB(170,170,170)
							ScrapChams.Name = "ScrapChams"
						end
					end
				end
			end
		end
	end)

	ClientTab:CreateToggle({
		Name = "Scrap ESP",
		CurrentValue = false,
		Flag = "ScrapESP",
		Callback = function(state)
			_G.ScrapESP = state
			if _G.ScrapESP == true then
				repeat task.wait(0.1)

				until _G.ScrapESP == false
				for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
					pcall(function()
						if v.Name == "ScrapChams" then
							v:Destroy()
						end                        
						if v:GetAttribute("ScrapESP") == true then
							v:SetAttribute("ScrapESP",false)
						end
					end)
				end
			elseif _G.ScrapESP == false then
				for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
					pcall(function()
						if v.Name == "ScrapChams" then
							v:Destroy()
							v:SetAttribute("ScrapESP",false)
						end
					end)
				end
				for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
					pcall(function()
						if v:GetAttribute("ScrapESP") == true then
							v:SetAttribute("ScrapESP",false)
						end
					end)
				end
			end
		end,
	})

	ExploitsTab:CreateButton({
		Name = "Remove Invis Walls",
		Callback = function()
			for i,v in pairs(game:GetService("Workspace").Filter.InvisibleWalls:GetChildren()) do
				if v.Name:lower() == "invisiblewall" or v.Name:lower() == "invis" then
					v:Destroy()
				end
			end
		end,
	})

	ExploitsTab:CreateToggle({
		Name = "Hide",
		CurrentValue = false,
		Flag = "Hide",
		Callback = function(state)
			if state == true then
				if GET_HRP() ~= nil then
					GET_HRP().Anchored = false
					for i = 1,10 do
						local lastY = GET_HRP().Position.Y

						GET_HRP().CFrame = CFrame.new(GET_HRP().Position) + Vector3.new(0,5,0)
						wait()
						GET_HRP().CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) + Vector3.new(0,-5,0)
					end
					GET_HRP().CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) + Vector3.new(0,-15,0)
					wait()
					GET_HRP().Anchored = true
					HidePart.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,-505,0)
					HidePartHightLight.Adornee = HidePart	
					HidePartHightLight.Parent = HidePart	
				end
			elseif state == false then
				if GET_HRP() ~= nil then
					GET_HRP().Anchored = false
					for i = 1,10 do
						local lastY = GET_HRP().Position.Y

						GET_HRP().CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) + Vector3.new(0,5,0)
						wait()
						GET_HRP().CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) + Vector3.new(0,-5,0)
					end
					GET_HRP().CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) + Vector3.new(0,15,0)
					wait()

					GET_HRP().Anchored = false
					HidePartHightLight.Adornee = nil	
					HidePartHightLight.Parent = nil		 
				end	
			end
		end,
	})

	PlayerTab:CreateToggle({
		Name = "No Fall Damage",
		CurrentValue = false,
		Flag = "NoFallDamage",
		Callback = function(state)
			_G.NoFallDMG = state
		end,
	})

	PlayerTab:CreateSlider({
		Name = "Field Of View",
		Range = {0, 120},
		Increment = 1,
		CurrentValue = 70,
		Flag = "FOV",
		Callback = function(state)
			_G.FieldOfView=state
		end,
	})

	PlayerTab:CreateToggle({
		Name = "Toggle FOV",
		CurrentValue = false,
		Flag = "tglFOV",
		Callback = function(state)
			_G.enableFOV = state
		end,
	})
	
	PlayerTab:CreateSlider({
		Name = "WalkSpeed",
		Range = {0, 30},
		Increment = 1,
		CurrentValue = 16,
		Flag = "walkspeed",
		Callback = function(state)
			_G.WalkSpeedd=state
		end,
	})

	PlayerTab:CreateToggle({
		Name = "Toggle WalkSpeed",
		CurrentValue = false,
		Flag = "tglSpeed",
		Callback = function(state)
			_G.enableSpeed = state
		end,
	})

	-- no fall damage hook

	local mt = getrawmetatable(game)
	local namecall = mt.__namecall
	setreadonly(mt, false)

	mt.__namecall = function(self,...)
		if _G.NoFallDMG == true then
			local args = {...}
			local method = getnamecallmethod()

			if tostring(self) == "FD_Event" then
				args[1] = 0
				args[2] = 0
				return self.FireServer(self,unpack(args))
			end 
		end
		return namecall(self,...)
	end

	ExploitsTab:CreateToggle({
		Name = "Insta Open SupplyDrop",
		CurrentValue = false,
		Flag = "InstaOpenSupplyDrop",
		Callback = function(state)
			_G.InstaOpenSupplyDrop = state
		end,
	})

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if _G.InstaOpenSupplyDrop == true then
				pcall(function()
					for i,v in pairs(game:GetService("Workspace").Debris.SupplyCrates.Box.GUIPart.ProximityPrompt:GetAttributes()) do


						game:GetService("Workspace").Debris.SupplyCrates.Box.GUIPart.ProximityPrompt:SetAttribute(tostring(i),false)

					end
					game:GetService("Workspace").Debris.SupplyCrates.Box.UnlockValue.Value = 100
				end)
			end
		end
	end)

	game:GetService("RunService").RenderStepped:Connect(function()
		if AllowRunService then
			if _G.enableFOV == true then
				local num = _G.FieldOfView
				local hh=game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(0, Enum.EasingStyle.Linear), {FieldOfView=tonumber(num)})
				hh:Play()
			end
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		if AllowRunService then
			local spedyy = _G.WalkSpeedd
			if _G.enableSpeed == true and getHum() then
				getHum().WalkSpeed = tonumber(spedyy)
			end
		end
	end)

	function DestroyUI()
		AllowRunService = false
		FreeCamPart:Destroy()
		for i,v in pairs(game:GetService("Workspace").Filter.ScrapSpawns:GetDescendants()) do
			pcall(function()
				if v:GetAttribute("ScrapESP") == true then
					v:SetAttribute("ScrapESP",false)
				end
			end)
		end
		HidePart:Destroy()
		getgenv().RakeGui=false
		Rayfield:Destroy()
	end

	local RakeTargetCounter = ExploitsTab:CreateLabel("Rake's Target : ")
	local TimeUntilDayCounter = ExploitsTab:CreateLabel("Time Until Day : ")

	-- update time until day label

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if game:GetService("ReplicatedStorage").Night.Value == true then
				TimeUntilDayCounter:Set("Time Until Day : "..game:GetService("ReplicatedStorage").Timer.Value)
			end
			if game:GetService("ReplicatedStorage").Night.Value == false then
				TimeUntilDayCounter:Set("Time Until Night : "..game:GetService("ReplicatedStorage").Timer.Value)
			end
		end
	end)

	-- update rakes targetlabel


	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			pcall(function()
				if game:GetService("Workspace"):FindFirstChild("Rake") then
					if not game:GetService("Workspace").Rake:FindFirstChild("TargetVal") or game:GetService("Workspace").Rake.TargetVal.Value == nil then

					else
						pcall(function()
							RakeTargetCounter:Set("Rake's Target : "..tostring(game:GetService("Workspace").Rake.TargetVal.Value.Parent))
						end)
					end

				end
			end)
		end
	end)


	-- alert if blood hour

	game:GetService("RunService").Heartbeat:Connect(function()
		if AllowRunService == true then
			if game:GetService("ReplicatedStorage").InitiateBloodHour.Value == true then
				Rayfield:Notify({
					Title = "ALERT",
					Content = "HOLY JESUS BLOOD HOUR IS COMING NOW",
					Duration = 5,
					Image = 4483362458,
				})
				game:GetService("ReplicatedStorage").InitiateBloodHour.Value = false
			end
		end
	end)

	SettingsTab:CreateButton({
		Name = "Unload Gui",
		Callback = function()
			DestroyUI()
		end,
	})



	Rayfield:LoadConfiguration()
end