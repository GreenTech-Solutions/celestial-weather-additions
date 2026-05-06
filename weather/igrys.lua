local common_effects = require("common.common-effects")

------ IGRYS ------
if true then
    local igrys_effects = table.deepcopy(data.raw["planet"]["igrys"].player_effects) or {}


    if settings.startup["shibadisaster-cwa-igrys-enable-fog"].value then
        local igrys_fog = table.deepcopy(common_effects.fog)
        igrys_fog.color1 = settings.startup["shibadisaster-cwa-igrys-fog-color"].value
        igrys_fog.color2 = settings.startup["shibadisaster-cwa-igrys-fog-color"].value
        igrys_fog.tick_factor = 0.000005
        igrys_fog.detail_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/tess-fog.png"
        igrys_fog.fog_type = "gleba"

        data.raw["planet"]["igrys"].surface_render_parameters = data.raw["planet"]["igrys"].surface_render_parameters or {}
        data.raw["planet"]["igrys"].surface_render_parameters.fog = igrys_fog

        if data.raw["tile"]["igrys-light-oil"] then data.raw["tile"]["igrys-light-oil"].lowland_fog = true end
    end


    if settings.startup["shibadisaster-cwa-igrys-enable-clouds"].value then
        local igrys_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_cloud_a.name = "igrys_cloud_a"
        igrys_cloud_a.color = {177.0/255.0 * 0.2, 99.0/255.0 * 0.2, 20.0/255.0 * 0.2, 1.0 * 0.2}
        igrys_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-c.png"
        igrys_cloud_a.animation.frame_count = 1
        igrys_cloud_a.animation.size = 512
        igrys_cloud_a.animation.blend_mode = "additive"
        igrys_cloud_a.start_scale = 3.0
        igrys_cloud_a.end_scale = 5.0
        igrys_cloud_a.duration = 120
        igrys_cloud_a.fade_in_duration = 60
        igrys_cloud_a.fade_away_duration = 60
        data:extend({igrys_cloud_a})

        local igrys_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        igrys_weather_cloud_a.action_delivery.source_effects.smoke_name = "igrys_cloud_a"
        igrys_weather_cloud_a.action_delivery.source_effects.speed = {0.42, 0.0}
        igrys_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        igrys_weather_cloud_a.action_delivery.source_effects.probability = 0.1

        table.insert(igrys_effects, igrys_weather_cloud_a)

        local igrys_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_cloud_b.name = "igrys_cloud_b"
        igrys_cloud_b.color = {177.0/255.0 * 0.2, 138.0/255.0 * 0.2, 81.0/255.0 * 0.2, 1.0 * 0.2}
        igrys_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
        igrys_cloud_b.animation.frame_count = 1
        igrys_cloud_b.animation.size = 512
        igrys_cloud_b.animation.blend_mode = "additive"
        igrys_cloud_b.start_scale = 3.0
        igrys_cloud_b.end_scale = 5.0
        igrys_cloud_b.duration = 120
        igrys_cloud_b.fade_in_duration = 60
        igrys_cloud_b.fade_away_duration = 60
        data:extend({igrys_cloud_b})

        local igrys_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        igrys_weather_cloud_b.action_delivery.source_effects.smoke_name = "igrys_cloud_b"
        igrys_weather_cloud_b.action_delivery.source_effects.speed = {0.68, 0.0}
        igrys_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        igrys_weather_cloud_b.action_delivery.source_effects.probability = 0.1

        table.insert(igrys_effects, igrys_weather_cloud_b)
    end


    if settings.startup["shibadisaster-cwa-igrys-enable-sparkles"].value then
        local igrys_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks.name = "igrys_sparks"
        igrys_sparks.color = {1.0, 0.75, 0.5}
        igrys_sparks.start_scale = 0.25
        igrys_sparks.end_scale = 0.25
        igrys_sparks.duration = 60
        igrys_sparks.fade_in_duration = 20
        igrys_sparks.fade_away_duration = 20
        igrys_sparks.render_layer = "smoke"
        igrys_sparks.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks.animation.frame_count = 1
        igrys_sparks.animation.line_length = 1
        igrys_sparks.animation.size = 512
        igrys_sparks.animation.blend_mode = "additive"
        igrys_sparks.movement_slow_down_factor = 0.0
        data:extend({igrys_sparks})

        local igrys_weather_sparks = table.deepcopy(common_effects.direct_particles)
        igrys_weather_sparks.action_delivery.source_effects.smoke_name = "igrys_sparks"
        igrys_weather_sparks.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks.action_delivery.source_effects.probability = 0.2

        table.insert(igrys_effects, igrys_weather_sparks)
    end


    if settings.startup["shibadisaster-cwa-igrys-enable-sparkles"].value then
        local igrys_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks_small.name = "igrys_sparks_small"
        igrys_sparks_small.color = settings.startup["shibadisaster-cwa-igrys-sparkles-color"].value
        igrys_sparks_small.start_scale = 0.1
        igrys_sparks_small.end_scale = 0.1
        igrys_sparks_small.duration = 60
        igrys_sparks_small.fade_in_duration = 20
        igrys_sparks_small.fade_away_duration = 20
        igrys_sparks_small.render_layer = "smoke"
        igrys_sparks_small.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks_small.animation.frame_count = 1
        igrys_sparks_small.animation.line_length = 1
        igrys_sparks_small.animation.size = 512
        igrys_sparks_small.animation.blend_mode = "additive"
        igrys_sparks_small.movement_slow_down_factor = 0.0
        data:extend({igrys_sparks_small})

        local igrys_weather_sparks_small = table.deepcopy(common_effects.direct_particles)
        igrys_weather_sparks_small.action_delivery.source_effects.smoke_name = "igrys_sparks_small"
        igrys_weather_sparks_small.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks_small.action_delivery.source_effects.probability = 0.4

        table.insert(igrys_effects, igrys_weather_sparks_small)
    end


    if settings.startup["shibadisaster-cwa-igrys-enable-sparkles"].value then
        local igrys_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_sparks_large.name = "igrys_sparks_large"
        igrys_sparks_large.color = settings.startup["shibadisaster-cwa-igrys-sparkles-color"].value
        igrys_sparks_large.start_scale = 0.5
        igrys_sparks_large.end_scale = 0.5
        igrys_sparks_large.duration = 60
        igrys_sparks_large.fade_in_duration = 20
        igrys_sparks_large.fade_away_duration = 20
        igrys_sparks_large.render_layer = "smoke"
        igrys_sparks_large.animation.filename = "__celestial-weather-additions__/graphics/vfx/star-a.png"
        igrys_sparks_large.animation.frame_count = 1
        igrys_sparks_large.animation.line_length = 1
        igrys_sparks_large.animation.size = 512
        igrys_sparks_large.animation.blend_mode = "additive"
        igrys_sparks_large.movement_slow_down_factor = 0.0
        data:extend({igrys_sparks_large})

        local igrys_weather_sparks_large = table.deepcopy(common_effects.direct_particles)
        igrys_weather_sparks_large.action_delivery.source_effects.smoke_name = "igrys_sparks_large"
        igrys_weather_sparks_large.action_delivery.source_effects.speed = {0.0, 0.0}
        igrys_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        igrys_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        igrys_weather_sparks_large.action_delivery.source_effects.probability = 0.2

        table.insert(igrys_effects, igrys_weather_sparks_large)
    end


    if settings.startup["shibadisaster-cwa-igrys-enable-dust"].value then
        local igrys_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        igrys_dust.name = "igrys_dust"
        igrys_dust.color = {1.0, 0.875, 0.75}
        igrys_dust.start_scale = 2.0
        igrys_dust.end_scale = 2.0
        igrys_dust.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png"
        igrys_dust.movement_slow_down_factor = 1.0
        data.extend({igrys_dust})

        local igrys_weather_dust = table.deepcopy(common_effects.cluster_particles)
        igrys_weather_dust.cluster_count = 2
        igrys_weather_dust.action_delivery.source_effects.smoke_name= "igrys_dust"
        igrys_weather_dust.action_delivery.source_effects.speed = {0.25, 0.0}
        igrys_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(igrys_effects, igrys_weather_dust)
    end

    if #igrys_effects >= 1 then
        data.raw["planet"]["igrys"].ticks_between_player_effects = 1
        data.raw["planet"]["igrys"].player_effects = igrys_effects
    end
end