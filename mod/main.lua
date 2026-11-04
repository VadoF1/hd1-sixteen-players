-- 16 Players: Obsidian Mod Manager entry script.
-- The mod's always-on part (build tag, 16-slot tables, crash fixes) and its patch code
-- are appended to the game's lua/network/network_global, which the mod replaces. This
-- script tells that code it runs under Obsidian and applies the patches from
-- obsidian.on_require, as each patched module loads. The patches are plain wraps, not
-- obsidian.hook: hooks switch off on any machine whose lobby is not cleared, which split
-- one lobby between modded and vanilla camera and spawns (0.7.0). The list below must
-- match the loader's `defines` table (export_16p_obsidian.py checks it).
local MOD16 = rawget(_G, "MOD16") or {}

rawset(_G, "MOD16", MOD16)
MOD16.obsidian = obsidian

local modules = {
	"lua/network/network_global",
	"lua/settings/game_settings",
	"lua/settings/difficulty_settings",
	"lua/managers/encounter_manager",
	"lua/managers/patrol_manager",
	"lua/hud/hud",
	"lua/components/camera_target_component",
	"lua/managers/camera_manager",
	"lua/components/interactable_npc_dialogue_component",
	"lua/managers/trophy_manager",
	"lua/states/state_menu",
	"lua/gui/hd_gui",
	"lua/components/seat_component",
	"lua/components/drop_pod_component",
	"lua/menu/menu_screen_provinggrounds_mission",
	"lua/managers/campaign_manager",
	"lua/states/state_mission_start",
	"lua/states/state_mission_end",
	"lua/components/objective_genocide_component",
	"lua/enemy_states/bug_boss_states",
	"lua/enemy_states/illuminate_boss_states",
	"lua/menu/menu_screen_campaign_multiplayer",
	"lua/menu/menu_screen_options",
	"lua/states/state_game",
}

local function sweep()
	if MOD16.sweep then
		MOD16.sweep()
	end
end

-- What the loader has done so far, for the mod's log.
local function report(when)
	local patched = {}

	for name in pairs(MOD16.applied or {}) do
		patched[#patched + 1] = name
	end

	table.sort(patched)
	obsidian.log(when .. ": loader " .. (MOD16.installed and (tostring(MOD16.version) .. " installed, camera " .. tostring(MOD16.camera)) or "not installed yet (this mod's lua/network/network_global has not run)") .. ", " .. #patched .. " modules patched: " .. table.concat(patched, ", "))
end

for _, name in ipairs(modules) do
	obsidian.on_require(name, function()
		sweep()

		if name == "lua/network/network_global" then
			report("network_global loaded")
		end
	end)
end

-- The options menu opens long after startup: say again what is patched by then.
obsidian.on_require("lua/menu/menu_screen_options", function()
	report("options menu script loaded")
end)

obsidian.on_session(function(on)
	if MOD16.session_changed then
		MOD16.session_changed(on)
	end
end)

obsidian.after_startup(function()
	local camera = obsidian.settings.get("camera")
	report("after startup")

	if MOD16.camera and camera ~= MOD16.camera then
		obsidian.log("camera option is " .. tostring(camera) .. " but the deployed scripts are " .. tostring(MOD16.camera) .. ": deploy again")
	end
end)

obsidian.log("16 Players entry started")
