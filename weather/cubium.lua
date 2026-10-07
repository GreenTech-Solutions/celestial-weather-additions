local common_effects = require("common.common-effects")

------ CUBIUM ------
if true then
    local cubium_effects = table.deepcopy(data.raw["planet"]["cubium"].player_effects) or {}

    if settings.startup["shibadisaster-cwa-cubium-enable-clouds"].value then
        local cubium_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        cubium_cloud_a.name = "cubium_cloud_a"
        cubium_cloud_a.color = {59.0/255.0 * 0.25, 36.0/255.0 * 0.25, 107.0/255.0 * 0.25, 1.0 * 0.25}
        cubium_cloud_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        cubium_cloud_a.animation.frame_count = 1
        cubium_cloud_a.animation.size = 512
        cubium_cloud_a.animation.blend_mode = "additive"
        cubium_cloud_a.start_scale = 3.0
        cubium_cloud_a.end_scale = 5.0
        cubium_cloud_a.duration = 300
        cubium_cloud_a.fade_in_duration = 150
        cubium_cloud_a.fade_away_duration = 150
        data:extend({cubium_cloud_a})

        local cubium_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        cubium_weather_cloud_a.action_delivery.source_effects.smoke_name = "cubium_cloud_a"
        cubium_weather_cloud_a.action_delivery.source_effects.speed = {0.08, 0.0}
        cubium_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        cubium_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        cubium_weather_cloud_a.action_delivery.source_effects.probability = 0.1

        table.insert(cubium_effects, cubium_weather_cloud_a)

        local cubium_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        cubium_cloud_b.name = "cubium_cloud_b"
        cubium_cloud_b.color = {47.0/255.0 * 0.25, 63.0/255.0 * 0.25, 119.0/255.0 * 0.25, 1.0 * 0.25}
        cubium_cloud_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-a.png"
        cubium_cloud_b.animation.frame_count = 1
        cubium_cloud_b.animation.size = 512
        cubium_cloud_b.animation.blend_mode = "additive"
        cubium_cloud_b.start_scale = 3.0
        cubium_cloud_b.end_scale = 5.0
        cubium_cloud_b.duration = 300
        cubium_cloud_b.fade_in_duration = 150
        cubium_cloud_b.fade_away_duration = 150
        data:extend({cubium_cloud_b})

        local cubium_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        cubium_weather_cloud_b.action_delivery.source_effects.smoke_name = "cubium_cloud_b"
        cubium_weather_cloud_b.action_delivery.source_effects.speed = {0.11, 0.0}
        cubium_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        cubium_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        cubium_weather_cloud_b.action_delivery.source_effects.probability = 0.1

        table.insert(cubium_effects, cubium_weather_cloud_b)
    end


    if settings.startup["shibadisaster-cwa-cubium-enable-sparks"].value then
        local cubium_sparks_small = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        cubium_sparks_small.name = "cubium_sparks_small"
        cubium_sparks_small.color = settings.startup["shibadisaster-cwa-cubium-sparks-color"].value
        cubium_sparks_small.start_scale = 0.1
        cubium_sparks_small.end_scale = 0.2
        cubium_sparks_small.duration = 120
        cubium_sparks_small.fade_in_duration = 40
        cubium_sparks_small.fade_away_duration = 40
        cubium_sparks_small.render_layer = "smoke"
        cubium_sparks_small.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/pointy-spark-a.png"
        cubium_sparks_small.animation.frame_count = 100
        cubium_sparks_small.animation.line_length = 10
        cubium_sparks_small.animation.size = math.floor(2048 / 10)
        cubium_sparks_small.animation.animation_speed = 20.0
        cubium_sparks_small.animation.blend_mode = "additive"
        data:extend({cubium_sparks_small})

        local cubium_weather_sparks_small = table.deepcopy(common_effects.direct_particles)
        cubium_weather_sparks_small.action_delivery.source_effects.smoke_name = "cubium_sparks_small"
        cubium_weather_sparks_small.action_delivery.source_effects.speed = {0.2, 0.0}
        cubium_weather_sparks_small.action_delivery.source_effects.speed_multiplier = 1.0
        cubium_weather_sparks_small.action_delivery.source_effects.repeat_count = 1
        cubium_weather_sparks_small.action_delivery.source_effects.probability = 0.5

        table.insert(cubium_effects, cubium_weather_sparks_small)
    end


    if settings.startup["shibadisaster-cwa-cubium-enable-sparks"].value then
        local cubium_sparks_large = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        cubium_sparks_large.name = "cubium_sparks_large"
        cubium_sparks_large.color = settings.startup["shibadisaster-cwa-cubium-sparks-color"].value
        cubium_sparks_large.start_scale = 0.2
        cubium_sparks_large.end_scale = 0.3
        cubium_sparks_large.duration = 120
        cubium_sparks_large.fade_in_duration = 40
        cubium_sparks_large.fade_away_duration = 40
        cubium_sparks_large.render_layer = "smoke"
        cubium_sparks_large.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/pointy-spark-a.png"
        cubium_sparks_large.animation.frame_count = 100
        cubium_sparks_large.animation.line_length = 10
        cubium_sparks_large.animation.size = math.floor(2048 / 10)
        cubium_sparks_large.animation.animation_speed = 20.0
        cubium_sparks_large.animation.blend_mode = "additive"
        data:extend({cubium_sparks_large})

        local cubium_weather_sparks_large = table.deepcopy(common_effects.direct_particles)
        cubium_weather_sparks_large.action_delivery.source_effects.smoke_name = "cubium_sparks_large"
        cubium_weather_sparks_large.action_delivery.source_effects.speed = {0.1, 0.0}
        cubium_weather_sparks_large.action_delivery.source_effects.speed_multiplier = 1.0
        cubium_weather_sparks_large.action_delivery.source_effects.repeat_count = 1
        cubium_weather_sparks_large.action_delivery.source_effects.probability = 0.5

        table.insert(cubium_effects, cubium_weather_sparks_large)
    end

    if #cubium_effects >= 1 then
        data.raw["planet"]["cubium"].ticks_between_player_effects = 1
        data.raw["planet"]["cubium"].player_effects = cubium_effects
    end
end