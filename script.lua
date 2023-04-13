--[[
Blinking light system by sayori.

Configuartion
	General
		AffectLightObjectChildren - If true, changes the properties of any lights that are a child of the brick accordingly.
		BlinkDelay - Time between blinks.
		BlinkTime - Length of a blink.
		DisabledState - What state the light will enter if disabled.
		Enabled - Turns on or off the blinking light.
		GlobalDelay - How much the script is delayed in the for loop.
		OffColor - Self explanatory.
		OffMaterial - Self explanatory
		OnColor - Self explanatory.
		OnMaterial - Self explanatory.
]]--

-- Services --
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")

-- Constants --
--none lol

-- Functions -- 

local function GetProperties(Object)
	local Properties = {
		General = {
			AffectLightObjectChildren = Object.Configuration.General:GetAttribute("AffectLightObjectChildren"),
			BlinkDelay = Object.Configuration.General:GetAttribute("BlinkDelay"),
			BlinkTime = Object.Configuration.General:GetAttribute("BlinkTime"),
			DisabledState = Object.Configuration.General:GetAttribute("DisabledState"),
			Enabled = Object.Configuration.General:GetAttribute("Enabled"),
			GlobalDelay = Object.Configuration.General:GetAttribute("GlobalDelay"),
			OffColor = Object.Configuration.General:GetAttribute("OffColor"),
			OffMaterial = Object.Configuration.General:GetAttribute("OffMaterial"),
			OnColor = Object.Configuration.General:GetAttribute("OnColor"),
			OnMaterial = Object.Configuration.General:GetAttribute("OnMaterial")
		}
	}
	return Properties
end

-- Script --
for _, Object in pairs(CollectionService:GetTagged("Blinking Brick")) do
	local Brick = Object
	local BrickChildren = Brick:GetChildren()
	local Properties = GetProperties(Brick)
	--task.wait(Properties.General.GlobalDelay)
	
	while true do
		Properties = GetProperties(Brick)
		if Properties.General.Enabled then
			-- Do the actual script, will always start as ON
			Brick.Material = Enum.Material[Properties.General.OnMaterial]
			Brick.BrickColor = BrickColor.new(Properties.General.OnColor)
			task.wait(Properties.General.BlinkTime)
			Brick.Material = Enum.Material[Properties.General.OffMaterial]
			Brick.BrickColor = BrickColor.new(Properties.General.OffColor)
			task.wait(Properties.General.BlinkDelay)
		end
	end
end

