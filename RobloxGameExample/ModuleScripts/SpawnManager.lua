-- SpawnManager: Manages player spawn points
local spawnManager = {}

-- Define spawn points
spawnManager.SpawnPoints = {
	Vector3.new(-50, 5, 0),
	Vector3.new(50, 5, 0),
	Vector3.new(0, 5, 50),
	Vector3.new(0, 5, -50),
}

-- Store spawned players
local spawnedPlayers = {}

function spawnManager:GetNextSpawnPoint()
	local index = (#spawnedPlayers % #self.SpawnPoints) + 1
	return self.SpawnPoints[index]
end

function spawnManager:SpawnPlayer(player, character)
	local spawnPoint = self:GetNextSpawnPoint()
	character:SetPrimaryPartCFrame(CFrame.new(spawnPoint + Vector3.new(0, 3, 0)))
	table.insert(spawnedPlayers, player)
	print(player.Name .. " spawned at " .. tostring(spawnPoint))
end

return spawnManager
