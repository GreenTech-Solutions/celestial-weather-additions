local common_effects = require("common.common-effects")

------ PANGLIA ------
if true then
    local panglia_effects = table.deepcopy(data.raw["planet"]["panglia"].player_effects) or {}

    if settings.startup["shibadisaster-cwa-panglia-enable-sparks"].value then
        local panglia_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks.name = "panglia_sparks"
        panglia_sparks.color = {126.0/255.0, 255.0/255.0, 236.0/255.0}
        panglia_sparks.start_scale = 0.5
        panglia_sparks.end_scale = 1.0
        panglia_sparks.duration = 180
        panglia_sparks.fade_in_duration = 60
        panglia_sparks.fade_away_duration = 60
        panglia_sparks.render_layer = "smoke"
        panglia_sparks.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks.animation.frame_count = 1
        -- panglia_sparks.animation.line_length = 1
        -- panglia_sparks.animation.size = 512
        panglia_sparks.animation.blend_mode = "additive"
        data:extend({panglia_sparks})

        local panglia_weather_sparks = table.deepcopy(common_effects.cluster_particles)
        panglia_weather_sparks.action_delivery.source_effects.smoke_name = "panglia_sparks"
        panglia_weather_sparks.action_delivery.source_effects.speed = {0.0, -0.1}
        panglia_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks.action_delivery.source_effects.probability = 0.4

        table.insert(panglia_effects, panglia_weather_sparks)
    end


    if settings.startup["shibadisaster-cwa-panglia-enable-sparks"].value then
        local panglia_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks_small.name = "panglia_sparks_small"
        panglia_sparks_small.color = {126.0/255.0, 255.0/255.0, 166.0/255.0}
        panglia_sparks_small.start_scale = 0.25
        panglia_sparks_small.end_scale = 0.5
        panglia_sparks_small.duration = 180
        panglia_sparks_small.fade_in_duration = 60
        panglia_sparks_small.fade_away_duration = 60
        panglia_sparks_small.render_layer = "smoke"
        panglia_sparks_small.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks_small.animation.frame_count = 1
        -- panglia_sparks_small.animation.line_length = 1
        -- panglia_sparks_small.animation.size = 512
        panglia_sparks_small.animation.blend_mode = "additive"
        data:extend({panglia_sparks_small})

        local panglia_weather_sparks_small = table.deepcopy(common_effects.cluster_particles)
        panglia_weather_sparks_small.action_delivery.source_effects.smoke_name = "panglia_sparks_small"
        panglia_weather_sparks_small.action_delivery.source_effects.speed = {0.0, -0.15}
        panglia_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks_small.action_delivery.source_effects.probability = 0.8

        table.insert(panglia_effects, panglia_weather_sparks_small)
    end


    if settings.startup["shibadisaster-cwa-panglia-enable-sparks"].value then
        local panglia_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_sparks_large.name = "panglia_sparks_large"
        panglia_sparks_large.color = {126.0/255.0, 182.0/255.0, 255.0/255.0}
        panglia_sparks_large.start_scale = 1.0
        panglia_sparks_large.end_scale = 2.0
        panglia_sparks_large.duration = 180
        panglia_sparks_large.fade_in_duration = 60
        panglia_sparks_large.fade_away_duration = 60
        panglia_sparks_large.render_layer = "smoke"
        panglia_sparks_large.animation.filename = "__celestial-weather__/graphics/entity/fire-particles.png"
        -- panglia_sparks_large.animation.frame_count = 1
        -- panglia_sparks_large.animation.line_length = 1
        -- panglia_sparks_large.animation.size = 512
        panglia_sparks_large.animation.blend_mode = "additive"
        data:extend({panglia_sparks_large})

        local panglia_weather_sparks_large = table.deepcopy(common_effects.cluster_particles)
        panglia_weather_sparks_large.action_delivery.source_effects.smoke_name = "panglia_sparks_large"
        panglia_weather_sparks_large.action_delivery.source_effects.speed = {0.0, -0.05}
        panglia_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        panglia_weather_sparks_large.action_delivery.source_effects.probability = 0.4

        table.insert(panglia_effects, panglia_weather_sparks_large)
    end


    if settings.startup["shibadisaster-cwa-panglia-enable-clouds"].value then
        local panglia_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_cloud_a.name = "panglia_cloud_a"
        panglia_cloud_a.color = {191.0/255.0 * 0.15, 255.0/255.0 * 0.15, 126.0/255.0 * 0.15, 1.0}
        panglia_cloud_a.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-a.png"
        panglia_cloud_a.animation.frame_count = 1
        panglia_cloud_a.animation.size = 512
        panglia_cloud_a.start_scale = 2.0
        panglia_cloud_a.end_scale = 4.0
        panglia_cloud_a.duration = 480
        panglia_cloud_a.fade_in_duration = 240
        panglia_cloud_a.fade_away_duration = 240
        panglia_cloud_a.animation.blend_mode = "additive"
        data:extend({panglia_cloud_a})

        local panglia_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        panglia_weather_cloud_a.action_delivery.source_effects.smoke_name = "panglia_cloud_a"
        panglia_weather_cloud_a.action_delivery.source_effects.speed = {0.0, -0.03}
        panglia_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        panglia_weather_cloud_a.action_delivery.source_effects.probability = 0.025

        table.insert(panglia_effects, panglia_weather_cloud_a)


        local panglia_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_cloud_b.name = "panglia_cloud_b"
        panglia_cloud_b.color = {126.0/255.0 * 0.15, 255.0/255.0 * 0.15, 191.0/255.0 * 0.15, 1.0}
        panglia_cloud_b.animation.filename = "__celestial-weather-additions__/graphics/vfx/cloud-b.png"
        panglia_cloud_b.animation.frame_count = 1
        panglia_cloud_b.animation.size = 512
        panglia_cloud_b.start_scale = 2.0
        panglia_cloud_b.end_scale = 4.0
        panglia_cloud_b.duration = 480
        panglia_cloud_b.fade_in_duration = 240
        panglia_cloud_b.fade_away_duration = 240
        panglia_cloud_b.animation.blend_mode = "additive"
        data:extend({panglia_cloud_b})

        local panglia_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        panglia_weather_cloud_b.action_delivery.source_effects.smoke_name = "panglia_cloud_b"
        panglia_weather_cloud_b.action_delivery.source_effects.speed = {0.0, -0.04}
        panglia_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        panglia_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        panglia_weather_cloud_b.action_delivery.source_effects.probability = 0.025

        table.insert(panglia_effects, panglia_weather_cloud_b)
    end

    
    if settings.startup["shibadisaster-cwa-panglia-enable-dust"].value then
        local panglia_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        panglia_dust.name = "panglia_dust"
        panglia_dust.color = {126.0/255.0, 255.0/255.0, 236.0/255.0}
        panglia_dust.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png"
        data.extend({panglia_dust})

        local panglia_weather_dust = table.deepcopy(common_effects.cluster_particles)
        panglia_weather_dust.cluster_count = 2
        panglia_weather_dust.action_delivery.source_effects.smoke_name= "panglia_dust"
        panglia_weather_dust.action_delivery.source_effects.speed = {0.0, -0.32}
        panglia_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(panglia_effects, panglia_weather_dust)
    end


    if settings.startup["shibadisaster-cwa-panglia-enable-antilinear-fog"].value then
        local panglia_fog = table.deepcopy(common_effects.fog)
        panglia_fog.color1 = settings.startup["shibadisaster-cwa-panglia-antilinear-fog-color"].value
        panglia_fog.color2 = settings.startup["shibadisaster-cwa-panglia-antilinear-fog-color"].value
        -- panglia_fog.color1 = {255.0/255.0, 0.0/255.0, 0.0/255.0}
        -- panglia_fog.color2 = {255.0/255.0, 0.0/255.0, 0.0/255.0}
        panglia_fog.tick_factor = 0.00070 * settings.startup["shibadisaster-cwa-panglia-antilinear-fog-speed-multiplier"].value
        -- panglia_fog.shape_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/solid.png"
        panglia_fog.detail_noise_texture.filename = "__celestial-weather-additions__/graphics/vfx/tess-fog.png"
        panglia_fog.fog_type = "gleba"

        data.raw["planet"]["panglia"].surface_render_parameters = data.raw["planet"]["panglia"].surface_render_parameters or {}
        data.raw["planet"]["panglia"].surface_render_parameters.fog = panglia_fog

        if data.raw["tile"]["panglia_hidden_beacon_tile"] then data.raw["tile"]["panglia_hidden_beacon_tile"].lowland_fog = true end
        if data.raw["tile"]["panglia-wetland-light-dead-skin"] then data.raw["tile"]["panglia-wetland-light-dead-skin"].lowland_fog = false end
        if data.raw["tile"]["panglia-wetland-dead-skin"] then data.raw["tile"]["panglia-wetland-dead-skin"].lowland_fog = false end
    end


    if #panglia_effects >= 1 then
        data.raw["planet"]["panglia"].ticks_between_player_effects = 1
        data.raw["planet"]["panglia"].player_effects = panglia_effects
    end
end