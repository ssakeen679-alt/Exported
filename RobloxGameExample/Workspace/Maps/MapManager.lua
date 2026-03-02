-- MapManager: Manages map layout, hazards, and objectives
local mapManager = {}

-- Map properties
mapManager.MapName = "Arena"
mapManager.MapSize = Vector3.new(200, 100, 200)
mapManager.Hazards = {}
mapManager.Objectives = {}

-- Define map boundaries
function mapManager:IsWithinBounds(position)
	local halfSize = self.MapSize / 2
	return position.X > -halfSize.X and position.X < halfSize.X
		and position.Y > 0 and position.Y < self.MapSize.Y
		and position.Z > -halfSize.Z and position.Z < halfSize.Z
end

-- Check and handle out of bounds
function mapManager:CheckOutOfBounds(character)
	if not self:IsWithinBounds(character.HumanoidRootPart.Position) then
		print(character.Name .. " fell out of bounds!")
		character.Humanoid:TakeDamage(character.Humanoid.MaxHealth)
		return true
	end
	return false
end

-- Add hazard to map
function mapManager:AddHazard(hazardData)
	table.insert(self.Hazards, hazardData)
	print("Hazard added: " .. hazardData.name)
end

-- Add objective
function mapManager:AddObjective(objective)
	table.insert(self.Objectives, objective)
	print("Objective added: " .. objective.name)
end

return mapManager
