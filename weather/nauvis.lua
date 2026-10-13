-- Nauvis: Gleba's rain and lowland fog, off by default. Vanilla assets only.
local nauvis = data.raw["planet"]["nauvis"]
if not nauvis then return end

-- Adds a sound to Nauvis's semi-persistent ambient sounds, keeping those already there.
local function add_semi_persistent(definition)
    nauvis.persistent_ambient_sounds = nauvis.persistent_ambient_sounds or {}
    local current = nauvis.persistent_ambient_sounds.semi_persistent
    ---@type table[]
    local list = {}
    if current and current.sound then
        list = {current}
    elseif current then
        for _, item in pairs(current) do table.insert(list, item) end
    end
    table.insert(list, definition)
    nauvis.persistent_ambient_sounds.semi_persistent = list
end

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
    add_semi_persistent({
        sound = {
            filename = "__space-age__/sound/world/weather/rain.ogg",
            volume = settings.startup["cwn-nauvis-rain-volume"].value,
            advanced_volume_control = {
                fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0}}}
            }
        }
    })
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

------ falling leaves ------
-- Particles of a tree's stateless visualisation follow the tree, so the leaves stay in forests. Vanilla living trees
-- only; other planets with the same trees get the leaves too.
if settings.startup["cwn-nauvis-falling-leaves"].value then
    local leaves = {
        count = 1,
        period = 600,
        probability = 0.25,
        offset_x = {-1, 1},
        offset_y = {-1, 0.5},
        offset_z = {1.5, 3},
        speed_x = {-0.01, 0.01},
        speed_y = {-0.003, 0.003},
        speed_z = -0.01,
        affected_by_wind = true,
        render_layer = "smoke",
        fade_in_progress_duration = 0.05,
        fade_out_progress_duration = 0.3,
        animation = {
            sheet = {
                filename = "__base__/graphics/particle/leaf-particle/new-leaf-particle.png",
                priority = "extra-high",
                line_length = 12,
                width = 26,
                height = 18,
                frame_count = 12,
                animation_speed = 0.3,
                variation_count = 10,
                tint = {0.55, 0.62, 0.25},
                scale = 0.5
            }
        }
    }
    for _, name in pairs({"tree-01", "tree-02", "tree-02-red", "tree-03", "tree-04", "tree-05", "tree-06",
        "tree-06-brown", "tree-07", "tree-08", "tree-08-brown", "tree-08-red", "tree-09", "tree-09-brown", "tree-09-red"}) do
        local tree = data.raw["tree"][name]
        if tree and tree.variations and not tree.stateless_visualisation_variations then
            -- one list of visualisations per tree variation
            local per_variation = {}
            for i = 1, #tree.variations do per_variation[i] = {leaves} end
            tree.stateless_visualisation_variations = per_variation
        end
    end
end

------ pollen ------
-- Same idea on grassland decoratives that no planet with water or Gleba's flora uses: pale flakes of Aquilo's snow
-- texture drifting up and away with the wind.
if settings.startup["cwn-nauvis-pollen"].value then
    local pollen = {
        count = 1,
        period = 900,
        probability = 0.15,
        offset_x = {-0.5, 0.5},
        offset_y = {-0.5, 0.5},
        offset_z = {0.2, 0.8},
        speed_x = {-0.006, 0.006},
        speed_y = {-0.004, 0.004},
        speed_z = 0.002,
        affected_by_wind = true,
        render_layer = "smoke",
        fade_in_progress_duration = 0.2,
        fade_out_progress_duration = 0.4,
        scale = {0.2, 0.35},
        animation = {
            sheet = {
                filename = "__space-age__/graphics/entity/snow/snow.png",
                priority = "high",
                line_length = 16,
                width = 64,
                height = 64,
                frame_count = 1,
                variation_count = 16,
                tint = {1, 0.95, 0.65, 0.7}
            }
        }
    }
    for _, name in pairs({"green-small-grass", "green-asterisk", "green-asterisk-mini"}) do
        local decorative = data.raw["optimized-decorative"][name]
        if decorative and decorative.render_layer ~= "decals" and not decorative.stateless_visualisation
            and not decorative.stateless_visualisation_variations then
            decorative.stateless_visualisation = pollen
        end
    end
end

------ golden hours ------
-- Warm light at sunset and dawn from the unused vanilla color lookups, unless another mod already set Nauvis's.
if settings.startup["cwn-nauvis-golden-hours"].value then
    nauvis.surface_render_parameters = nauvis.surface_render_parameters or {}
    if not nauvis.surface_render_parameters.day_night_cycle_color_lookup then
        -- vanilla times: the sun starts to set at 0.25, is set at 0.45, starts to rise at 0.55, is up at 0.75
        nauvis.surface_render_parameters.day_night_cycle_color_lookup = {
            {0.00, "identity"},
            {0.20, "identity"},
            {0.32, "__core__/graphics/color_luts/lut-sunset.png"},
            {0.45, "__core__/graphics/color_luts/lut-night.png"},
            {0.55, "__core__/graphics/color_luts/lut-night.png"},
            {0.68, "__core__/graphics/color_luts/lut-dawn.png"},
            {0.80, "identity"}
        }
    end
end

------ wind gusts ------
if settings.startup["cwn-nauvis-wind-gusts"].value then
    local variations = {}
    for i = 1, 6 do
        table.insert(variations, {filename = "__space-age__/sound/world/semi-persistent/wind-gust-" .. i .. ".ogg", volume = 0.3})
    end
    -- as on Gleba: a gust every 5 to 15 seconds
    add_semi_persistent({sound = {variations = variations}, delay_mean_seconds = 10, delay_variance_seconds = 5})
end
