-- @Date:   2020-08-08T13:05:44-04:00
-- @Last modified time: 2020-08-08T13:58:43-04:00


local f = CreateFrame("Frame",nil,UIParent)
f:SetFrameStrata("BACKGROUND")
f:SetWidth(128) -- Set these to whatever height/width is needed
f:SetHeight(128) -- for your Texture
f:SetPoint("TOPLEFT",0,0)
local t = f:CreateTexture(nil,"BACKGROUND")
t:SetColorTexture(1, 0, 0)
t:SetAllPoints(f)
f.texture = t
f:SetPoint("CENTER",0,0)
f:Show()

SLASH_POOL_PARTY1 = '/pp'
SLASH_POOL_PARTY2 = '/poolparty'
SlashCmdList["POOL_PARTY"] = function(msg)
	local subzone = GetMinimapZoneText();
	if (subzone == "Razor Hill" or subzone == "Bloodhoof Village") then
		t:SetColorTexture(0, 1, 0)
	end

	local honorKills, _, _ = GetPVPLifetimeStats();
	if honorKills >= 15 then
		t:SetColorTexture(0, 0, 1)
	end

end
