-- Movement: Handles character movement and animation
local Constants = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Constants"))
local UserInputService = game:GetService("UserInputService")

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Set movement speed
humanoid.WalkSpeed = Constants.WALK_SPEED

-- Table to track pressed keys
local keysPressed = {}

-- Track key inputs
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.W then
		keysPressed[Enum.KeyCode.W] = true
	elseif input.KeyCode == Enum.KeyCode.A then
		keysPressed[Enum.KeyCode.A] = true
	elseif input.KeyCode == Enum.KeyCode.S then
		keysPressed[Enum.KeyCode.S] = true
	elseif input.KeyCode == Enum.KeyCode.D then
		keysPressed[Enum.KeyCode.D] = true
	elseif input.KeyCode == Enum.KeyCode.Space then
		humanoid:Jump()
	end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.W then
		keysPressed[Enum.KeyCode.W] = false
	elseif input.KeyCode == Enum.KeyCode.A then
		keysPressed[Enum.KeyCode.A] = false
	elseif input.KeyCode == Enum.KeyCode.S then
		keysPressed[Enum.KeyCode.S] = false
	elseif input.KeyCode == Enum.KeyCode.D then
		keysPressed[Enum.KeyCode.D] = false
	end
end)

print(character.Name .. "'s movement system initialized!")
