local player = game:GetService("Players").LocalPlayer.Character
local aligns = {}
local hataligns = {}
function fgvbhnjmi(number)
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", number)
end
game:GetService("RunService").Heartbeat:Connect(function()
ve = Vector3.new(30,0,0)
  player["Head"].Velocity = ve
  player["Torso"].Velocity = ve
  player["Left Arm"].Velocity = ve
  player["Right Arm"].Velocity = ve
  player["Left Leg"].Velocity = ve
  player["Right Leg"].Velocity = ve
  player.HumanoidRootPart.Velocity = ve
for i,v in pairs(player:GetDescendants()) do
    if v:IsA("Accessory") then
        v.Handle.Velocity = Vector3.new(26,0,0)
    end
end
end)
wait(0.1)
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.AllowSleep = false
game.Players.LocalPlayer.ReplicationFocus = player
local Player = game.Players.LocalPlayer
local Character = Player.Character
local RespawnTime = 10
--Character["Local Ragdoll"]:Destroy()
Character.Archivable = true
local CloneChar = Character:Clone()
CloneChar.Name = "ReanimChar"
CloneChar.Parent = Character
Workspace.CurrentCamera.CameraSubject = CloneChar
for _,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") then
        Instance.new("Attachment", v)
    end
end
for _,v in pairs(Character:GetDescendants()) do
    if v:IsA("Accessory") then
        Instance.new("Attachment", v.Handle)
        Instance.new("AlignPosition",v)
        Instance.new("AlignOrientation",v)
    end
end
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") and v.Parent == Character then
        Instance.new("AlignPosition", v)
        Instance.new("AlignOrientation", v)
        Instance.new("BodyVelocity", v)
        --Instance.new("BodyPosition", v)
        Instance.new("BodyForce", v)
        Instance.new("BodyAngularVelocity", v)
    end
    if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then
        v:Destroy()
    end
