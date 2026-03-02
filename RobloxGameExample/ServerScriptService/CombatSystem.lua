-- CombatSystem: Handles damage, healing, and combat interactions
local CombatSystem = {}

-- Function to damage a character
function CombatSystem:DamageCharacter(character, damageAmount, attacker)
	if not character then return end
	
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end
	
	humanoid:TakeDamage(damageAmount)
	print(character.Name .. " took " .. damageAmount .. " damage!")
	
	-- Create damage indicator (optional visual feedback)
	if attacker then
		print(attacker.Name .. " dealt damage to " .. character.Name)
	end
end

-- Function to heal a character
function CombatSystem:HealCharacter(character, healAmount)
	if not character then return end
	
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end
	
	humanoid.Health = math.min(humanoid.Health + healAmount, humanoid.MaxHealth)
	print(character.Name .. " healed for " .. healAmount .. " health!")
end

-- Function to check if character is alive
function CombatSystem:IsAlive(character)
	if not character then return false end
	local humanoid = character:FindFirstChild("Humanoid")
	return humanoid and humanoid.Health > 0
end

-- Function to handle death
function CombatSystem:OnCharacterDeath(character)
	print(character.Name .. " has been defeated!")
	-- Add death effects, respawn logic, etc.
end

return CombatSystem
