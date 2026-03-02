-- Combat: Handles player combat abilities and attacks
local Constants = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Constants"))
local UserInputService = game:GetService("UserInputService")

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local lastAttackTime = 0

-- Handle attack input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.E then
		local currentTime = tick()
		if currentTime - lastAttackTime >= Constants.ATTACK_COOLDOWN then
			lastAttackTime = currentTime
			
			-- Perform attack (you would add attack logic here)
			print(character.Name .. " performed an attack!")
			
			-- Check for enemies in range
			local hitPlayers = {}
			local attackRange = 20
			
			for _, player in pairs(game:GetService("Players"):GetPlayers()) do
				if player.Character and player.Character ~= character then
					local distance = (humanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
					if distance < attackRange then
						table.insert(hitPlayers, player)
					end
				end
			end
			
			-- Deal damage
			for _, player in pairs(hitPlayers) do
				local damage = Constants.BASE_DAMAGE
				-- Check for critical hit
				if math.random() < Constants.CRITICAL_CHANCE then
					damage = damage * Constants.CRITICAL_DAMAGE_MULTIPLIER
					print("Critical hit!")
				end
				player.Character.Humanoid:TakeDamage(damage)
			end
		end
	end
end)

print(character.Name .. "'s combat system initialized!")
