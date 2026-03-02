-- NPC: Basic NPC behavior script
local npc = script.Parent
local humanoid = npc:FindFirstChild("Humanoid")

-- NPC properties
local npcData = {
	name = npc.Name,
	health = 50,
	damage = 10,
	speed = 12,
	attackRange = 15,
	patrolRange = 50,
}

-- Set humanoid properties
if humanoid then
	humanoid.MaxHealth = npcData.health
	humanoid.Health = npcData.health
	humanoid.WalkSpeed = npcData.speed
end

local humanoidRootPart = npc:FindFirstChild("HumanoidRootPart")
local spawnPosition = humanoidRootPart and humanoidRootPart.Position or Vector3.new(0, 0, 0)

-- Patrol behavior
local function patrolNPC()
	while true do
		-- Pick random patrol position
		local randomOffset = Vector3.new(
			math.random(-npcData.patrolRange, npcData.patrolRange),
			0,
			math.random(-npcData.patrolRange, npcData.patrolRange)
		)
		local targetPosition = spawnPosition + randomOffset
		
		-- Move NPC
		humanoid:MoveTo(targetPosition)
		
		-- Wait for movement to complete or timeout
		local moveConnection
		wait(5)
	end
end

-- Combat behavior
local function findNearbyPlayers()
	local players = game:GetService("Players"):GetPlayers()
	local nearbyPlayers = {}
	
	for _, player in pairs(players) do
		if player.Character and humanoidRootPart then
			local distance = (humanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
			if distance < npcData.attackRange then
				table.insert(nearbyPlayers, player)
			end
		end
	end
	
	return nearbyPlayers
end

-- Handle NPC death
humanoid.Died:Connect(function()
	print(npc.Name .. " has been defeated!")
	wait(2)
	npc:Destroy()
end)

-- Main NPC loop
while true do
	local nearbyPlayers = findNearbyPlayers()
	
	if #nearbyPlayers > 0 then
		-- Attack nearby players
		for _, player in pairs(nearbyPlayers) do
			humanoid:MoveTo(player.Character.HumanoidRootPart.Position)
		end
	else
		-- Patrol
		patrolNPC()
	end
	
	wait(1)
end
