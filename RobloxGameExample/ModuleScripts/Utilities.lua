-- Utilities: General utility functions
local Utilities = {}

-- Function to get a random integer between min and max
function Utilities:RandomInt(min, max)
	return math.random(min, max)
end

-- Function to round a number to decimal places
function Utilities:Round(number, decimals)
	local multiplier = 10 ^ (decimals or 0)
	return math.floor(number * multiplier + 0.5) / multiplier
end

-- Function to check if a value is in a table
function Utilities:TableContains(table, value)
	for _, v in pairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

-- Function to merge two tables
function Utilities:MergeTables(table1, table2)
	local merged = {}
	for k, v in pairs(table1) do
		merged[k] = v
	end
	for k, v in pairs(table2) do
		merged[k] = v
	end
	return merged
end

-- Function to clone a table deeply
function Utilities:DeepCopy(obj)
	if type(obj) ~= "table" then
		return obj
	end
	local res = {}
	for k, v in pairs(obj) do
		res[self:DeepCopy(k)] = self:DeepCopy(v)
	end
	return res
end

-- Function to format time (seconds to MM:SS)
function Utilities:FormatTime(seconds)
	local minutes = math.floor(seconds / 60)
	local secs = seconds % 60
	return string.format("%02d:%02d", minutes, secs)
end

-- Function to tween a part to a new position
function Utilities:TweenPart(part, targetCFrame, duration)
	local tweenService = game:GetService("TweenService")
	local tweenInfo = TweenInfo.new(
		duration,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut
	)
	local tween = tweenService:Create(part, tweenInfo, {CFrame = targetCFrame})
	tween:Play()
	return tween
end

return Utilities