end
game:GetService("RunService").Stepped:connect(function()
fgvbhnjmi(math.huge)
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
   --[[ if v:IsA("Accessory") then
        v.Handle.Velocity = Vector3.new(0,2,0)
    end
    if v:IsA("BasePart") and v.Parent == Character and v.Name ~= "Left Arm" and v.Name ~= "Right Arm" then
        v.Transparency = CloneChar.Head.LocalTransparencyModifier
    end
    if v:IsA("Accessory") then
        v.Handle.Transparency = CloneChar.Head.LocalTransparencyModifier
    end
    if v:IsA("Part") and v.Parent == CloneChar then
        v.Transparency = 1
    end
    if v:IsA("Accessory") and v.Parent == CloneChar then
        v.Handle.Transparency =1
    end
end
for i,v in pairs(CloneChar:GetDescendants()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end
end]]
end
--Character.Head.face.Texture = CloneChar.Head.face.Texture
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
        v.Velocity = Vector3.new(0,1,0)
    end
end
--[[for i,v in pairs(CloneChar:GetDescendants()) do
    if v:IsA("Part") then
        v.Transparency = 1
    end
end]]
end)
for i,v in pairs(Character:GetDescendants()) do
    if v.Name == "AccessoryWeld" and v.Parent.Parent.Parent == Character then
        v:Destroy()
    end
        if v:IsA("AlignPosition") or v:IsA("AlignOrientation") then
        v.Responsiveness = 200
    end
    if v:IsA("AlignPosition") then
        v.MaxVelocity = math.huge
        v.MaxForce = 50000350345545
    end
    if v:IsA("Motor6D") and v.Parent == CloneChar.Torso then
        v.RobloxLocked = true
    end
    --[[if v:IsA("BodyPosition") and v.Parent.Parent == Character and v.Parent.Name ~= "HumanoidRootPart" then
        --v.MaxForce = Vector3.new(1,1,1) * math.huge
        v.P = v.P * 2
        v.Position = CloneChar[v.Parent.Name].Position
    end]]
    if v:IsA("BodyVelocity") then
        v.MaxForce = Vector3.new(1,1,1) * math.huge
        v.P = math.huge
        v.Velocity = ve
    end
        if v:IsA("BodyAngularVelocity") and v.Parent.Name ~= "HumanoidRootPart" then
        v.MaxTorque = Vector3.new(1,1,1) * math.huge
        v.P = math.huge
        v.AngularVelocity = Vector3.new(0,0,0)
    end
    if v:IsA("BodyForce") then
        v.Force = Vector3.new(15.2,15.2,15.2)
    end
    if v:IsA("Part") and v.Parent == CloneChar then
        v.Transparency = 1
    end
end
for i,v in pairs(Character.Torso:GetDescendants()) do
    if v:IsA("Motor6D") and v.Name ~= "Neck" then
        v:Destroy()
    end
end
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and not v.Parent:IsA("Accessory") and v.Parent == Character then
        table.insert(aligns, v)
        print(v.Name)
    end
end
game:GetService("RunService").Stepped:connect(function()
for i,v in ipairs(aligns) do
--v.AlignPosition.Attachment0 = v.Attachment
    v.CFrame = CloneChar[v.Name].CFrame
end
end)
game:GetService("RunService").Heartbeat:connect(function()
for i,v in ipairs(aligns) do
--v.AlignPosition.Attachment0 = v.Attachment
    v.CFrame = CloneChar[v.Name].CFrame
end
end)
game:GetService("RunService").RenderStepped:connect(function()
for i,v in ipairs(aligns) do
--v.AlignPosition.Attachment0 = v.Attachment
    v.CFrame = CloneChar[v.Name].CFrame
end
end)
spawn(function()
while true do
    game:GetService("RunService").Stepped:wait()
v.CFrame = CloneChar[v.Name].CFrame
game:GetService("RunService").Heartbeat:wait()
v.CFrame = CloneChar[v.Name].CFrame
game:GetService("RunService").RenderStepped:wait()
v.CFrame = CloneChar[v.Name].CFrame
end
end)
Character.Head.AlignPosition.Attachment0 = Character.Head.Attachment
Character.Head.AlignPosition.Attachment1 = CloneChar.Head.Attachment
Character.Torso.AlignPosition.Attachment0 = Character.Torso.Attachment
Character.Torso.AlignPosition.Attachment1 = CloneChar.Torso.Attachment
Character["HumanoidRootPart"].AlignPosition.Attachment0 = Character["HumanoidRootPart"].Attachment
Character["HumanoidRootPart"].AlignPosition.Attachment1 = CloneChar["Torso"].Attachment
Character["HumanoidRootPart"].AlignOrientation.Attachment0 = Character["HumanoidRootPart"].Attachment
Character["HumanoidRootPart"].AlignOrientation.Attachment1 = CloneChar["Torso"].Attachment

Character.Humanoid.BreakJointsOnDeath = false
game:FindFirstChildOfClass("Players").LocalPlayer.Character = Character.ReanimChar
wait(6)
for i,v in pairs(Character:GetDescendants()) do
    if v:IsA("Accessory") and v.Parent == Character then
        table.insert(hataligns, v)
        print(v.Name)
    end
end
for i,v in ipairs(hataligns) do
    v.AlignPosition.Attachment0 = v.Handle.Attachment
    v.AlignPosition.Attachment1 = CloneChar[v.Name].Handle.Attachment
    print(CloneChar[v.Name])
    v.AlignOrientation.Attachment0 = v.Handle.Attachment
    v.AlignOrientation.Attachment1 = CloneChar[v.Name].Handle.Attachment
    print(CloneChar[v.Name])
end
for i,v in ipairs(aligns) do
    v.AlignPosition.Attachment0 = v.Attachment
    v.AlignPosition.Attachment1 = CloneChar[v.Name].Attachment
    print(CloneChar[v.Name])
    v.AlignOrientation.Attachment0 = v.Attachment
    v.AlignOrientation.Attachment1 = CloneChar[v.Name].Attachment
    print(CloneChar[v.Name])
end
Character.Head.AlignOrientation.Attachment0 = Character.Head.Attachment
Character.Head.AlignOrientation.Attachment1 = CloneChar.Head.Attachment
Character.Torso.AlignOrientation.Attachment0 = Character.Torso.Attachment
Character.Torso.AlignOrientation.Attachment1 = CloneChar.Torso.Attachment
CloneChar.Parent.Torso.Neck:Destroy()
print("Done")
for i,v in pairs(CloneChar.Parent.Torso:GetDescendants()) do
    if v:IsA("Motor6D") and v.Name ~= "Neck" then
        v:Destroy()
    end
end
Character.HumanoidRootPart.RootJoint.Part0 = nil
Character.HumanoidRootPart.RootJoint.Part1 = nil 
Character.Head.AlignPosition.Attachment0 = Character.Head.Attachment
Character.Head.AlignPosition.Attachment1 = CloneChar.Head.Attachment
Character.Torso.AlignPosition.Attachment0 = Character.Torso.Attachment
Character.Torso.AlignPosition.Attachment1 = CloneChar.Torso.Attachment
Character["HumanoidRootPart"].AlignPosition.Attachment0 = Character["HumanoidRootPart"].Attachment
Character["HumanoidRootPart"].AlignPosition.Attachment1 = CloneChar["Torso"].Attachment
Character["HumanoidRootPart"].AlignOrientation.Attachment0 = Character["HumanoidRootPart"].Attachment
Character["HumanoidRootPart"].AlignOrientation.Attachment1 = CloneChar["Torso"].Attachment
wait(1)
CloneChar.Parent.HumanoidRootPart.Position = Vector3.new(0,-5200,0)
spawn(function()
while true do
    game.RunService.RenderStepped:wait()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Parent == Character then
            v.Anchored = true
        end
    end
    game.RunService.Stepped:wait()
     for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Parent == Character then
            v.Anchored = false
        end
    end
    game.RunService.Heartbeat:wait()
    for i,v in pairs(Character:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" and v.Parent == Character then
            v.Anchored = false
        end
    end
end
end)

local hrp = game:GetService("Players").LocalPlayer.Character.Parent.HumanoidRootPart
local e = Instance.new("SelectionBox", hrp)
e.Adornee = hrp
hrp.Name = "HumanoidRootPart"
hrp.Transparency = 0.5
hrp.Anchored = false
if hrp:FindFirstChildOfClass("AlignPosition") then
	hrp:FindFirstChildOfClass("AlignPosition"):Destroy()
end
if hrp:FindFirstChildOfClass("BodyAngularVelocity") then
	hrp:FindFirstChildOfClass("BodyAngularVelocity"):Destroy()
end
if hrp:FindFirstChildOfClass("AlignOrientation") then
	hrp:FindFirstChildOfClass("AlignOrientation"):Destroy()
end
local bp = Instance.new("BodyPosition", hrp)
bp.Position = hrp.Position
bp.D = 9999999
bp.P = 999999999999999
bp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
local flinger = Instance.new("BodyAngularVelocity",hrp)
flinger.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
flinger.P = 1000000000000000000000000000
flinger.AngularVelocity = Vector3.new(99999999999999999999,999999999999999999,999999999999999)

spawn(function()
	while game:GetService("RunService").Heartbeat:Wait() do
		bp.Position = hrp.Parent.Torso.Position
        hrp.Velocity = ve
        e.Transparency = (hrp.Parent.Head.LocalTransparencyModifier)
	end
end)
