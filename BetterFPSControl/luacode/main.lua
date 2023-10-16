function BetterFPSPanel_removeFromTable(tab, element)
    for i, value in ipairs(tab) do
        if value == element then
            table.remove(tab, i)
            break
        end
    end
end




local BetterFPSPanel_old_SettingsOptionPage_GetPanels = SettingsOptionPage.GetPanels

function BetterFPSPanel_new_SettingsOptionPage_GetPanels(slot0)
	slot1 = BetterFPSPanel_old_SettingsOptionPage_GetPanels(slot0)

	BetterFPSPanel_removeFromTable(slot1,SettingsFpsPanle)

	table.insert(slot1, 2, wondongo_panel)
	return slot1
end
SettingsOptionPage.GetPanels=BetterFPSPanel_new_SettingsOptionPage_GetPanels


