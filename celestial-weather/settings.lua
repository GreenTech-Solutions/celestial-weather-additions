-- Vanilla planets, then the planets of other mods: their settings only show when the planet mod is installed.
data:extend({
	{
		type = "bool-setting",
		name = "enable-fulgora-weather",
		setting_type = "startup",
		default_value = true,
		order = "a",
	},{
		type = "double-setting",
		name = "fulgora-particle-amount",
		setting_type = "startup",
		default_value = 6,
		order = "a",
	},{
		type = "double-setting",
		name = "fulgora-particle-speed",
		setting_type = "startup",
		default_value = 1,
		order = "a",
	},


	{
		type = "bool-setting",
		name = "enable-aquilo-weather",
		setting_type = "startup",
		default_value = true,
		order = "d",
	},{
		type = "double-setting",
		name = "aquilo-particle-amount",
		setting_type = "startup",
		default_value = 35,
		order = "d",
	},{
		type = "double-setting",
		name = "aquilo-particle-speed",
		setting_type = "startup",
		default_value = 0.7,
		order = "d",
	},


	{
		type = "bool-setting",
		name = "enable-vulcanus-weather-ash",
		setting_type = "startup",
		default_value = true,
		order = "j",
	},{
		type = "double-setting",
		name = "vulcanus-ash-particle-speed",
		setting_type = "startup",
		default_value = 0.2,
		order = "j",
	},{
		type = "bool-setting",
		name = "enable-vulcanus-weather-rain",
		setting_type = "startup",
		default_value = true,
		order = "j",
	},{
		type = "double-setting",
		name = "vulcanus-rain-particle-speed",
		setting_type = "startup",
		default_value = 2.5,
		order = "j",
	},{
		type = "bool-setting",
		name = "enable-vulcanus-weather-fire",
		setting_type = "startup",
		default_value = true,
		order = "j",
	},{
		type = "double-setting",
		name = "vulcanus-fire-particle-speed",
		setting_type = "startup",
		default_value = 0.04,
		order = "j",
	}
})

if mods["Moshine"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-moshine-weather-sand",
		setting_type = "startup",
		default_value = true,
		order = "b",
	},{
		type = "double-setting",
		name = "moshine-sand-particle-amount",
		setting_type = "startup",
		default_value = 6,
		order = "b",
	},{
		type = "double-setting",
		name = "moshine-sand-particle-speed",
		setting_type = "startup",
		default_value = 1,
		order = "b",
	},{
		type = "bool-setting",
		name = "enable-moshine-weather-fire",
		setting_type = "startup",
		default_value = true,
		order = "b",
	},{
		type = "double-setting",
		name = "moshine-fire-particle-speed",
		setting_type = "startup",
		default_value = 0.04,
		order = "b",
	},
})
end

if mods["corrundum"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-corrundum-weather-sand",
		setting_type = "startup",
		default_value = true,
		order = "c",
	},{
		type = "double-setting",
		name = "corrundum-sand-particle-amount",
		setting_type = "startup",
		default_value = 8,
		order = "c",
	},{
		type = "double-setting",
		name = "corrundum-sand-particle-speed",
		setting_type = "startup",
		default_value = 1.2,
		order = "c",
	},{
		type = "bool-setting",
		name = "enable-corrundum-weather-rain",
		setting_type = "startup",
		default_value = true,
		order = "c",
	},{
		type = "double-setting",
		name = "corrundum-rain-particle-speed",
		setting_type = "startup",
		default_value = 2.0,
		order = "c",
	},
})
end

if mods["secretas"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-frozeta-weather",
		setting_type = "startup",
		default_value = true,
		order = "d",
	},{
		type = "double-setting",
		name = "frozeta-particle-amount",
		setting_type = "startup",
		default_value = 200,
		order = "d",
	},{
		type = "double-setting",
		name = "frozeta-particle-speed",
		setting_type = "startup",
		default_value = 1.0,
		order = "d",
	},
})
end

if mods["Paracelsin"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-paracelsin-weather",
		setting_type = "startup",
		default_value = true,
		order = "e",
	},{
		type = "double-setting",
		name = "paracelsin-particle-amount",
		setting_type = "startup",
		default_value = 40,
		order = "e",
	},{
		type = "double-setting",
		name = "paracelsin-particle-speed",
		setting_type = "startup",
		default_value = 0.7,
		order = "e",
	},
})
end

if mods["dea-dia-system"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-lemures-weather",
		setting_type = "startup",
		default_value = true,
		order = "f",
	},{
		type = "double-setting",
		name = "lemures-particle-amount",
		setting_type = "startup",
		default_value = 80,
		order = "f",
	},{
		type = "double-setting",
		name = "lemures-particle-speed",
		setting_type = "startup",
		default_value = 0.9,
		order = "f",
	},
})
end

if mods["metal-and-stars"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-nix-weather",
		setting_type = "startup",
		default_value = true,
		order = "g",
	},{
		type = "double-setting",
		name = "nix-particle-amount",
		setting_type = "startup",
		default_value = 60,
		order = "g",
	},{
		type = "double-setting",
		name = "nix-particle-speed",
		setting_type = "startup",
		default_value = 0.7,
		order = "g",
	},
})
end

if mods["planet-muluna"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-muluna-weather",
		setting_type = "startup",
		default_value = true,
		order = "h",
	},{
		type = "double-setting",
		name = "muluna-particle-amount",
		setting_type = "startup",
		default_value = 2,
		order = "h",
	},{
		type = "double-setting",
		name = "muluna-particle-speed",
		setting_type = "startup",
		default_value = 0.2,
		order = "h",
	},
})
end

if mods["lignumis"] then
data:extend({
	{
		type = "bool-setting",
		name = "enable-lignumis-weather",
		setting_type = "startup",
		default_value = true,
		order = "i",
	},{
		type = "double-setting",
		name = "lignumis-particle-speed",
		setting_type = "startup",
		default_value = 2.5,
		order = "i",
	},
})
end
