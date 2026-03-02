-- PlayerManager: Handles player joining, leaving, and initialization
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local PlayerManager = {}

-- Function to initialize a player
local function onPlayerAdded(player)
	print(player.Name .. " has joined the game!")
	
	-- Create player data folder
	local playerData = Instance.new("Folder")
	playerData.Name = "Data"
	playerData.Parent = player
	
	-- Store player stats
	local stats = Instance.new("Folder")
	stats.Name = "Stats"
	stats.Parent = playerData
	
	local level = Instance.new("NumberValue")
	level.Name = "Level"
	level.Value = 1
	level.Parent = stats
	
	local experience = Instance.new("NumberValue")
	experience.Name = "Experience"
	experience.Value = 0
	experience.Parent = stats
	
	local gold = Instance.new("NumberValue")
	gold.Name = "Gold"
	gold.Value = 100
	gold.Parent = stats
	
	print(player.Name .. "'s data initialized!")
end

-- Function to clean up when player leaves
local function onPlayerRemoved(player)
	print(player.Name .. " has left the game!")
end

-- Connect events
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoved)

-- Initialize existing players
for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end

return PlayerManager
