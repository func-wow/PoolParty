-- @Date:   2020-08-08T13:05:44-04:00
-- @Last modified time: 2020-08-30 21:08:67


local locFrame, locEvents = CreateFrame("Frame", nil, UIParent), {}
locFrame:SetFrameStrata("BACKGROUND")
locFrame:SetWidth(128) -- Set these to whatever height/width is needed
locFrame:SetHeight(64) -- for your Texture
locFrame:SetPoint("LEFT", 0 , 32)
local locTexture = locFrame:CreateTexture(nil, "BACKGROUND")
locTexture:SetColorTexture(0, 0, 0)
locTexture:SetAllPoints(locFrame)
locFrame.texture = locTexture
locFrame:Show()

local pvpFrame, pvpEvents = CreateFrame("Frame", nil, UIParent), {}
pvpFrame:SetFrameStrata("BACKGROUND")
pvpFrame:SetWidth(128) -- Set these to whatever height/width is needed
pvpFrame:SetHeight(64) -- for your Texture
pvpFrame:SetPoint("LEFT", 0, -32)
local pvpTexture = pvpFrame:CreateTexture(nil, "BACKGROUND")
pvpTexture:SetColorTexture(0, 0, 0)
pvpTexture:SetAllPoints(pvpFrame)
pvpFrame.texture = pvpTexture
pvpFrame:Show()

local ingameFrame, ingameEvents = CreateFrame("Frame", nil, UIParent), {}
ingameFrame:SetFrameStrata("BACKGROUND")
ingameFrame:SetWidth(128) -- Set these to whatever height/width is needed
ingameFrame:SetHeight(64) -- for your Texture
ingameFrame:SetPoint("LEFT", 0, 96)
local ingameTexture = ingameFrame:CreateTexture(nil, "BACKGROUND")
ingameTexture:SetColorTexture(0, 0, 0)
ingameTexture:SetAllPoints(ingameFrame)
ingameFrame.texture = ingameTexture
ingameFrame:Show()

local deadFrame, deadEvents = CreateFrame("Frame", nil, UIParent), {};
deadFrame:SetFrameStrata("BACKGROUND")
deadFrame:SetWidth(128) -- Set these to whatever height/width is needed
deadFrame:SetHeight(64) -- for your Texture
deadFrame:SetPoint("LEFT", 0, -96)
local deadTexture = deadFrame:CreateTexture(nil, "BACKGROUND")
deadTexture:SetColorTexture(0, 0, 0)
deadTexture:SetAllPoints(deadFrame)
deadFrame.texture = deadTexture
deadFrame:Show()


function locEvents:ZONE_CHANGED(...)
	local subzone = GetMinimapZoneText()
	if (subzone == "Razor Hill" or subzone == "Bloodhoof Village") then
		locTexture:SetColorTexture(1, 1, 1)
	else
		locTexture:SetColorTexture(0, 0, 0)
	end
end
locFrame:SetScript("OnEvent", function(self, event, ...)
 	locEvents[event](self, ...) -- call one of the functions above
end)
for k, v in pairs(locEvents) do
 	locFrame:RegisterEvent(k) -- Register all events for which handlers have been defined
end


function pvpEvents:PLAYER_PVP_KILLS_CHANGED(...)
	local honorKills, _, _ = GetPVPLifetimeStats()
	local shade = honorKills/15
	pvpTexture:SetColorTexture(shade, shade , shade)
end
pvpFrame:SetScript("OnEvent", function(self, event, ...)
 	pvpEvents[event](self, ...) -- call one of the functions above
end)
for k, v in pairs(pvpEvents) do
 	pvpFrame:RegisterEvent(k) -- Register all events for which handlers have been defined
end



function ingameEvents:PLAYER_ENTERING_WORLD(...)
 	ingameTexture:SetColorTexture(1, 1, 1)
end
ingameFrame:SetScript("OnEvent", function(self, event, ...)
 	ingameEvents[event](self, ...) -- call one of the functions above
end)
for k, v in pairs(ingameEvents) do
 	ingameFrame:RegisterEvent(k) -- Register all events for which handlers have been defined
end


function deadEvents:PLAYER_DEAD(...)
 	deadTexture:SetColorTexture(1, 1, 1)
end
function deadEvents:PLAYER_UNGHOST(...)
	deadTexture:SetColorTexture(0, 0, 0)
end
deadFrame:SetScript("OnEvent", function(self, event, ...)
 	deadEvents[event](self, ...) -- call one of the functions above
end)
for k, v in pairs(deadEvents) do
 	deadFrame:RegisterEvent(k) -- Register all events for which handlers have been defined
end
