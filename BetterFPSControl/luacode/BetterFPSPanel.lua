BetterFPSPanel = class("BetterFPSPanel", import("view.Setting.panels.SettingsBasePanel"))

function BetterFPSPanel.GetUIName(slot0)
	return "SettingsStorySpeed"
end

function BetterFPSPanel.GetTitle(slot0)
	return i18n("Settings_title_FPS")
end

function BetterFPSPanel.GetTitleEn(slot0)
	return "  / FPS SETTING MOD"
end

BetterFPSPanel.fpsValues = {} 
BetterFPSPanel.fpsValues[1] = 30
BetterFPSPanel.fpsValues[2] = 60
BetterFPSPanel.fpsValues[3] = 90
BetterFPSPanel.fpsValues[4] = 144
function BetterFPSPanel.OnInit(slot0)
	slot0.btns = {}
	
	local parent = slot0._tf:Find("speeds")
	for i = 1, parent.childCount do
		slot6 = parent:GetChild(i - 1)

		onToggle(slot0, slot6, function (slot0)
			
			if slot0 then
				PlayerPrefs.SetInt("fps_limit", BetterFPSPanel.fpsValues[i])

				Application.targetFrameRate = BetterFPSPanel.fpsValues[i]
			end
			
		end, SFX_UI_TAG, SFX_UI_TAG)
		
		setText(slot6:Find("Text"), tostring(BetterFPSPanel.fpsValues[i]) .. i18n("word_frame"))

		slot0.btns[i] = slot6
	end
	
end

function BetterFPSPanel.OnUpdate(slot0)
	local fps = PlayerPrefs.GetInt("fps_limit", DevicePerformanceUtil.GetDefaultFps())
	
	local i = 1
	while i <= #BetterFPSPanel.fpsValues do
		i = i + 1
		if BetterFPSPanel.fpsValues[i] == fps then
			triggerToggle(slot0.btns[i], true)
			break
		end
	
	end
end