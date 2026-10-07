local common_effects = require("common.common-effects")

------ RABBASCA ------
if true then
    local rabbasca_effects = table.deepcopy(data.raw["planet"]["rabbasca"].player_effects) or {}

    if settings.startup["shibadisaster-cwa-rabbasca-enable-fog"].value then
        local rabbasca_fog = table.deepcopy(common_effects.fog)
        rabbasca_fog.color1 = {64.0/255.0 * 1.0, 31.0/255.0 * 1.0, 126.0/255.0 * 1.0, 1.0 * 1.0}
        rabbasca_fog.color2 = {64.0/255.0 * 1.0, 31.0/255.0 * 1.0, 126.0/255.0 * 1.0, 1.0 * 1.0}
        -- rabbasca_fog.color1 = {255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 1.0 * 0.5}
        -- rabbasca_fog.color2 = {255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 255.0/255.0 * 0.5, 1.0 * 0.5}
        rabbasca_fog.tick_factor = 0.00003
        rabbasca_fog.detail_noise_texture.filename = "__celestial-weather-updated__/graphics/entity/dense-clouds.png"

        data.raw["planet"]["rabbasca"].surface_render_parameters["fog"] = rabbasca_fog
    end

    if settings.startup["shibadisaster-cwa-rabbasca-enable-clouds"].value then
        local rabbasca_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_cloud_a.name = "rabbasca_cloud_a"
        -- rabbasca_cloud_a.color = {64.0/255.0 * 0.25, 31.0/255.0 * 0.25, 126.0/255.0 * 0.25, 1.0 * 0.25}
        rabbasca_cloud_a.color = {34.0/255.0 * 0.2, 25.0/255.0 * 0.2, 63.0/255.0 * 0.2, 1.0 * 0.2}
        rabbasca_cloud_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        rabbasca_cloud_a.animation.frame_count = 1
        rabbasca_cloud_a.animation.size = 512
        rabbasca_cloud_a.animation.blend_mode = "additive"
        rabbasca_cloud_a.start_scale = 3.0
        rabbasca_cloud_a.end_scale = 5.0
        rabbasca_cloud_a.duration = 480
        rabbasca_cloud_a.fade_in_duration = 160
        rabbasca_cloud_a.fade_away_duration = 160
        data:extend({rabbasca_cloud_a})

        local rabbasca_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        rabbasca_weather_cloud_a.action_delivery.source_effects.smoke_name = "rabbasca_cloud_a"
        rabbasca_weather_cloud_a.action_delivery.source_effects.speed = {-0.04, 0.01}
        rabbasca_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        rabbasca_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        rabbasca_weather_cloud_a.action_delivery.source_effects.probability = 0.1

        table.insert(rabbasca_effects, rabbasca_weather_cloud_a)

        local rabbasca_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_cloud_b.name = "rabbasca_cloud_b"
        -- rabbasca_cloud_b.color = {41.0/255.0 * 0.25, 31.0/255.0 * 0.25, 126.0/255.0 * 0.25, 1.0 * 0.25}
        rabbasca_cloud_b.color = {57.0/255.0 * 0.2, 48.0/255.0 * 0.2, 63.0/255.0 * 0.2, 1.0 * 0.2}
        rabbasca_cloud_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-a.png"
        rabbasca_cloud_b.animation.frame_count = 1
        rabbasca_cloud_b.animation.size = 512
        rabbasca_cloud_b.animation.blend_mode = "additive"
        rabbasca_cloud_b.start_scale = 3.0
        rabbasca_cloud_b.end_scale = 5.0
        rabbasca_cloud_b.duration = 480
        rabbasca_cloud_b.fade_in_duration = 160
        rabbasca_cloud_b.fade_away_duration = 160
        data:extend({rabbasca_cloud_b})

        local rabbasca_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        rabbasca_weather_cloud_b.action_delivery.source_effects.smoke_name = "rabbasca_cloud_b"
        rabbasca_weather_cloud_b.action_delivery.source_effects.speed = {-0.05, -0.01}
        rabbasca_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        rabbasca_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        rabbasca_weather_cloud_b.action_delivery.source_effects.probability = 0.1

        table.insert(rabbasca_effects, rabbasca_weather_cloud_b)
    end


    if settings.startup["shibadisaster-cwa-rabbasca-enable-sparks"].value then
        local rabbasca_sparks = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_sparks.name = "rabbasca_sparks"
        rabbasca_sparks.color = settings.startup["shibadisaster-cwa-rabbasca-sparks-color"].value
        rabbasca_sparks.start_scale = 0.15
        rabbasca_sparks.end_scale = 0.15
        rabbasca_sparks.duration = 60
        rabbasca_sparks.fade_in_duration = 30
        rabbasca_sparks.fade_away_duration = 30
        rabbasca_sparks.render_layer = "smoke"
        rabbasca_sparks.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/pointy-spark-a.png"
        rabbasca_sparks.animation.frame_count = 100
        rabbasca_sparks.animation.line_length = 10
        rabbasca_sparks.animation.size = math.floor(2048 / 10)
        rabbasca_sparks.animation.animation_speed = 20.0
        rabbasca_sparks.animation.blend_mode = "additive"
        data:extend({rabbasca_sparks})

        local rabbasca_weather_sparks = table.deepcopy(common_effects.direct_particles)
        rabbasca_weather_sparks.action_delivery.source_effects.smoke_name = "rabbasca_sparks"
        rabbasca_weather_sparks.action_delivery.source_effects.speed = {0.0, 0.0}
        rabbasca_weather_sparks.action_delivery.source_effects.speed_multiplier = 1.0
        rabbasca_weather_sparks.action_delivery.source_effects.repeat_count = 1
        rabbasca_weather_sparks.action_delivery.source_effects.probability = 0.15

        table.insert(rabbasca_effects, rabbasca_weather_sparks)
    end


    if settings.startup["shibadisaster-cwa-rabbasca-enable-sparks"].value then
        local rabbasca_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_sparks_small.name = "rabbasca_sparks_small"
        rabbasca_sparks_small.color = settings.startup["shibadisaster-cwa-rabbasca-sparks-color"].value
        rabbasca_sparks_small.start_scale = 0.1
        rabbasca_sparks_small.end_scale = 0.1
        rabbasca_sparks_small.duration = 60
        rabbasca_sparks_small.fade_in_duration = 30
        rabbasca_sparks_small.fade_away_duration = 30
        rabbasca_sparks_small.render_layer = "smoke"
        rabbasca_sparks_small.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/pointy-spark-a.png"
        rabbasca_sparks_small.animation.frame_count = 100
        rabbasca_sparks_small.animation.line_length = 10
        rabbasca_sparks_small.animation.size = math.floor(2048 / 10)
        rabbasca_sparks_small.animation.animation_speed = 20.0
        rabbasca_sparks_small.animation.blend_mode = "additive"
        data:extend({rabbasca_sparks_small})

        local rabbasca_weather_sparks_small = table.deepcopy(common_effects.direct_particles)
        rabbasca_weather_sparks_small.action_delivery.source_effects.smoke_name = "rabbasca_sparks_small"
        rabbasca_weather_sparks_small.action_delivery.source_effects.speed = {0.0, 0.0}
        rabbasca_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        rabbasca_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        rabbasca_weather_sparks_small.action_delivery.source_effects.probability = 0.3

        table.insert(rabbasca_effects, rabbasca_weather_sparks_small)
    end


    if settings.startup["shibadisaster-cwa-rabbasca-enable-sparks"].value then
        local rabbasca_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_sparks_large.name = "rabbasca_sparks_large"
        rabbasca_sparks_large.color = settings.startup["shibadisaster-cwa-rabbasca-sparks-color"].value
        rabbasca_sparks_large.start_scale = 0.2
        rabbasca_sparks_large.end_scale = 0.2
        rabbasca_sparks_large.duration = 30
        rabbasca_sparks_large.fade_in_duration = 15
        rabbasca_sparks_large.fade_away_duration = 15
        rabbasca_sparks_large.render_layer = "smoke"
        rabbasca_sparks_large.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/pointy-spark-a.png"
        rabbasca_sparks_large.animation.frame_count = 100
        rabbasca_sparks_large.animation.line_length = 10
        rabbasca_sparks_large.animation.size = math.floor(2048 / 10)
        rabbasca_sparks_large.animation.animation_speed = 20.0
        rabbasca_sparks_large.animation.blend_mode = "additive"
        data:extend({rabbasca_sparks_large})

        local rabbasca_weather_sparks_large = table.deepcopy(common_effects.direct_particles)
        rabbasca_weather_sparks_large.action_delivery.source_effects.smoke_name = "rabbasca_sparks_large"
        rabbasca_weather_sparks_large.action_delivery.source_effects.speed = {0.0, 0.0}
        rabbasca_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        rabbasca_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        rabbasca_weather_sparks_large.action_delivery.source_effects.probability = 0.15

        table.insert(rabbasca_effects, rabbasca_weather_sparks_large)
    end


    if settings.startup["shibadisaster-cwa-rabbasca-enable-dust"].value then
        local rabbasca_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rabbasca_dust.name = "rabbasca_dust"
        rabbasca_dust.color = {0.4, 0.2, 0.4, 0.4}
        rabbasca_dust.start_scale = 2.0
        rabbasca_dust.end_scale = 2.0
        rabbasca_dust.animation.filename = "__celestial-weather-updated__/graphics/entity/sand-particles.png"
        data.extend({rabbasca_dust})

        local rabbasca_weather_dust = table.deepcopy(common_effects.cluster_particles)
        rabbasca_weather_dust.cluster_count = 2
        rabbasca_weather_dust.action_delivery.source_effects.smoke_name= "rabbasca_dust"
        rabbasca_weather_dust.action_delivery.source_effects.speed = {-0.35, 0.0}
        rabbasca_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(rabbasca_effects, rabbasca_weather_dust)
    end

    if #rabbasca_effects >= 1 then
        data.raw["planet"]["rabbasca"].ticks_between_player_effects = 1
        data.raw["planet"]["rabbasca"].player_effects = rabbasca_effects
    end
end