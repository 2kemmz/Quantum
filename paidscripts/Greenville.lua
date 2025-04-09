local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LuaName = "KeyAuth Lua Example"

StarterGui:SetCore("SendNotification", {
	Title = LuaName,
	Text = "Intializing Authentication...",
	Duration = 5
})

local initialized = false
local sessionid = ""

Name = "Quantum" 
Ownerid = "US88FlTBzn" 
APPVersion = "1.0"

local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion)

if req == "KeyAuth_Invalid" then 
   print(" Error: Application not found.")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Application not found.",
	   Duration = 3
   })

   return false
end

local data = HttpService:JSONDecode(req)

if data.success == true then
   initialized = true
   sessionid = data.sessionid
elseif (data.message == "invalidver") then
   print(" Error: Wrong application version..")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Wrong application version..",
	   Duration = 3
   })

   return false
else
   print(" Error: " .. data.message)
   return false
end

print("\n\n Licensing... \n")
local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=license&key=' .. License ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid)
local data = HttpService:JSONDecode(req)


if data.success == false then 
    StarterGui:SetCore("SendNotification", {
	    Title = LuaName,
	    Text = " Error: " .. data.message,
	    Duration = 5
    })

    return false
end

StarterGui:SetCore("SendNotification", {
	Title = LuaName,
	Text = " Successfully Authorized :)",
	Duration = 5
})

