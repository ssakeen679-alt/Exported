-- Constants: Shared constants used across the game
local Constants = {}

-- Character constants
Constants.WALK_SPEED = 16
Constants.JUMP_POWER = 50
Constants.DEFAULT_HEALTH = 100

-- Combat constants
Constants.ATTACK_COOLDOWN = 1
Constants.BASE_DAMAGE = 25
Constants.CRITICAL_DAMAGE_MULTIPLIER = 1.5
Constants.CRITICAL_CHANCE = 0.2 -- 20%

-- Experience constants
Constants.BASE_EXP = 100
Constants.EXP_PER_LEVEL = 500
Constants.MAX_LEVEL = 50

-- Gameplay constants
Constants.GAME_VERSION = "1.0.0"
Constants.MAX_PLAYERS = 10
Constants.MIN_PLAYERS = 2

-- Team colors
Constants.TEAM_COLORS = {
	Red = Color3.fromRGB(255, 0, 0),
	Blue = Color3.fromRGB(0, 0, 255),
	Green = Color3.fromRGB(0, 255, 0),
	Yellow = Color3.fromRGB(255, 255, 0)
}

return Constants
