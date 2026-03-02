-- CharacterHealth: Manages character health and damage
local Constants = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Constants"))

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

-- Set up health
local maxHealth = Constants.DEFAULT_HEALTH
humanoid.MaxHealth = maxHealth
humanoid.Health = maxHealth

-- Handle death
local function onDied()
	print(character.Name .. " has died!")
	
	-- Remove character (will respawn automatically in Roblox)
	wait(2)
	character:Destroy()
end

humanoid.Died:Connect(onDied)

-- Monitor health changes
humanoid.HealthChanged:Connect(function(health)
	local healthPercent = (health / humanoid.MaxHealth) * 100
	-- You can add UI updates here to show health bar
end)

print(character.Name .. "'s health system initialized!")