--------------------------------------------------------------------------------------------------------

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
            local Window = Rayfield:CreateWindow({
                Name = "Quantum V3.6 | Greenville",
                Icon = 0, 
                LoadingTitle = "Quantum | Greenville",
                LoadingSubtitle = "by Quantum Team",
                Theme = "DarkBlue", 
            
                DisableRayfieldPrompts = false,
                DisableBuildWarnings = false, 
            
                ConfigurationSaving = {
                   Enabled = false,
                   FolderName = nil, 
                   FileName = "nil"
                },
            
            })
            
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Quantum",
                Text = "Welcome to Quantum | Greenville",
                Duration = 2
            })
            
            local HomeTab = Window:CreateTab("Home")
            local PlayerTab = Window:CreateTab("User")
            local VehicleTab = Window:CreateTab("Vehicle")
            local ContentTab = Window:CreateTab("Content")
            local GriefTab = Window:CreateTab("Grief")
            local AutofarmTab = Window:CreateTab("Autofarm")
             
            HomeTab:CreateDivider()
            HomeTab:CreateLabel("If you spot any problems DM 2kemmz or Jake.")
            
            local labelTexts = {
                "Uh Hello?",
                "Welcome back!",
                "Good to see you!",
                "Theres no party like a diddy party!",
                "Enjoy your stay!",
                "What you doing here?",
                "Smeers gives free blowjobs!",
                "Polobaba masturbates to furrys!"
            }
            
            local function getRandomLabelText()
                local index = math.random(1, #labelTexts)  
                return labelTexts[index]
            end
            
            HomeTab:CreateLabel(getRandomLabelText())
            
            HomeTab:CreateDivider()
            HomeTab:CreateLabel("Thank you for using Quantum!", "thumbs-up")
            HomeTab:CreateLabel("Per 5 invites, you get a 12hr key! (They have got to join for atleast an hour)", "key")
            HomeTab:CreateLabel("Can't believe we have got this far!", "heart")
            
            
            ---------------------------------------------------------------
            
            VehicleTab:CreateDivider()
            VehicleTab:CreateSection("Teleport")
            
            VehicleTab:CreateButton({
                Name = "Teleport to My Car",
                Callback = function()
                   local Players = game:GetService("Players")
                   local LocalPlayer = Players.LocalPlayer
                   local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                   local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
             
                   local carName = LocalPlayer.Name .. "-Car"
                   local car = workspace:FindFirstChild("SessionVehicles") and workspace.SessionVehicles:FindFirstChild(carName)
             
                   if car and car:IsA("Model") then
                      local primaryPart = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
                      if primaryPart then
                         HumanoidRootPart.CFrame = primaryPart.CFrame + Vector3.new(0, 5, 0) 
                         Rayfield:Notify({
                            Title = "Teleport Successful",
                            Content = "You have been teleported to your car.",
                            Duration = 3,
                         })
                      else
                         Rayfield:Notify({
                            Title = "Error",
                            Content = "Could not find your car!",
                            Duration = 3,
                         })
                      end
                   else
                      Rayfield:Notify({
                         Title = "Car Not Found",
                         Content = "Your car does not exist!",
                         Duration = 3,
                      })
                   end
                end
             })
            
            VehicleTab:CreateButton({
                Name = "Bring My Car To Me",
                Callback = function()
                   local Players = game:GetService("Players")
                   local LocalPlayer = Players.LocalPlayer
                   local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                   local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
             
                   local carName = LocalPlayer.Name .. "-Car"
                   local car = workspace:FindFirstChild("SessionVehicles") and workspace.SessionVehicles:FindFirstChild(carName)
             
                   if car and car:IsA("Model") then
                      local primaryPart = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
                      if primaryPart then
                         if not car.PrimaryPart then
                            car.PrimaryPart = primaryPart
                         end
             
                         car:SetPrimaryPartCFrame(HumanoidRootPart.CFrame + Vector3.new(0, 5, 10))
                         Rayfield:Notify({
                            Title = "Success",
                            Content = "Your car has been brought to you.",
                            Duration = 3,
                         })
                      else
                         Rayfield:Notify({
                            Title = "Error",
                            Content = "Could not find your car!",
                            Duration = 3,
                         })
                      end
                   else
                      Rayfield:Notify({
                         Title = "Car Not Found",
                         Content = "Your car does not exist!",
                         Duration = 3,
                      })
                   end
                end
             })
            
             VehicleTab:CreateButton({
                Name = "Enter Car",
                Callback = function()
                   local Players = game:GetService("Players")
                   local RunService = game:GetService("RunService")
                   local VirtualInputManager = game:GetService("VirtualInputManager")
                   local LocalPlayer = Players.LocalPlayer
                   local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                   local HRP = Character:WaitForChild("HumanoidRootPart")
             
                   local carName = LocalPlayer.Name .. "-Car"
                   local car = workspace:FindFirstChild("SessionVehicles") and workspace.SessionVehicles:FindFirstChild(carName)
             
                   if not car or not car:IsA("Model") then
                      Rayfield:Notify({
                         Title = "Car Not Found",
                         Content = "Couldn't find your car.",
                         Duration = 3
                      })
                      return
                   end
             
                   local primaryPart = car.PrimaryPart or car:FindFirstChildWhichIsA("BasePart")
                   if not primaryPart then
                      Rayfield:Notify({
                         Title = "Car Not Found",
                         Content = "Couldn't find your car.",
                         Duration = 3
                      })
                      return
                   end
             
                   HRP.CFrame = primaryPart.CFrame + Vector3.new(0, 5, 0)
             
                   Rayfield:Notify({
                      Title = "Entered Car",
                      Content = "You may now use your car.",
                      Duration = 3
                   })
             
                   local closeTimer = 0
                   local isDone = false
                   local thresholdDistance = 10
                   local requiredTime = 1
             
                   local connection
                   connection = RunService.Heartbeat:Connect(function(dt)
                      if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
             
                      local dist = (HRP.Position - primaryPart.Position).Magnitude
                      if dist < thresholdDistance then
                         closeTimer += dt
                         if closeTimer >= requiredTime then
                            isDone = true
                            connection:Disconnect()
                         end
                      else
                         closeTimer = 0
                      end
                   end)
             
                   task.spawn(function()
                      while not isDone do
                         VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                         task.wait(0.05)
                         VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                         task.wait(0.05)
                      end
                   end)
                end
             })
            
            VehicleTab:CreateSection("Vehicle Maintainence")
            
            local rs = game:GetService("ReplicatedStorage")
            VehicleTab:CreateButton({
                Name = "Refuel",
                Callback = function()
                    rs.Remote.Refuel:FireServer(1, os.time())
                end
            })
            
            local rs = game:GetService("ReplicatedStorage")
            local autoFuel = false
            local autoFuelConnection
            VehicleTab:CreateToggle({
                Name = "Auto Fuel",
                Default = false,
                Callback = function(state)
                    autoFuel = state
                    if autoFuel then
                        autoFuelConnection = task.spawn(function()
                            while autoFuel do
                                rs.Remote.Refuel:FireServer(1, os.time())
                                task.wait(25)
                            end
                        end)
                    else
                        autoFuel = false
                    end
                end
            })
            
            local rs = game:GetService("ReplicatedStorage")
            local autoFuel = false
            local autoFuelConnection
            VehicleTab:CreateToggle({
                Name = "Auto Fuel (Autofarm)",
                Default = false,
                Callback = function(state)
                    autoFuel = state
                    if autoFuel then
                        autoFuelConnection = task.spawn(function()
                            while autoFuel do
                                rs.Remote.Refuel:FireServer(1, os.time())
                                task.wait(300)
                            end
                        end)
                    else
                        autoFuel = false
                    end
                end
            })
            
            local rs = game:GetService("ReplicatedStorage")
            local autoFuel = false
            local autoFuelConnection
            VehicleTab:CreateToggle({
                Name = "Auto Fuel INF (Takes more money)",
                Default = false,
                Callback = function(state)
                    autoFuel = state
                    if autoFuel then
                        autoFuelConnection = task.spawn(function()
                            while autoFuel do
                                rs.Remote.Refuel:FireServer(1, os.time())
                                task.wait(3)
                            end
                        end)
                    else
                        autoFuel = false
                    end
                end
            })
            
            VehicleTab:CreateSection("Fun Stuff")
            
            local isWheelieEnabled = false
            local isStoppieEnabled = false
            local isArabTiltLeftEnabled = false
            local isArabTiltRightEnabled = false
            local isTurningEnabled = false
            local isPivotTurningEnabled = false
            local bodyGyro = nil
            local bodyGyroTurn = nil
            local moveSpeed = 0.5
            local flingRadius = 100  
            local frontAngle = 15 
            local sideAngle = 30  
            
            local function getNearestCar()
                local player = game.Players.LocalPlayer
                if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    return nil
                end
            
                local rootPos = player.Character.HumanoidRootPart.Position
                local nearestCar = nil
                local shortestDistance = math.huge
            
                for _, car in pairs(workspace.SessionVehicles:GetChildren()) do
                    if car:IsA("Model") and car.PrimaryPart then
                        local carPosition = car.PrimaryPart.Position
                        local distance = (carPosition - rootPos).Magnitude
            
                        if distance <= flingRadius then
                            if distance < shortestDistance then
                                nearestCar = car
                                shortestDistance = distance
                            end
                        end
                    end
                end
            
                return nearestCar
            end
            
            local function handleTurning(car)
                local userInputService = game:GetService("UserInputService")
                local movingLeft = false
                local movingRight = false
            
                userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
                    if gameProcessedEvent then return end
                    
                    if isTurningEnabled then
                        if input.KeyCode == Enum.KeyCode.A then
                            movingLeft = true
                        elseif input.KeyCode == Enum.KeyCode.D then
                            movingRight = true
                        end
                    end
                end)
            
                userInputService.InputEnded:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode.A then
                        movingLeft = false
                    elseif input.KeyCode == Enum.KeyCode.D then
                        movingRight = false
                    end
                end)
            
                game:GetService("RunService").Heartbeat:Connect(function()
                    if movingLeft then
                        car:SetPrimaryPartCFrame(car.PrimaryPart.CFrame * CFrame.new(-moveSpeed, 0, 0))
                    elseif movingRight then
                        car:SetPrimaryPartCFrame(car.PrimaryPart.CFrame * CFrame.new(moveSpeed, 0, 0))
                    end
                end)
            end
            
            local function handlePivotTurning(car)
                local userInputService = game:GetService("UserInputService")
                local movingLeft = false
                local movingRight = false
            
                userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
                    if gameProcessedEvent then return end
                    
                    if isPivotTurningEnabled then
                        if input.KeyCode == Enum.KeyCode.D then
                            movingLeft = true
                        elseif input.KeyCode == Enum.KeyCode.A then
                            movingRight = true
                        end
                    end
                end)
            
                userInputService.InputEnded:Connect(function(input)
                    if input.KeyCode == Enum.KeyCode.D then
                        movingLeft = false
                    elseif input.KeyCode == Enum.KeyCode.A then
                        movingRight = false
                    end
                end)
            
                game:GetService("RunService").Heartbeat:Connect(function()
                    if movingLeft then
                        car:SetPrimaryPartCFrame(car.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-moveSpeed), 0))
                    elseif movingRight then
                        car:SetPrimaryPartCFrame(car.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(moveSpeed), 0))
                    end
                end)
            end
            
            VehicleTab:CreateToggle({
                Name = "Enable Wheelie", 
                Default = false, 
                Callback = function(state)
                    isWheelieEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isWheelieEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(math.rad(15), 0, 0)  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Stoppie", 
                Default = false, 
                Callback = function(state)
                    isStoppieEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isStoppieEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(math.rad(-15), 0, 0)  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateDivider()
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Right", 
                Default = false, 
                Callback = function(state)
                    isArabTiltLeftEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltLeftEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(-45))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Right 1", 
                Default = false, 
                Callback = function(state)
                    isArabTiltLeftEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltLeftEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(-58))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Right 2", 
                Default = false, 
                Callback = function(state)
                    isArabTiltLeftEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltLeftEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(-73))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateDivider()
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Left", 
                Default = false, 
                Callback = function(state)
                    isArabTiltRightEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltRightEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(45))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Left 1", 
                Default = false, 
                Callback = function(state)
                    isArabTiltRightEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltRightEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(58))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Arab Tilt Left 2", 
                Default = false, 
                Callback = function(state)
                    isArabTiltRightEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isArabTiltRightEnabled then
                            if not bodyGyro then
                                bodyGyro = Instance.new("BodyGyro")
                                bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                                bodyGyro.CFrame = car.PrimaryPart.CFrame * CFrame.Angles(0, 0, math.rad(73))  
                                bodyGyro.Parent = car.PrimaryPart
                            end
                        else
                            if bodyGyro then
                                bodyGyro:Destroy()
                                bodyGyro = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateDivider()
            
            VehicleTab:CreateToggle({
                Name = "Enable Left/Right Turning", 
                Default = false, 
                Callback = function(state)
                    isTurningEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isTurningEnabled then
                            handleTurning(car)
                        else
                            if bodyGyroTurn then
                                bodyGyroTurn:Destroy()
                                bodyGyroTurn = nil
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Pivot Turning", 
                Default = false, 
                Callback = function(state)
                    isPivotTurningEnabled = state
                    local car = getNearestCar()
                    if car then
                        if isPivotTurningEnabled then
                            handlePivotTurning(car)
                        else
                            if bodyGyroTurn then
                                bodyGyroTurn:Destroy()
                                bodyGyroTurn = nil
                            end
                        end
                    end
                end
            })
            
            --
            
            VehicleTab:CreateSection("Hijack")
            
            VehicleTab:CreateButton({ 
                Name = "Inject Car Connection",
                Callback = function()
                    local nearestCar = nil
                    local shortestDistance = math.huge
                    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local hrp = character and character:FindFirstChild("HumanoidRootPart")
            
                    if hrp then
                        for _, car in pairs(workspace:WaitForChild("SessionVehicles"):GetChildren()) do
                            if car:IsA("Model") and car.PrimaryPart and car.Name:find("-Car") then
                                local distance = (car.PrimaryPart.Position - hrp.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestCar = car
                                end
                            end
                        end
                    end
            
                    if nearestCar then
                        local usernameFromCar = nearestCar.Name:match("^(.*)%-Car$")
                        if usernameFromCar then
                            trackedCarUsername = usernameFromCar
                            Rayfield:Notify({
                                Title = "Injection Successful",
                                Content = "Connected to nearest car owned by: " .. trackedCarUsername,
                                Duration = 3
                            })
                        else
                            Rayfield:Notify({
                                Title = "Injection Failed",
                                Content = "Couldn't determine the owner of the nearest car.",
                                Duration = 3
                            })
                        end
                    else
                        Rayfield:Notify({
                            Title = "Injection Failed",
                            Content = "No valid car found nearby.",
                            Duration = 3
                        })
                    end
                end
            })
            
            VehicleTab:CreateButton({
                Name = "Hijack Car",
                Callback = function()
                    if not trackedCarUsername then
                        Rayfield:Notify({
                            Title = "Hijack Failed",
                            Content = "No injected car found. Please inject a car first.",
                            Duration = 3
                        })
                        return
                    end
            
                    local carName = trackedCarUsername .. "-Car"
                    local car = workspace:FindFirstChild("SessionVehicles") and workspace.SessionVehicles:FindFirstChild(carName)
            
                    if not car then
                        Rayfield:Notify({
                            Title = "Hijack Failed",
                            Content = "Injected car '" .. carName .. "' not found.",
                            Duration = 3
                        })
                        return
                    end
            
                    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
            
                    if not (hrp and humanoid) then
                        Rayfield:Notify({
                            Title = "Hijack Failed",
                            Content = "Character or HumanoidRootPart not found.",
                            Duration = 3
                        })
                        return
                    end
            
                    local closestSeat = nil
                    local shortestDistance = math.huge
            
                    for _, part in pairs(car:GetDescendants()) do
                        if part:IsA("Seat") or part:IsA("VehicleSeat") then
                            local distance = (part.Position - hrp.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestSeat = part
                            end
                        end
                    end
            
                    if closestSeat then
                        humanoid.Sit = false
                        task.wait(0.1)
                        closestSeat:Sit(humanoid)
            
                        Rayfield:Notify({
                            Title = "Hijack Successful",
                            Content = "You are now seated in: " .. closestSeat.Name,
                            Duration = 3
                        })
                    else
                        Rayfield:Notify({
                            Title = "Hijack Failed",
                            Content = "No seats found in the injected car.",
                            Duration = 3
                        })
                    end
                end
            })
            
            VehicleTab:CreateButton({
                Name = "Instructions",
                Callback = function()
                    Rayfield:Notify({
                        Title = "Instructions",
                        Content = "Click inject near the car you wanna steal then stand where the drivers seat is and click Hijack.",
                        Duration = 6
                    })
                end
            })
            
            VehicleTab:CreateSection("Extras")
            
            local easyflipping = false
            VehicleTab:CreateToggle({
                Name = "Easy Flipping",
                CurrentValue = easyflipping,
                Callback = function(Value)
                    easyflipping = Value
                    local player = game.Players.LocalPlayer
                    local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                    if not PlayerCar then return end
            
                    local Wheels = PlayerCar:FindFirstChild("Wheels")
                    if Wheels then
                        for _, wheel in ipairs(Wheels:GetChildren()) do
                            local props = wheel.CustomPhysicalProperties
                            if props then
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 2 or 0.5, 
                                    props.Elasticity,
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
            
                    game.Workspace.Gravity = Value and 50 or 200
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Lock Inplace",
                Callback = function(Value)
                    local player = game.Players.LocalPlayer
                    local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                    if not PlayerCar then return end
            
                    if Value then
                        for _, part in ipairs(PlayerCar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = true
                            end
                        end
                    else
                        for _, part in ipairs(PlayerCar:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.Anchored = false
                            end
                        end
                    end
                end
            })
            
            local Sound = Instance.new("Sound")
            Sound.Parent = game:GetService("SoundService") 
            Sound.Volume = 1
            Sound.Looped = false 
            
            VehicleTab:CreateToggle({
                Name = "Wipers (Not movable)",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://1064907409" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            VehicleTab:CreateSection("Drift")
            
            local gravityEnabled = false
            local function getNearestCar()
                local player = game.Players.LocalPlayer
                local nearestCar = nil
                local shortestDistance = math.huge  
                
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    if car.PrimaryPart then
                        local distance = (car.PrimaryPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestCar = car
                        end
                    end
                end
                
                return nearestCar
            end
            
            VehicleTab:CreateToggle({
                Name = "Gravity Toggle",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    game.Workspace.Gravity = Value and 40 or 200
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Higher Grip",
                CurrentValue = false,
                Flag = "ToggleHigherGrip",
                Callback = function(Value)
                    local nearestCar = getNearestCar() 
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 2 or 0.5,
                                    props.Elasticity,
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Higher Grip MAX",
                CurrentValue = false,
                Flag = "ToggleHigherGripMax",
                Callback = function(Value)
                    local nearestCar = getNearestCar()  
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 9999 or 0.5,
                                    props.Elasticity,
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Hajwala Mode",
                CurrentValue = false,
                Flag = "ToggleHajwalaMode",
                Callback = function(Value)
                    local nearestCar = getNearestCar()  
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 0.2 or 2,
                                    Value and 2 or props.Elasticity,
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
            
                    gravityEnabled = Value
                    game.Workspace.Gravity = Value and 40 or 200
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Low Grip",
                CurrentValue = false,
                Flag = "ToggleLowGrip",
                Callback = function(Value)
                    local nearestCar = getNearestCar()  
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 0.2 or 2, 
                                    Value and 2.5 or props.Elasticity,  
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "RWD Perfection :)",
                CurrentValue = false,
                Flag = "TogglePerfectionGrip",
                Callback = function(Value)
                    local nearestCar = getNearestCar()  
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value and 0.17 or 1, 
                                    Value and 5 or props.Elasticity,  
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
                end
            })
            
            local customGripEnabled = false
            
            VehicleTab:CreateToggle({
                Name = "Enable Custom Grip",
                CurrentValue = customGripEnabled,
                Flag = "ToggleCustomGrip",
                Callback = function(Value)
                    customGripEnabled = Value
                    local nearestCar = getNearestCar()
                    if not Value and nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    1, -- default friction
                                    1, -- default grip
                                    0.5,
                                    100,
                                    1
                                )
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateSlider({
                Name = "Custom Grip",
                Range = {0.1, 5},
                Increment = 0.05,
                Suffix = "Grip",
                CurrentValue = 1,
                Flag = "CustomGripSlider",
                Callback = function(Value)
                    if not customGripEnabled then return end
                    local nearestCar = getNearestCar()
                    if nearestCar then
                        local Wheels = nearestCar:FindFirstChild("Wheels")
                        if Wheels then
                            for _, wheel in ipairs(Wheels:GetChildren()) do
                                local props = wheel.CustomPhysicalProperties
                                wheel.CustomPhysicalProperties = PhysicalProperties.new(
                                    props.Density,
                                    Value,
                                    props.Elasticity,
                                    100,
                                    props.ElasticityWeight
                                )
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateDivider()
            
            
            
            VehicleTab:CreateSection("Car Jump")
            
            local flingPower = 10
            local flingEnabled = false
            local jumpKey = nil
            
            local function getNearestCar()
                local player = game.Players.LocalPlayer
                local nearestCar = nil
                local shortestDistance = math.huge 
                
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    if car.PrimaryPart then
                        local distance = (car.PrimaryPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestCar = car
                        end
                    end
                end
                
                return nearestCar
            end
            
            VehicleTab:CreateSlider({
                Name = "Jump Power",
                Range = {10, 300},
                Increment = 10,
                Suffix = "Force",
                CurrentValue = 100,
                Flag = "FlingPowerValue",
                Callback = function(Value)
                    flingPower = Value
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Jump",
                Default = false,
                Callback = function(Value)
                    flingEnabled = Value
                    Rayfield:Notify({
                        Title = "Fling Status",
                        Content = flingEnabled and "Jump Enabled! Press your assigned key." or "Jump Disabled!",
                        Duration = 3,
                    })
                end
            })
            
            VehicleTab:CreateInput({
                Name = "Jump Key",
                PlaceholderText = "Enter a key (e.g, G)",
                RemoveTextAfterFocusLost = false,
                Callback = function(Value)
                    local keyEnum = Enum.KeyCode[Value:upper()]
                    if keyEnum then
                        jumpKey = keyEnum
                        Rayfield:Notify({
                            Title = "Key Set",
                            Content = "Jump key set to: " .. Value:upper(),
                            Duration = 3,
                        })
                    else
                        Rayfield:Notify({
                            Title = "Invalid Key",
                            Content = "Please enter a valid key name!",
                            Duration = 3,
                        })
                    end
                end
            })
            
            local UIS = game:GetService("UserInputService")
            UIS.InputBegan:Connect(function(input, gameProcessed)
                if jumpKey and input.KeyCode == jumpKey and flingEnabled then
                    local car = getNearestCar()  
                    if car and car.PrimaryPart then
                        local carFling = Instance.new("BodyVelocity")
                        carFling.Velocity = Vector3.new(0, flingPower, 0) 
                        carFling.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        carFling.Parent = car.PrimaryPart
                        task.wait(0.3)
                        carFling:Destroy()
                    end
                end
            end)
            
            VehicleTab:CreateButton({
                Name = "Fling Car Max (Escape Police)",
                Callback = function()
                    local car = getNearestCar()  
                    if car and car.PrimaryPart then
                        local carFling = Instance.new("BodyVelocity")
                        carFling.Velocity = Vector3.new(0, 500, 0) 
                        carFling.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        carFling.Parent = car.PrimaryPart
                        task.wait(0.3)
                        carFling:Destroy()
                    end
                end
            })
            
            VehicleTab:CreateSection("Suspension")
            
            VehicleTab:CreateToggle({
                Name = "Maybach Bounce",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    
                    if gravityEnabled and not isLooping then
                        isLooping = true
                        task.spawn(function() 
                            while gravityEnabled do
                                game.Workspace.Gravity = 320
                                wait(0.28)  
                                game.Workspace.Gravity = 200
                                wait(0.28)
                            end
                            isLooping = false 
                        end)
                    else
                        game.Workspace.Gravity = 200 
                        isLooping = false 
                    end
                end
            })
            
            local gravityEnabled = false
            VehicleTab:CreateToggle({
                Name = "Riding Low Mode",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    if gravityEnabled then
                        game.Workspace.Gravity = 1000
                    else
                        game.Workspace.Gravity = 200
                    end
                end
            })
            
            local gravityEnabled = false
            VehicleTab:CreateToggle({
                Name = "Street Mode",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    if gravityEnabled then
                        game.Workspace.Gravity = 500
                    else
                        game.Workspace.Gravity = 200
                    end
                end
            })
            
            local gravityEnabled = false
            VehicleTab:CreateToggle({
                Name = "Offroad Mode",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    if gravityEnabled then
                        game.Workspace.Gravity = 100
                    else
                        game.Workspace.Gravity = 200
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Goofy Wheels",
                CurrentValue = false,
                Flag = "ToggleGoofyWheels",
                Callback = function(Value)
                    GoofyWheels = Value
                    local player = game.Players.LocalPlayer
                    local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                    local Wheels = PlayerCar:FindFirstChild("Wheels")
                    for _, wheel in ipairs(Wheels:GetChildren()) do
                        print(wheel.Name)
                        local spring = wheel:FindFirstChild("Spring")
                        if spring then
                            if GoofyWheels then
                                spring.MinLength = 5
                                spring.MaxLength = 15
                            else
                                spring.MinLength = 0
                                spring.MaxLength = 0
                            end
                        end
                    end
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Reset",
                CurrentValue = gravityEnabled,
                Callback = function(Value)
                    gravityEnabled = Value
                    if gravityEnabled then
                        game.Workspace.Gravity = 200
                    else
                        game.Workspace.Gravity = 200
                    end
                end
            })
            
            ---------------------------------------------------------------
            
            ContentTab:CreateSection("Dashcam")
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local camera = workspace.CurrentCamera
            local activeView = nil
            local showInfo = false
            local displayUsername = player.Name
            local trackedCarUsername = player.Name
            local speedUnit = "MPH/KMH"
            
            local plateOffset = Vector3.new(1, 1.5, -4)
            local dashcamOffset = Vector3.new(0, 1.5, 4)
            
            local infoGui = Instance.new("ScreenGui")
            infoGui.Name = "DashcamOverlay"
            infoGui.ResetOnSpawn = false
            infoGui.Enabled = false
            infoGui.Parent = player:WaitForChild("PlayerGui")
            
            local function createLabel(size, position, text, fontSize)
                local label = Instance.new("TextLabel")
                label.Size = size
                label.Position = position
                label.BackgroundTransparency = 1
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.Font = Enum.Font.Code
                label.TextSize = fontSize
                label.TextStrokeTransparency = 0.4
                label.TextStrokeColor3 = Color3.new(0, 0, 0)
                label.Text = text
                label.TextXAlignment = Enum.TextXAlignment.Center
                label.TextYAlignment = Enum.TextYAlignment.Center
                label.Parent = infoGui
                return label
            end
            
            local dateTimeLabelLeft = createLabel(UDim2.new(0.30, 0, 0, 40), UDim2.new(0.01, 0, 1, -50), "", 30)
            local speedLabel = createLabel(UDim2.new(0.2, 0, 0, 40), UDim2.new(0.4, 0, 1, -50), "", 30)
            local usernameLabel = createLabel(UDim2.new(0.15, 0, 0, 40), UDim2.new(0.75, 0, 1, -50), "", 30)
            
            local function getLocalTime()
                return os.date("%X")
            end
            
            local function getDate()
                return os.date("%d/%m/%Y")
            end
            
            local function getCarByUsername(username)
                return workspace.SessionVehicles:FindFirstChild(username .. "-Car")
            end
            
            local MPS_TO_MPH = 0.57
            local MPS_TO_KMH = 0.91732608
            local DASHCAM_SCALE_FACTOR = 1
            
            local function updateInfoUI()
                while showInfo do
                    local speed = 0
                    local unit = speedUnit:upper()
                    local car = getCarByUsername(trackedCarUsername)
            
                    if car and car.PrimaryPart then
                        local velocity = car.PrimaryPart.AssemblyLinearVelocity.Magnitude
            
                        if unit == "KMH" then
                            speed = math.floor(velocity * MPS_TO_KMH)
                        elseif unit == "MPH" then
                            speed = math.floor(velocity * MPS_TO_MPH)
                        else
                            speed = math.floor(velocity)
                        end
            
                        speed = math.floor(speed * DASHCAM_SCALE_FACTOR)
                    end
            
                    local gameFormattedTime = getLocalTime()
                    local gameDate = getDate()
                    local paddedSpeed = string.format("%03d", speed)
            
                    dateTimeLabelLeft.Text = gameDate .. " " .. gameFormattedTime
                    speedLabel.Text = string.format("Speed: %s%s", paddedSpeed, unit)
                    usernameLabel.Text = string.format("User: %s", displayUsername)
            
                    dateTimeLabelLeft.Visible = true
                    speedLabel.Visible = true
                    usernameLabel.Visible = true
            
                    task.wait(0.1)
                end
            
                dateTimeLabelLeft.Visible = false
                speedLabel.Visible = false
                usernameLabel.Visible = false
            end
            
            local function toggleCamera(viewName, positionOffset, fov, toggleState)
                if toggleState then
                    if activeView == viewName then return end
                    activeView = viewName
                    camera.CameraType = Enum.CameraType.Scriptable
                    camera.FieldOfView = fov or 70
            
                    task.spawn(function()
                        while activeView == viewName do
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local hrp = character.HumanoidRootPart
                                camera.CFrame = hrp.CFrame * CFrame.new(positionOffset)
                            end
                            task.wait()
                        end
                    end)
            
                    Rayfield:Notify({
                        Title = "Camera View Activated",
                        Content = viewName .. " activated.",
                        Duration = 3
                    })
                else
                    if activeView == viewName then
                        activeView = nil
                        camera.CameraType = Enum.CameraType.Custom
                        camera.FieldOfView = 70
                        Rayfield:Notify({
                            Title = "Camera Disabled",
                            Content = "Reset to default view.",
                            Duration = 3
                        })
                    end
                end
            end
            
            ContentTab:CreateToggle({
                Name = "Dashcam View (1)",
                Default = false,
                Callback = function(toggleState)
                    toggleCamera("1st View", Vector3.new(1, 1.6, -4.2), 100, toggleState)
                end
            })
            
            ContentTab:CreateToggle({
                Name = "Dashcam View (2)",
                Default = false,
                Callback = function(toggleState)
                    toggleCamera("2nd View", Vector3.new(1.65, 1.6, -3.2), 100, toggleState)
                end
            })
            
            ContentTab:CreateToggle({
                Name = "Dashcam View (3)",
                Default = false,
                Callback = function(toggleState)
                    toggleCamera("3rd View", Vector3.new(1, 1.9, -3.7), 100, toggleState)
                end
            })
            
            ContentTab:CreateToggle({
                Name = "Dashcam View (4)",
                Default = false,
                Callback = function(toggleState)
                    toggleCamera("4th View", Vector3.new(0.73, 1.6, -4.7), 100, toggleState)
                end
            })
            
            ContentTab:CreateToggle({
                Name = "Plate View",
                Default = false,
                Callback = function(toggleState)
                    toggleCamera("Plate View", Vector3.new(2, -5, -20), 100, toggleState)
                end
            })
            
            ContentTab:CreateDivider()
            
            ContentTab:CreateToggle({
                Name = "Show Dashcam UI",
                CurrentValue = false,
                Callback = function(value)
                    showInfo = value
                    infoGui.Enabled = value
                    if showInfo then
                        task.spawn(updateInfoUI)
                    end
                end
            })
            
            ContentTab:CreateInput({
                Name = "Set Cover Username",
                PlaceholderText = "Your cover name here",
                RemoveTextAfterFocusLost = true,
                Callback = function(input)
                    displayUsername = input
                    usernameLabel.Text = string.format("User: %s", displayUsername)
                end
            })
            
            ContentTab:CreateInput({
                Name = "Set Speed Unit (MPH/KMH)",
                PlaceholderText = "MPH/KMH",
                RemoveTextAfterFocusLost = true,
                Callback = function(input)
                    local unit = input:upper()
                    if unit == "KMH" or unit == "MPH" then
                        speedUnit = unit
                    end
                end
            })
            
            ContentTab:CreateButton({
                Name = "Inject Car Connection",
                Callback = function()
                    local nearestCar = nil
                    local shortestDistance = math.huge
                    local hrp = character:FindFirstChild("HumanoidRootPart")
            
                    if hrp then
                        for _, car in pairs(workspace.SessionVehicles:GetChildren()) do
                            if car:IsA("Model") and car.PrimaryPart then
                                local distance = (car.PrimaryPart.Position - hrp.Position).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    nearestCar = car
                                end
                            end
                        end
                    end
            
                    if nearestCar and nearestCar.Name:find("-Car") then
                        local usernameFromCar = nearestCar.Name:match("^(.*)%-Car$")
                        if usernameFromCar then
                            trackedCarUsername = usernameFromCar
                            Rayfield:Notify({
                                Title = "Injection Successful",
                                Content = "Connected to nearest car owned by: " .. trackedCarUsername,
                                Duration = 3
                            })
                        else
                            Rayfield:Notify({
                                Title = "Injection Failed",
                                Content = "Couldn't determine the owner of the nearest car.",
                                Duration = 3
                            })
                        end
                    else
                        Rayfield:Notify({
                            Title = "Injection Failed",
                            Content = "No valid car found nearby.",
                            Duration = 3
                        })
                    end
                end
            })
            
            local hiddenGUIs = {}
            local function isRayfieldGui(gui)
                return gui.Name:lower():find("rayfield") or gui:FindFirstChild("Topbar") or gui:FindFirstChild("Container")
            end
            
            ContentTab:CreateToggle({
                Name = "Hide UIs",
                CurrentValue = false,
                Flag = "GuiToggle",
                Callback = function(state)
                    local player = game:GetService("Players").LocalPlayer
                    local playerGui = player:WaitForChild("PlayerGui")
            
                    if state then
                        for _, gui in ipairs(playerGui:GetChildren()) do
                            if gui:IsA("ScreenGui") and gui.Enabled and not isRayfieldGui(gui) then
                                gui.Enabled = false
                                table.insert(hiddenGUIs, gui)
                            end
                        end
                    else
                        for _, gui in ipairs(hiddenGUIs) do
                            if gui and gui.Parent == playerGui then
                                gui.Enabled = true
                            end
                        end
                        hiddenGUIs = {}
                    end
                end
            })
            
            ContentTab:CreateSection("Police")
            
            local detectionEnabled = false
            
            ContentTab:CreateToggle({
                Name = "Enable Detection",
                CurrentValue = false,
                Callback = function(value)
                    detectionEnabled = value
                end
            })
            
            local targetRoles = {"Wisconsin State Patrol", "Outagamie County Sherrif's Office", "Fox Valley Metro Police Department"}  
            local soundId = "rbxassetid://104095298431445" 
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            character:WaitForChild("HumanoidRootPart") 
            local sound = Instance.new("Sound", character.HumanoidRootPart)
            sound.SoundId = soundId
            sound.Looped = false
            sound.Volume = 2
            sound.PlaybackSpeed = 0.95
            
            local detectionRange = 800
            
            ContentTab:CreateSlider({
                Name = "Detection Range",
                Range = {25, 850},
                Increment = 1,
                Suffix = "Studs",
                CurrentValue = 800,
                Flag = "detectionRange",
                Callback = function(value)
                    detectionRange = value
                end
            })
            local function sendNotification(role, distance, username)
                Rayfield:Notify({
                    Title = "Radar Detection",
                    Content = string.format("User: %s\nRole: %s\nStuds Away: %.2f", username, role, distance),
                    Duration = 5,
                    Type = "info"
                })
            end
            
            local function checkProximity()
                while wait(1) do  -- Check every second
                    if not detectionEnabled then
                        sound.Playing = false
                        continue
                    end
            
                    local playerPosition = character.PrimaryPart.Position
                    local found = false
            
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player and otherPlayer.Team and table.find(targetRoles, otherPlayer.Team.Name) then
                            local otherCharacter = otherPlayer.Character
                            if otherCharacter and otherCharacter:FindFirstChild("HumanoidRootPart") then
                                local distance = (otherCharacter.HumanoidRootPart.Position - playerPosition).Magnitude
                                if distance <= detectionRange then 
                                    found = true
                                    sendNotification(otherPlayer.Team.Name, distance, otherPlayer.Name)
                                    break
                                end
                            end
                        end
                    end
            
                    if found then
                        if not sound.IsPlaying then
                            sound:Play()  
                            wait(0.1)  
                        end
                    else
                        sound:Stop()
                    end
                end
            end
            
            task.spawn(checkProximity)
            
            ---
            
            VehicleTab:CreateSection("Speed")
            
            local AccelerationEnabled = false
            local DecelerationEnabled = false
            local speedhaxforce = 1000  
            local brakehaxforce = 1000 
            local accelKey = Enum.KeyCode.W
            local decelKey = Enum.KeyCode.S
            local instantBrakeKey = nil
            local function findNearestCar(player)
                local closestCar = nil
                local closestDistance = math.huge 
            
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    local driveSeat = car:FindFirstChild("DriveSeat")  
                    if driveSeat and driveSeat.Occupant then
                        local driver = driveSeat.Occupant
                        local carPosition = car.PrimaryPart.Position
                        local playerPosition = player.Character.HumanoidRootPart.Position
                        local distance = (carPosition - playerPosition).Magnitude
                        
                        if distance < closestDistance then
                            closestDistance = distance
                            closestCar = car
                            closestDriver = driver  
                        end
                    end
                end
                return closestCar, closestDriver
            end
            
            VehicleTab:CreateToggle({
                Name = "Enable Acceleration",
                CurrentValue = false,
                Flag = "ToggleAcceleration",
                Callback = function(Value)
                    AccelerationEnabled = Value
                end
            })
            
            VehicleTab:CreateToggle({
                Name = "Enable Deceleration",
                CurrentValue = false,
                Flag = "ToggleDeceleration",
                Callback = function(Value)
                    DecelerationEnabled = Value
                end
            })
            
            VehicleTab:CreateSlider({
                Name = "Acceleration Force",
                Range = {1, 100000},
                Increment = 1,
                Suffix = "Acceleration",
                CurrentValue = 1000,
                Flag = "SpeedHacksSpeed",
                Callback = function(Value)
                    speedhaxforce = Value
                end
            })
            
            VehicleTab:CreateSlider({
                Name = "Deceleration Force",
                Range = {1, 100000},
                Increment = 1,
                Suffix = "Brake Force",
                CurrentValue = 1000,
                Flag = "BrakeHacksForce",
                Callback = function(Value)
                    brakehaxforce = Value
                end
            })
            
            VehicleTab:CreateInput({
                Name = "Acceleration Keybind",
                PlaceholderText = "Enter Key (e.g., W)",
                Flag = "AccelKeybind",
                Callback = function(Value)
                    local keyCode = Enum.KeyCode[Value:upper()]
                    if keyCode then accelKey = keyCode end
                end
            })
            
            VehicleTab:CreateInput({
                Name = "Deceleration Keybind",
                PlaceholderText = "Enter Key (e.g., S)",
                Flag = "DecelKeybind",
                Callback = function(Value)
                    local keyCode = Enum.KeyCode[Value:upper()]
                    if keyCode then decelKey = keyCode end
                end
            })
            
            VehicleTab:CreateButton({
                Name = "Inject Hacks",
                Callback = function()
                    local player = game.Players.LocalPlayer
                    local userInputService = game:GetService("UserInputService")
                    local runService = game:GetService("RunService")
                    local car, driver = findNearestCar(player)
            
                    if car and driver then
                        Rayfield:Notify({
                            Title = "Car Found!",
                            Content = "You may now use Speed.",
                            Duration = 3,
                            Actions = {}
                        })
            
                        local primaryPart = car.PrimaryPart
                        local attachment = primaryPart:FindFirstChild("ForceAttachment")
                        if not attachment then
                            attachment = Instance.new("Attachment")
                            attachment.Name = "ForceAttachment"
                            attachment.Parent = primaryPart
                        end
            
                        local force = Instance.new("VectorForce")
                        force.Parent = car
                        force.RelativeTo = Enum.ActuatorRelativeTo.World
                        force.Attachment0 = attachment
                        force.ApplyAtCenterOfMass = true
                        force.Force = Vector3.new(0, 0, 0)
            
                        local isPressingW = false
                        local isPressingS = false
                        local isControllerAccelerate = false
                        local isControllerBrake = false
                        local isInstantBraking = false
            
                        runService.RenderStepped:Connect(function()
                            if car and car.PrimaryPart then
                                local velocity = car.PrimaryPart.Velocity:Dot(car.PrimaryPart.CFrame.LookVector)
                                
                                if (isPressingW or isControllerAccelerate) and AccelerationEnabled then
                                    if velocity < 0 then
                                        force.Force = car.PrimaryPart.CFrame.LookVector * -speedhaxforce
                                    else
                                        force.Force = car.PrimaryPart.CFrame.LookVector * speedhaxforce
                                    end
                                elseif (isPressingS or isControllerBrake) and DecelerationEnabled then
                                    if velocity > 0 then
                                        force.Force = car.PrimaryPart.CFrame.LookVector * -brakehaxforce
                                    else
                                        force.Force = car.PrimaryPart.CFrame.LookVector * brakehaxforce
                                    end
                                elseif isInstantBraking then
                                    force.Force = Vector3.new(0, 0, 0)
                                else
                                    force.Force = Vector3.new(0, 0, 0)
                                end
                            end
                        end)
            
                        local function onInputBegan(input, gameProcessed)
                            if gameProcessed then return end
                            if input.KeyCode == accelKey then
                                isPressingW = true
                            elseif input.KeyCode == decelKey then
                                isPressingS = true
                            elseif instantBrakeKey and input.KeyCode == instantBrakeKey then
                                isInstantBraking = true
                            elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
                                if input.KeyCode == Enum.KeyCode.ButtonR2 then 
                                    isControllerAccelerate = true
                                elseif input.KeyCode == Enum.KeyCode.ButtonL2 then 
                                    isControllerBrake = true
                                end
                            end
                        end
            
                        local function onInputEnded(input, gameProcessed)
                            if gameProcessed then return end
                            if input.KeyCode == accelKey then
                                isPressingW = false
                            elseif input.KeyCode == decelKey then
                                isPressingS = false
                            elseif instantBrakeKey and input.KeyCode == instantBrakeKey then
                                isInstantBraking = false
                            elseif input.UserInputType == Enum.UserInputType.Gamepad1 then
                                if input.KeyCode == Enum.KeyCode.ButtonR2 then 
                                    isControllerAccelerate = false
                                elseif input.KeyCode == Enum.KeyCode.ButtonL2 then 
                                    isControllerBrake = false
                                end
                            end
                        end
            
                        userInputService.InputBegan:Connect(onInputBegan)
                        userInputService.InputEnded:Connect(onInputEnded)
                    else
                        Rayfield:Notify({
                            Title = "No Car Found!",
                            Content = "Couldn't find any car nearby to inject hacks into.",
                            Duration = 3,
                            Actions = {}
                        })
                    end
                end
            })
            
            PlayerTab:CreateDivider()
            PlayerTab:CreateSection("Name")
            
            local function createNameTag(character, nameText)
                local head = character:FindFirstChild("Head")
                if not head then return end
            
                local existingTag = head:FindFirstChild("CustomNameTag")
                if existingTag then existingTag:Destroy() end
            
                if nameText ~= "" then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "CustomNameTag"
                    billboard.Parent = head
                    billboard.Size = UDim2.new(4, 0, 1, 0)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
            
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Parent = billboard
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextScaled = true
                    textLabel.Font = Enum.Font.GothamSemibold
                    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    textLabel.TextStrokeTransparency = 0.5
                    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    textLabel.Text = nameText
                end
            end
            
            PlayerTab:CreateInput({
                Name = "Change Nametag",
                PlaceholderText = "Enter new name",
                RemoveTextAfterFocusLost = false,
                Callback = function(Value)
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.DisplayName = Value 
                            createNameTag(character, Value) 
                        end
                    end
                end
            })
            
            --
            
            local FakeDisplay = ""
            PlayerTab:CreateInput({
                Name = "New Display Name",
                PlaceholderText = "Enter new display name...",
                RemoveTextAfterFocusLost = false,
                Callback = function(Name)
                    FakeDisplay = Name
                end
            })
            
            local function ChangeLeaderboardName()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
            
                task.spawn(function()
                    while true do
                        for _, obj in pairs(game.CoreGui:GetDescendants()) do
                            if obj:IsA("TextLabel") and obj.Text == LocalPlayer.Name then
                                obj.Text = FakeDisplay 
                            end
                        end
                        task.wait(1) 
                    end
                end)
            end
            
            PlayerTab:CreateButton({
                Name = "Apply Display Name",
                Callback = function()
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    local ChatService = game:GetService("StarterGui")
                    ChatService:SetCore("ChatMakeSystemMessage", {
                        Text = "Your username is now '" .. FakeDisplay .. "' (Client-Side)";
                        Color = Color3.fromRGB(0, 255, 0);
                    })
            
                    ChangeLeaderboardName()
            
                    Rayfield:Notify({
                        Title = "Display Name Changed!",
                        Content = "Your display name is now '" .. FakeDisplay .. "' (Client-Sided).",
                        Duration = 5,
                        Actions = { Ignore = { Name = "OK", Callback = function() end } }
                    })
                end
            })
            
            PlayerTab:CreateButton({
                Name = "Reset Display Name",
                Callback = function()
                    Running = false 
                    local Players = game:GetService("Players")
                    local LocalPlayer = Players.LocalPlayer
                    task.spawn(function()
                        for _, obj in pairs(game.CoreGui:GetDescendants()) do
                            if obj:IsA("TextLabel") and obj.Text == FakeDisplay then
                                obj.Text = LocalPlayer.Name 
                            end
                        end
                    end)
                    local ChatService = game:GetService("StarterGui")
                    ChatService:SetCore("ChatMakeSystemMessage", {
                        Text = "Your username has been reset to '" .. LocalPlayer.Name .. "'",
                        Color = Color3.fromRGB(255, 0, 0);
                    })
            
                    Rayfield:Notify({
                        Title = "Display Name Reset!",
                        Content = "Your display name has been restored to '" .. LocalPlayer.Name .. "'.",
                        Duration = 5,
                        Actions = { Ignore = { Name = "OK", Callback = function() end } }
                    })
                end
            })
            
            ----
            
            local SpectateSection = PlayerTab:CreateSection("Spectate")
            local spectatePlayer = ""
            
            local function findClosestUsername(input)
                input = input:lower()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name:lower():sub(1, #input) == input then
                        return player.Name
                    end
                end
                return nil
            end
            
            PlayerTab:CreateInput({
                Name = "Spectate Player",
                PlaceholderText = "Enter Username",
                Flag = "SpectateInput",
                Callback = function(Value)
                    spectatePlayer = findClosestUsername(Value) or Value
            
                    if spectatePlayer == "" then
                        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                        return
                    end
                    
                    local targetPlayer = game.Players:FindFirstChild(spectatePlayer)
                    if targetPlayer then
                        game.Workspace.CurrentCamera.CameraSubject = targetPlayer.Character:FindFirstChild("Humanoid")
                    else
                        Rayfield:Notify({
                            Title = "Spectate Error",
                            Content = "Player not found!",
                            Duration = 5,
                        })
                    end
                end
            })
            
            ---------------------------------------------------------------
            
            AutofarmTab:CreateDivider()
            
            local function FindNearestVehicle()
                local player = game.Players.LocalPlayer
                if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    return nil
                end
            
                local rootPos = player.Character.HumanoidRootPart.Position
                local nearestCar = nil
                local shortestDistance = 10 
            
                for _, car in pairs(workspace.SessionVehicles:GetChildren()) do
                    if car:IsA("Model") and car.PrimaryPart then
                        local distance = (car.PrimaryPart.Position - rootPos).Magnitude
                        if distance < shortestDistance then
                            nearestCar = car
                            shortestDistance = distance
                        end
                    end
                end
            
                return nearestCar
            end
            
            AutofarmTab:CreateToggle({
                Name = "(In Dev) Driving Autofarm",
                CurrentValue = false,
                Flag = "ToggleAutofarm",
                Callback = function(Value)
                    Autofarm = Value
                    local player = game.Players.LocalPlayer
            
                    if Autofarm then
                        player.Team = game.Teams:FindFirstChild("Allen Insurance Agent")
                        Rayfield:Notify({
                            Title = "Autofarm Enabled",
                            Content = "Driving Autofarm is now active! Please use a private server for less chance of ban!",
                            Duration = 3
                        })
            
                        local vehicle = FindNearestVehicle()
                        if not vehicle then
                            Rayfield:Notify({
                                Title = "No Vehicle Found",
                                Content = "No vehicle found within 10 studs.",
                                Duration = 3
                            })
                            return
                        end
            
                        local startPosition = Vector3.new(593.8524780273438, -79.48839569091797, -10894.6806640625)
                        local endPosition = Vector3.new(6922.5556640625, -79.2073974609375, -11567.57421875)
                        local speed = 98
            
                        vehicle:SetPrimaryPartCFrame(CFrame.new(startPosition) * CFrame.Angles(0, math.rad(90), 0))
            
                        local bodyVelocity = Instance.new("BodyVelocity")
                        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        bodyVelocity.Parent = vehicle.PrimaryPart
            
                        local targetPos = endPosition
            
                        while Autofarm do
                            while (vehicle.PrimaryPart.Position - targetPos).Magnitude > 1 and Autofarm do
                                local direction = (targetPos - vehicle.PrimaryPart.Position).Unit
                                bodyVelocity.Velocity = direction * speed
                                wait(0.02)
                                local finalPosition = Vector3.new(vehicle.PrimaryPart.Position.X, -80, vehicle.PrimaryPart.Position.Z)
                                vehicle:SetPrimaryPartCFrame(CFrame.new(finalPosition) * CFrame.Angles(0, math.rad(90), 0))
                            end
                            targetPos = (targetPos == startPosition) and endPosition or startPosition
                        end
            
                        bodyVelocity:Destroy()
                    else
                        player.Team = game.Teams:FindFirstChild("Unemployed")
                        Rayfield:Notify({
                            Title = "Autofarm Disabled",
                            Content = "Driving Autofarm is now disabled.",
                            Duration = 3
                        })
                    end
                end
            })
            
            AutofarmTab:CreateButton({
                Name = "Autoclicker (Not Mine!!!)", 
                Description = "Click to execute a loadstring script", 
                Callback = function()
            
            -------------------------------------------------------------------
            loadstring(game:HttpGetAsync('https://pastebin.com/raw/WgkcDYUs'))()
            -------------------------------------------------------------------
            
                    local success, errorMessage = pcall(function()
                        loadstring(code)()  -- Execute the loadstring code
                    end)
                    
                    if success then
                        print("Code executed successfully!")
                    else
                        print("Error while executing code: " .. errorMessage)
                    end
                end
            })
            
            ---------------------------------------------------------------
            
            GriefTab:CreateDivider()
            local Section = GriefTab:CreateSection("Spin")
            local rotationSpeed = 5 
            local carToSpin = nil
            local spinning = false 
            
            local function findClosestUsername(partialUsername)
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    local fullUsername = car.Name:match("(.-)-Car")
                    if fullUsername and fullUsername:lower():find(partialUsername:lower(), 1, true) then
                        return fullUsername
                    end
                end
                return nil
            end
            
            local function findCarFromUsername(username)
                local matchedUsername = findClosestUsername(username) or username
                return game.Workspace.SessionVehicles:FindFirstChild(matchedUsername .. "-Car")
            end
            
            local function stopSpinningCar()
                spinning = false
            end
            
            local function spinLocalCar()
                spinning = true
                task.spawn(function()
                    while spinning do
                        if carToSpin and carToSpin.PrimaryPart then
                            carToSpin:SetPrimaryPartCFrame(carToSpin.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(rotationSpeed), 0))
                        end
                        task.wait()
                    end
                end)
            end
            
            GriefTab:CreateInput({
                Name = "Enter Username",
                PlaceholderText = "Enter username",
                TextDisappear = true,
                Callback = function(username)
                    local car = findCarFromUsername(username)
                    
                    if car and car.PrimaryPart then
                        carToSpin = car
                        Rayfield:Notify({
                            Title = "Car Found!",
                            Content = "Found the car of " .. car.Name:gsub("%-Car", "") .. "!",
                            Duration = 3,
                            Actions = {}
                        })
                    else
                        Rayfield:Notify({
                            Title = "Car Not Found!",
                            Content = "Couldn't find the car of " .. username .. " in SessionVehicles.",
                            Duration = 3,
                            Actions = {}
                        })
                    end
                end
            })
            
            GriefTab:CreateToggle({
                Name = "Spin Car",
                CurrentValue = false,
                Callback = function(value)
                    if carToSpin then
                        if value then
                            spinLocalCar()
                        else
                            stopSpinningCar()
                        end
                    else
                        Rayfield:Notify({
                            Title = "Error",
                            Content = "Please enter a valid username first.",
                            Duration = 3,
                            Actions = {}
                        })
                    end
                end
            })
            
            GriefTab:CreateSlider({
                Name = "Spin Speed",
                Range = {1, 50},
                Increment = 1,
                Suffix = "Speed",
                CurrentValue = rotationSpeed,
                Flag = "CarRotationSpeed",
                Callback = function(Value)
                    rotationSpeed = Value
                end
            })
            
            ---
            
            local Section = GriefTab:CreateSection("Fling")
            
            local flingHeight = 500
            local flingRadius = 50
            local carToFling = nil
            
            local function findClosestUsername(partialUsername)
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    local fullUsername = car.Name:match("(.-)-Car")
                    if fullUsername and fullUsername:lower():find(partialUsername:lower(), 1, true) then
                        return fullUsername
                    end
                end
                return nil
            end
            
            local function findCarFromUsername(username)
                local matchedUsername = findClosestUsername(username) or username
                return game.Workspace.SessionVehicles:FindFirstChild(matchedUsername .. "-Car")
            end
            
            local function flingCar(car)
                if car and car.PrimaryPart then
                    local player = game.Players.LocalPlayer
                    if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                        return
                    end
                    
                    local rootPos = player.Character.HumanoidRootPart.Position
                    local carPos = car.PrimaryPart.Position
                    
                    local direction = (carPos - rootPos).unit * -flingRadius
                    local velocity = direction + Vector3.new(0, flingHeight, 0)
                    
                    local carFling = Instance.new("BodyVelocity")
                    carFling.Velocity = velocity
                    carFling.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                    carFling.Parent = car.PrimaryPart
                    task.wait(0.3)
                    carFling:Destroy()
                end
            end
            
            local function flingTargetCar()
                if carToFling and carToFling.PrimaryPart then
                    flingCar(carToFling)
                else
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "No car found for the entered username.",
                        Duration = 3,
                        Actions = {}
                    })
                end
            end
            
            local function flingNearbyCars()
                local player = game.Players.LocalPlayer
                if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    return
                end
            
                local rootPos = player.Character.HumanoidRootPart.Position
                local carsFlinged = 0
            
                for _, car in pairs(game.Workspace.SessionVehicles:GetChildren()) do
                    if car:IsA("Model") and car.PrimaryPart then
                        local dist = (car.PrimaryPart.Position - rootPos).Magnitude
                        if dist <= flingRadius then
                            flingCar(car)
                            carsFlinged += 1
                        end
                    end
                end
            
                Rayfield:Notify({
                    Title = "Fling Complete",
                    Content = "Flinged " .. carsFlinged .. " car(s) within " .. flingRadius .. " studs!",
                    Duration = 3,
                    Actions = {}
                })
            end
            
            GriefTab:CreateInput({
                Name = "Enter Username",
                PlaceholderText = "Enter username",
                TextDisappear = true,
                Callback = function(username)
                    local car = findCarFromUsername(username)
                    
                    if car and car.PrimaryPart then
                        carToFling = car
                        Rayfield:Notify({
                            Title = "Car Found!",
                            Content = "Found the car of " .. car.Name:gsub("%-Car", "") .. "!",
                            Duration = 3,
                            Actions = {}
                        })
                    else
                        Rayfield:Notify({
                            Title = "Car Not Found!",
                            Content = "Couldn't find the car of " .. username,
                            Duration = 3,
                            Actions = {}
                        })
                    end
                end
            })
            
            GriefTab:CreateSlider({
                Name = "Fling Strength",
                Range = {100, 2000},
                Increment = 50,
                Suffix = "Force",
                CurrentValue = flingHeight,
                Callback = function(value)
                    flingHeight = value
                end
            })
            
            GriefTab:CreateSlider({
                Name = "Fling Radius",
                Range = {10, 500},
                Increment = 10,
                Suffix = "Studs",
                CurrentValue = flingRadius,
                Callback = function(value)
                    flingRadius = value
                end
            })
            
            GriefTab:CreateButton({
                Name = "Fling Target Player's Car",
                Callback = function()
                    flingTargetCar()
                end
            })
            
            GriefTab:CreateButton({
                Name = "Fling Nearby Cars",
                Callback = function()
                    flingNearbyCars()
                end
            })
            
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Mouse = LocalPlayer:GetMouse()
            local ToolName = "FlingGun"
            local tool = nil
            
            GriefTab:CreateToggle({
                Name = "Fling Gun",
                CurrentValue = false,
                Callback = function(enabled)
                    if enabled then
                        local tool = Instance.new("Tool")
                        tool.RequiresHandle = false
                        tool.Name = ToolName
                        tool.CanBeDropped = false
                        tool.Activated:Connect(function()
                            local target = Mouse.Target
                            if not target then return end
                            local model = target:FindFirstAncestorOfClass("Model")
                            if model and model:IsDescendantOf(workspace.SessionVehicles) then
                                local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                                if primary then
                                    local fling = Instance.new("BodyVelocity")
                                    fling.Velocity = Vector3.new(0, 250, 0)
                                    fling.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                                    fling.Parent = primary
                                    task.wait(0.3)
                                    fling:Destroy()
                                end
                            end
                        end)
                        tool.Parent = LocalPlayer.Backpack
                    else
                        local existing = LocalPlayer.Backpack:FindFirstChild(ToolName) or LocalPlayer.Character:FindFirstChild(ToolName)
                        if existing then existing:Destroy() end
                    end
                end,
            })
            
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local Mouse = LocalPlayer:GetMouse()
            local Camera = workspace.CurrentCamera
            local ToolName = "TelekinesisGun"
            local isHolding = false
            local heldCar = nil
            local bodyPosition = nil
            local bodyVelocity = nil
            local forceSlider = 500
            
            GriefTab:CreateToggle({
                Name = "Telekinesis Gun",
                CurrentValue = false,
                Callback = function(enabled)
                    if enabled then
                        local tool = Instance.new("Tool")
                        tool.RequiresHandle = false
                        tool.Name = ToolName
                        tool.CanBeDropped = false
                        tool.Activated:Connect(function()
                            if isHolding then
                                if heldCar then
                                    bodyPosition:Destroy()
                                    bodyVelocity:Destroy()
                                end
                                isHolding = false
                                heldCar = nil
                                bodyPosition = nil
                                bodyVelocity = nil
                            else
                                local mousePos = Mouse.Hit.Position
                                local origin = Camera.CFrame.Position
                                local direction = (mousePos - origin).Unit * 500
            
                                local rayParams = RaycastParams.new()
                                rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                                rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                                rayParams.IgnoreWater = true
            
                                local result = workspace:Raycast(origin, direction, rayParams)
                                if result and result.Instance then
                                    local model = result.Instance:FindFirstAncestorOfClass("Model")
                                    if model and model:IsDescendantOf(workspace.SessionVehicles) then
                                        local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                                        if primary then
                                            isHolding = true
                                            heldCar = model
                                            bodyPosition = Instance.new("BodyPosition")
                                            bodyVelocity = Instance.new("BodyVelocity")
            
                                            bodyPosition.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                                            bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            
                                            -- Adjust P and D values for smooth movement
                                            bodyPosition.P = forceSlider * 2  -- Lower P for easier control and smoother follow
                                            bodyPosition.D = 300  -- Decreased D for more fluidity and less resistance
                                            
                                            -- Apply smaller vertical velocity to avoid fling and keep the car closer
                                            bodyVelocity.Velocity = Vector3.new(0, 300, 0)  -- Adjusted vertical force for smooth lifting
                                            
                                            bodyPosition.Parent = primary
                                            bodyVelocity.Parent = primary
                                        end
                                    end
                                end
                            end
                        end)
            
                        Mouse.Button1Down:Connect(function()
                            if isHolding and heldCar then
                                local primary = heldCar.PrimaryPart
                                if bodyPosition then
                                    bodyPosition.Position = Mouse.Hit.p
                                end
                                if bodyVelocity then
                                    -- Apply a lighter horizontal force to follow the mouse with smoothness
                                    bodyVelocity.Velocity = (Mouse.Hit.p - primary.Position).unit * forceSlider * 0.3  -- Lower horizontal force
                                end
                            end
                        end)
            
                        Mouse.Button1Up:Connect(function()
                            if isHolding and heldCar then
                                if bodyPosition then
                                    bodyPosition:Destroy()
                                end
                                if bodyVelocity then
                                    bodyVelocity:Destroy()
                                end
                                isHolding = false
                                heldCar = nil
                                bodyPosition = nil
                                bodyVelocity = nil
                            end
                        end)
            
                        tool.Parent = LocalPlayer.Backpack
                    else
                        local existing = LocalPlayer.Backpack:FindFirstChild(ToolName) or LocalPlayer.Character:FindFirstChild(ToolName)
                        if existing then existing:Destroy() end
                    end
                end,
            })
            
            GriefTab:CreateSlider({
                Name = "Telekenisis Force",
                Range = {100, 1500},
                Increment = 100,
                Suffix = "Force",
                CurrentValue = 1,
                Callback = function(value)
                    forceSlider = value
                end
            })
            
            --
            
            local Section = GriefTab:CreateSection("Misc")
            GriefTab:CreateLabel("Go next to a car and click any of these buttons!")
            
            GriefTab:CreateButton({
                Name = "Goofy Wheels",
                Callback = function()
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        print(player.Name)
                        local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                        if PlayerCar then
                            local Wheels = PlayerCar:FindFirstChild("Wheels")
                            if Wheels then
                                for _, wheel in ipairs(Wheels:GetChildren()) do
                                    local spring = wheel:FindFirstChild("Spring")
                                    if spring then
                                        spring.MinLength = 5
                                        spring.MaxLength = 15
                                        print(wheel.Name)
                                    end
                                end
                            end
                        end
                    end
                end
            })
            
            GriefTab:CreateButton({
                Name = "Break Car Seat",
                Callback = function()
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        print(player.Name)
                        local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                        if PlayerCar then
                            local seat = PlayerCar:FindFirstChild("DriveSeat")
                            if seat then
                                seat:Destroy()
                            end
                        end
                    end
                end
            })
            
            GriefTab:CreateButton({
                Name = "Break Car",
                Callback = function()
                    for _, player in ipairs(game.Players:GetPlayers()) do
                        print(player.Name)
                        local PlayerCar = workspace.SessionVehicles:FindFirstChild(player.Name .. "-Car")
                        if PlayerCar then
                            local Wheels = PlayerCar:FindFirstChild("Wheels")
                            if Wheels then
                                for _, wheel in ipairs(Wheels:GetChildren()) do
                                    local spring = wheel:FindFirstChild("Spring")
                                    if spring then
                                        spring.MinLength = 15
                                        spring.MaxLength = 30
                                        print(wheel.Name)
                                    end
                                end
                            end
                        end
                    end
                end
            })
            
            -------------------------------------------------------------
            
            local Section = PlayerTab:CreateSection("Greenville Radios")
            
            PlayerTab:CreateToggle({
                Name = "KISS",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://1841361344" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            PlayerTab:CreateToggle({
                Name = "THE JAM",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://10017012450" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            PlayerTab:CreateToggle({
                Name = "WAPL",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://133789068081968" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            PlayerTab:CreateToggle({
                Name = "WFZZ",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://5410083912" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            PlayerTab:CreateToggle({
                Name = "WVBO",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://1840251508" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            PlayerTab:CreateToggle({
                Name = "Y100",
                CurrentValue = false,
                Flag = "SoundToggle",
                Callback = function(Value)
                    if Value then
                        Sound.SoundId = "rbxassetid://1847272328" 
                        Sound:Play()
                    else
                        Sound:Stop()
                    end
                end
            })
            
            ----
            
            local SpectateSection = PlayerTab:CreateSection("Teleport")
            
            local function FindNearestVehicle()
                local player = game.Players.LocalPlayer
                if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                    return nil
                end
            
                local rootPos = player.Character.HumanoidRootPart.Position
                local nearestCar = nil
                local shortestDistance = 10
            
                for _, car in pairs(workspace:GetChildren()) do
                    if car:IsA("Model") and car.Name == "Car" and car.PrimaryPart then
                        local distance = (car.PrimaryPart.Position - rootPos).Magnitude
                        if distance < shortestDistance then
                            nearestCar = car
                        end
                    end
                end
            
                return nearestCar
            end
            
            local function teleportToTarget(targetPosition)
                local player = game.Players.LocalPlayer
                local vehicle = FindNearestVehicle()
            
                if vehicle then
                    vehicle:SetPrimaryPartCFrame(targetPosition)
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Vehicle Teleported",
                        Text = "Your vehicle has been teleported!",
                        Duration = 3
                    })
                elseif player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = targetPosition
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Player Teleported",
                        Text = "You have been teleported!",
                        Duration = 3
                    })
                else
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Teleport Failed",
                        Text = "No vehicle found or player not in a vehicle.",
                        Duration = 3
                    })
                end
            end
            
            PlayerTab:CreateButton({
                Name = "Teleport to Location 1",
                Callback = function()
                    teleportToTarget(CFrame.new(100, 10, 100))
                end
            })
            
            PlayerTab:CreateButton({
                Name = "Teleport to Location 2",
                Callback = function()
                    teleportToTarget(CFrame.new(200, 10, 200))
                end
            })
            
            PlayerTab:CreateButton({
                Name = "Teleport to Location 3",
                Callback = function()
                    teleportToTarget(CFrame.new(300, 10, 300))
                end
            })

--------------------------------------------------------------------------------------------------------
print(' Logged In!')
print(' User Data')
print(' Username:' .. data.info.username)
print(' IP Address:' .. data.info.ip)
print(' Created at:' .. data.info.createdate)
print(' Last login at:' .. data.info.lastlogin)
