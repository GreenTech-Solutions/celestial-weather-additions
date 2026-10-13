-- Nauvis: Gleba's rain and lowland fog, off by default. Vanilla assets only.
local nauvis = data.raw["planet"]["nauvis"]
if not nauvis then return end

------ rain ------
if settings.startup["cwn-nauvis-rain"].value then
    -- the rain of Gleba (space-age/prototypes/planet/planet.lua, player_effects), with an adjustable amount
    local rain = {
        type = "cluster",
        cluster_count = settings.startup["cwn-nauvis-rain-amount"].value,
        distance = 8,
        distance_deviation = 8,
        action_delivery = {
            type = "instant",
            source_effects = {
                type = "create-trivial-smoke",
                smoke_name = "gleba-raindrops",
                speed = {-0.05, 0.5},
                initial_height = 1,
                speed_multiplier = 2,
                speed_multiplier_deviation = 0.05,
                starting_frame = 2,
                starting_frame_deviation = 2,
                offset_deviation = {{-96, -56}, {96, 40}},
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.02
            }
        }
    }

    local effects = nauvis.player_effects
    if not effects then
        effects = {}
    elseif effects.type then
        effects = {effects}
    end
    table.insert(effects, rain)
    nauvis.player_effects = effects
    nauvis.ticks_between_player_effects = nauvis.ticks_between_player_effects or 1

    -- the rain sound of Gleba, louder as the player zooms in
    nauvis.persistent_ambient_sounds = nauvis.persistent_ambient_sounds or {}
    local sounds = nauvis.persistent_ambient_sounds.semi_persistent
    if not sounds then
        sounds = {}
    elseif sounds.sound then
        sounds = {sounds}
    end
    table.insert(sounds, {
        sound = {
            filename = "__space-age__/sound/world/weather/rain.ogg",
            volume = settings.startup["cwn-nauvis-rain-volume"].value,
            advanced_volume_control = {
                fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0}}}
            }
        }
    })
    nauvis.persistent_ambient_sounds.semi_persistent = sounds
end

------ lowland fog ------
-- Gleba-type fog is drawn per chunk over tiles with lowland_fog. The flag belongs to the tile, not the planet:
-- deepwater is on no other planet with this fog type, water is also on Pelagos.
local deepwater_fog = settings.startup["cwn-nauvis-deepwater-fog"].value
local water_fog = settings.startup["cwn-nauvis-water-fog"].value
if deepwater_fog or water_fog then
    nauvis.surface_render_parameters = nauvis.surface_render_parameters or {}
    if not nauvis.surface_render_parameters.fog then
        nauvis.surface_render_parameters.fog = {
            fog_type = "gleba",
            shape_noise_texture = {
                filename = "__core__/graphics/clouds-noise.png",
                color_channels = 3,
                size = 2048
            },
            detail_noise_texture = {
                filename = "__core__/graphics/clouds-detail-noise.png",
                color_channels = 1,
                size = 2048
            },
            -- grey-blue instead of Gleba's yellow-green
            color1 = {0.80, 0.85, 0.90, 1.0},
            color2 = {0.68, 0.76, 0.82, 1.0},
            tick_factor = 0.000001
        }
    end

    local tiles = {}
    if deepwater_fog then
        table.insert(tiles, "deepwater")
        table.insert(tiles, "deepwater-green")
    end
    if water_fog then
        table.insert(tiles, "water")
        table.insert(tiles, "water-green")
    end
    for _, name in pairs(tiles) do
        if data.raw["tile"][name] then data.raw["tile"][name].lowland_fog = true end
    end
end
