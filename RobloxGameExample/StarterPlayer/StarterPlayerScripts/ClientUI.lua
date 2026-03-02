-- ClientUI: Manages the player's user interface
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local camera = workspace.CurrentCamera

-- Create main UI frame
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create health bar
local healthBarBg = Instance.new("Frame")
healthBarBg.Name = "HealthBar"
healthBarBg.Size = UDim2.new(0, 200, 0, 30)
healthBarBg.Position = UDim2.new(0, 10, 0, 10)
healthBarBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
healthBarBg.Parent = screenGui

local healthBarFill = Instance.new("Frame")
healthBarFill.Name = "HealthFill"
healthBarFill.Size = UDim2.new(1, 0, 1, 0)
healthBarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
healthBarFill.Parent = healthBarBg

local healthText = Instance.new("TextLabel")
healthText.Name = "HealthText"
healthText.Size = UDim2.new(1, 0, 1, 0)
healthText.BackgroundTransparency = 1
healthText.TextColor3 = Color3.fromRGB(255, 255, 255)
healthText.Text = "100/100"
healthText.Parent = healthBarBg

-- Create info panel
local infoPanel = Instance.new("Frame")
infoPanel.Name = "InfoPanel"
infoPanel.Size = UDim2.new(0, 250, 0, 150)
infoPanel.Position = UDim2.new(1, -260, 0, 10)
infoPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
infoPanel.BorderSizePixel = 1
infoPanel.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
titleLabel.Text = "Game Info"
titleLabel.Parent = infoPanel

local gameInfoLabel = Instance.new("TextLabel")
gameInfoLabel.Name = "GameInfo"
gameInfoLabel.Size = UDim2.new(1, 0, 1, -30)
gameInfoLabel.Position = UDim2.new(0, 0, 0, 30)
gameInfoLabel.BackgroundTransparency = 1
gameInfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gameInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
gameInfoLabel.TextYAlignment = Enum.TextYAlignment.Top
gameInfoLabel.Text = "Welcome to the game!\n\nControls:\nW/A/S/D - Move\nSpace - Jump\nE - Attack"
gameInfoLabel.Parent = infoPanel

print("UI initialized!")
