-- NPCSpawner: Spawns and manages NPC instances
local npcSpawner = {}

npcSpawner.SpawnedNPCs = {}
npcSpawner.MaxNPCsActive = 10
npcSpawner.SpawnInterval = 5 -- Spawn a new NPC every 5 seconds

-- NPC configurations
local npcConfigs = {
	{
		name = "Goblin",
		health = 30,
		damage = 8,
		speed = 14,
	},
	{
		name = "Orc",
		health = 60,
		damage = 15,
		speed = 10,
	},
	{
		name = "Skeleton",
		health = 40,
		damage = 12,
		speed = 12,
	},
}

-- Function to spawn an NPC
function npcSpawner:SpawnNPC(spawnPoint)
	if #self.SpawnedNPCs >= self.MaxNPCsActive then
		return nil
	end
	
	local randomConfig = npcConfigs[math.random(1, #npcConfigs)]
	print("Spawning NPC: " .. randomConfig.name)
	
	-- Create NPC (in a real game, you'd clone a template)
	local npc = Instance.new("Model")
	npc.Name = randomConfig.name
	
	local humanoidRootPart = Instance.new("Part")
	humanoidRootPart.Name = "HumanoidRootPart"
	humanoidRootPart.Size = Vector3.new(2, 2, 1)
	humanoidRootPart.CanCollide = false
	humanoidRootPart.CFrame = CFrame.new(spawnPoint)
	humanoidRootPart.Parent = npc
	
	local humanoid = Instance.new("Humanoid")
	humanoid.Parent = npc
	humanoid.MaxHealth = randomConfig.health
	humanoid.Health = randomConfig.health
	
	npc.PrimaryPart = humanoidRootPart
	npc.Parent = workspace
	
	table.insert(self.SpawnedNPCs, npc)
	return npc
end

-- Main spawner loop
function npcSpawner:Start()
	local spawnPoints = {
		Vector3.new(100, 5, 0),
		Vector3.new(-100, 5, 0),
		Vector3.new(0, 5, 100),
		Vector3.new(0, 5, -100),
	}
	
	while true do
		local randomSpawn = spawnPoints[math.random(1, #spawnPoints)]
		self:SpawnNPC(randomSpawn)
		
		-- Clean up dead NPCs
		for i = #self.SpawnedNPCs, 1, -1 do
			if not self.SpawnedNPCs[i]:FindFirstChild("Humanoid") or self.SpawnedNPCs[i].Humanoid.Health <= 0 then
				table.remove(self.SpawnedNPCs, i)
			end
		end
		
		wait(self.SpawnInterval)
	end
end

return npcSpawner
