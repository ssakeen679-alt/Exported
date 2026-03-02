-- InputHandler: Manages player input and communications
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Track various states
local inputStates = {
	canAct = true,
	isInCombat = false,
	selectedAbility = 1
}

-- Handle mouse click
mouse.Button1Down:Connect(function()
	if inputStates.canAct then
		print("Left click detected")
	end
end)

-- Handle right click
mouse.Button2Down:Connect(function()
	if inputStates.canAct then
		print("Right click detected")
	end
end)

-- Handle ability selection with number keys
local KeyCodeToAbility = {
	[Enum.KeyCode.One] = 1,
	[Enum.KeyCode.Two] = 2,
	[Enum.KeyCode.Three] = 3,
	[Enum.KeyCode.Four] = 4,
}

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if KeyCodeToAbility[input.KeyCode] then
		inputStates.selectedAbility = KeyCodeToAbility[input.KeyCode]
		print("Selected ability: " .. inputStates.selectedAbility)
	end
end)

print("Input handler initialized!")
