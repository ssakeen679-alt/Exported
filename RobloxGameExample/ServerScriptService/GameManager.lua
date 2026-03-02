-- GameManager: Manages core game logic, rounds, and events
local Players = game:GetService("Players")

local GameManager = {}

-- Game settings
GameManager.GameState = "Lobby" -- Lobby, Running, Intermission, GameOver
GameManager.RoundDuration = 300 -- 5 minutes
GameManager.LobbyWaitTime = 30 -- 30 seconds

-- Function to start a round
local function startRound()
	GameManager.GameState = "Running"
	print("Round started!")
	
	-- Teleport players to spawn locations
	local spawnLocations = workspace:FindPartBased("SpawnLocation") or {}
	local playerList = Players:GetPlayers()
	
	for i, player in pairs(playerList) do
		if player.Character and spawnLocations[i] then
			player.Character:SetPrimaryPartCFrame(spawnLocations[i].CFrame + Vector3.new(0, 3, 0))
		end
	end
end

-- Function to end the round
local function endRound()
	GameManager.GameState = "Intermission"
	print("Round ended!")
end

-- Function to check if game should start
local function checkGameStart()
	local playerCount = #Players:GetPlayers()
	if playerCount >= 2 then
		startRound()
	else
		print("Waiting for more players...")
	end
end

-- Connect to player events to check for game start
Players.PlayerAdded:Connect(function()
	if GameManager.GameState == "Lobby" then
		checkGameStart()
	end
end)

-- Main game loop
while true do
	wait(1)
	
	if GameManager.GameState == "Running" then
		-- Game logic loop
	elseif GameManager.GameState == "Lobby" then
		-- Lobby logic
	end
end

return GameManager
