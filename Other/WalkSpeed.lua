down = false
velocity = Instance.new("BodyVelocity")
velocity.maxForce = Vector3.new(100000, 0, 100000)
---vv Use that to change the speed v
local speed = 100
gyro = Instance.new("BodyGyro")
gyro.maxTorque = Vector3.new(100000, 0, 100000)

local hum
game:GetService("RunService").Heartbeat:Connect(function()
	pcall(function()
		hum = game.Players.LocalPlayer.Character.Humanoid
	end)
end)

function onButton1Down(mouse)
down = true
velocity.Parent = game.Players.LocalPlayer.Character.Head
velocity.velocity = (hum.MoveDirection) * speed
gyro.Parent = game.Players.LocalPlayer.Character.Head
while down do
if not down then break end
velocity.velocity = (hum.MoveDirection) * speed
local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
wait(0.1)
end
end

function onButton1Up(mouse)
velocity.Parent = nil
gyro.Parent = nil
down = false
end
--To Change the key in those 2 lines, replace the "q" with your desired key
function onSelected(mouse)
mouse.KeyDown:connect(function(k) if k:lower()=="f"then onButton1Down(mouse)end end)
mouse.KeyUp:connect(function(k) if k:lower()=="f"then onButton1Up(mouse)end end)
end

onSelected(game.Players.LocalPlayer:GetMouse())