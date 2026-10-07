local common_effects = require("common.common-effects")

------ KHEMIA ------
if true then
    local khemia_effects = table.deepcopy(data.raw["planet"]["alchemy-planet"].player_effects) or {}


    if settings.startup["shibadisaster-cwa-khemia-enable-dust"].value then
        local khemia_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_dust.name = "khemia_dust"
        khemia_dust.color = {1.0, 0.875, 0.75}
        khemia_dust.animation.filename = "__celestial-weather-updated__/graphics/entity/sand-particles.png"
        data.extend({khemia_dust})

        local khemia_weather_dust = table.deepcopy(common_effects.cluster_particles)
        khemia_weather_dust.cluster_count = 2
        khemia_weather_dust.action_delivery.source_effects.smoke_name= "khemia_dust"
        khemia_weather_dust.action_delivery.source_effects.speed = {0.0, -0.32}
        khemia_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(khemia_effects, khemia_weather_dust)
    end


    if settings.startup["shibadisaster-cwa-khemia-enable-sparkles"].value then
        local khemia_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_sparks.name = "khemia_sparks"
        khemia_sparks.color = settings.startup["shibadisaster-cwa-khemia-sparkles-color"].value
        khemia_sparks.start_scale = 0.25
        khemia_sparks.end_scale = 0.25
        khemia_sparks.duration = 60
        khemia_sparks.fade_in_duration = 20
        khemia_sparks.fade_away_duration = 20
        khemia_sparks.render_layer = "smoke"
        khemia_sparks.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/star-a.png"
        khemia_sparks.animation.frame_count = 1
        khemia_sparks.animation.line_length = 1
        khemia_sparks.animation.size = 512
        khemia_sparks.animation.blend_mode = "additive"
        data:extend({khemia_sparks})

        local khemia_weather_sparks = table.deepcopy(common_effects.direct_particles)
        khemia_weather_sparks.action_delivery.source_effects.smoke_name = "khemia_sparks"
        khemia_weather_sparks.action_delivery.source_effects.speed = {0.0, -0.16}
        khemia_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        khemia_weather_sparks.action_delivery.source_effects.repeat_count = 1
        khemia_weather_sparks.action_delivery.source_effects.probability = 0.2

        table.insert(khemia_effects, khemia_weather_sparks)
    end


    if settings.startup["shibadisaster-cwa-khemia-enable-sparkles"].value then
        local khemia_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_sparks_small.name = "khemia_sparks_small"
        khemia_sparks_small.color = settings.startup["shibadisaster-cwa-khemia-sparkles-color"].value
        khemia_sparks_small.start_scale = 0.1
        khemia_sparks_small.end_scale = 0.1
        khemia_sparks_small.duration = 60
        khemia_sparks_small.fade_in_duration = 20
        khemia_sparks_small.fade_away_duration = 20
        khemia_sparks_small.render_layer = "smoke"
        khemia_sparks_small.animation.blend_mode = "additive"
        khemia_sparks_small.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/star-a.png"
        khemia_sparks_small.animation.frame_count = 1
        khemia_sparks_small.animation.line_length = 1
        khemia_sparks_small.animation.size = 512
        data:extend({khemia_sparks_small})

        local khemia_weather_sparks_small = table.deepcopy(common_effects.direct_particles)
        khemia_weather_sparks_small.action_delivery.source_effects.smoke_name = "khemia_sparks_small"
        khemia_weather_sparks_small.action_delivery.source_effects.speed = {0.0, -0.19}
        khemia_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        khemia_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        khemia_weather_sparks_small.action_delivery.source_effects.probability = 0.2

        table.insert(khemia_effects, khemia_weather_sparks_small)
    end


    if settings.startup["shibadisaster-cwa-khemia-enable-sparkles"].value then
        local khemia_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_sparks_large.name = "khemia_sparks_large"
        khemia_sparks_large.color = settings.startup["shibadisaster-cwa-khemia-sparkles-color"].value
        khemia_sparks_large.start_scale = 0.4
        khemia_sparks_large.end_scale = 0.4
        khemia_sparks_large.duration = 60
        khemia_sparks_large.fade_in_duration = 20
        khemia_sparks_large.fade_away_duration = 20
        khemia_sparks_large.render_layer = "smoke"
        khemia_sparks_large.animation.blend_mode = "additive"
        khemia_sparks_large.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/star-a.png"
        khemia_sparks_large.animation.frame_count = 1
        khemia_sparks_large.animation.line_length = 1
        khemia_sparks_large.animation.size = 512
        data:extend({khemia_sparks_large})

        local khemia_weather_sparks_large = table.deepcopy(common_effects.direct_particles)
        khemia_weather_sparks_large.action_delivery.source_effects.smoke_name = "khemia_sparks_large"
        khemia_weather_sparks_large.action_delivery.source_effects.speed = {0.0, -0.16}
        khemia_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        khemia_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        khemia_weather_sparks_large.action_delivery.source_effects.probability = 0.2

        table.insert(khemia_effects, khemia_weather_sparks_large)
    end

    
    if settings.startup["shibadisaster-cwa-khemia-enable-clouds"].value then
        local khemia_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_cloud_a.name = "khemia_cloud_a"
        khemia_cloud_a.color = {255.0/255.0 * 0.2, 192.0/255.0 * 0.2, 224.0/255.0 * 0.2, 1.0 * 0.2}
        khemia_cloud_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        khemia_cloud_a.animation.frame_count = 1
        khemia_cloud_a.animation.size = 512
        khemia_cloud_a.start_scale = 3.0
        khemia_cloud_a.end_scale = 5.0
        khemia_cloud_a.duration = 300
        khemia_cloud_a.fade_in_duration = 100
        khemia_cloud_a.fade_away_duration = 100
        data:extend({khemia_cloud_a})

        local khemia_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        khemia_weather_cloud_a.action_delivery.source_effects.smoke_name = "khemia_cloud_a"
        khemia_weather_cloud_a.action_delivery.source_effects.speed = {0.0, -0.04}
        khemia_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        khemia_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        khemia_weather_cloud_a.action_delivery.source_effects.probability = 0.05

        table.insert(khemia_effects, khemia_weather_cloud_a)
    end


    if settings.startup["shibadisaster-cwa-khemia-enable-clouds"].value then
        local khemia_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        khemia_cloud_b.name = "khemia_cloud_b"
        khemia_cloud_b.color = {255.0/255.0 * 0.2, 192.0/255.0 * 0.2, 224.0/255.0 * 0.2, 1.0 * 0.2}
        khemia_cloud_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-a.png"
        khemia_cloud_b.animation.frame_count = 1
        khemia_cloud_b.animation.size = 512
        khemia_cloud_b.start_scale = 3.0
        khemia_cloud_b.end_scale = 5.0
        khemia_cloud_b.duration = 300
        khemia_cloud_b.fade_in_duration = 100
        khemia_cloud_b.fade_away_duration = 100
        data:extend({khemia_cloud_b})

        local khemia_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        khemia_weather_cloud_a.action_delivery.source_effects.smoke_name = "khemia_cloud_b"
        khemia_weather_cloud_a.action_delivery.source_effects.speed = {0.0, -0.03}
        khemia_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        khemia_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        khemia_weather_cloud_a.action_delivery.source_effects.probability = 0.05

        table.insert(khemia_effects, khemia_weather_cloud_a)
    end


    if settings.startup["shibadisaster-cwa-khemia-enable-fog"].value then
        local khemia_fog = table.deepcopy(common_effects.fog)
        khemia_fog.color1 = settings.startup["shibadisaster-cwa-khemia-fog-color"].value
        khemia_fog.color2 = settings.startup["shibadisaster-cwa-khemia-fog-color"].value
        khemia_fog.tick_factor = 0.000001
        khemia_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/vfx/tess-fog.png"
        khemia_fog.fog_type = "gleba"

        data.raw["planet"]["alchemy-planet"].surface_render_parameters = data.raw["planet"]["alchemy-planet"].surface_render_parameters or {}
        data.raw["planet"]["alchemy-planet"].surface_render_parameters.fog = khemia_fog

        if data.raw["tile"]["dark-sandy-rocks"] then data.raw["tile"]["dark-sandy-rocks"].lowland_fog = true end
        if data.raw["tile"]["red-sandy-rocks"] then data.raw["tile"]["red-sandy-rocks"].lowland_fog = true end
        if data.raw["tile"]["tan-sandy-rocks"] then data.raw["tile"]["tan-sandy-rocks"].lowland_fog = true end
    end

    if #khemia_effects >= 1 then
        data.raw["planet"]["alchemy-planet"].ticks_between_player_effects = 1
        data.raw["planet"]["alchemy-planet"].player_effects = khemia_effects
    end
end