local common_effects = require("common.common-effects")

------ RUBIA ------
if true then
    -- change rubia's built-in weather effects
    local rubia_rain_lines = data.raw["trivial-smoke"]["rubia-rain-lines"]
    rubia_rain_lines.color = {0.900, 0.831, 0.755, 1.0}
    rubia_rain_lines.start_scale = 3.5
    rubia_rain_lines.end_scale = 3.5
    rubia_rain_lines.fade_in_duration = 10
    rubia_rain_lines.fade_away_duration = 10
    rubia_rain_lines.duration = 80

    local rubia_sand = data.raw["trivial-smoke"]["rubia-sand"]
    rubia_sand.color = {0.900, 0.831, 0.755, 1.0}
    rubia_sand.start_scale = 4.0
    rubia_sand.end_scale = 4.0
    rubia_sand.fade_in_duration = 10
    rubia_sand.fade_away_duration = 10
    rubia_sand.duration = 80

    -- change speed of built-in effects
    local rubia_effects = table.deepcopy(data.raw["planet"]["rubia"].player_effects) or {}

    for _, effect in ipairs(rubia_effects) do
        effect.action_delivery.source_effects.speed_multiplier = 10.0 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
    end




    -- add overlay fog
    -- fog cannot be affected by wind afaik, so we have to remove this sowwy!
    -- if true then
    --     local rubia_fog = table.deepcopy(fog)
    --     rubia_fog.color1 = {0.822, 0.700, 0.564, 0.5}
    --     rubia_fog.color2 = {0.822, 0.700, 0.564, 0.5}
    --     rubia_fog.tick_factor = 0.003
    --     rubia_fog.detail_noise_texture.filename = "__celestial-weather-updated__/graphics/entity/dense-clouds.png"

    --     data.raw["planet"]["rubia"].surface_render_parameters["fog"] = rubia_fog
    -- end


    if settings.startup["shibadisaster-cwa-rubia-enable-clouds"].value then
        local rubia_clouds = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rubia_clouds.name = "rubia_clouds"
        rubia_clouds.color = {0.300, 0.250, 0.180, 0.25}
        rubia_clouds.start_scale = 4.0
        rubia_clouds.end_scale = 6.0
        rubia_clouds.duration = 60
        rubia_clouds.fade_in_duration = 30
        rubia_clouds.fade_away_duration = 30
        rubia_clouds.render_layer = "air-entity-info-icon"
        rubia_clouds.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/diffuse-cloud.png"
        rubia_clouds.animation.frame_count = 1
        rubia_clouds.animation.size = 512
        data:extend({rubia_clouds})

        local rubia_weather_clouds = table.deepcopy(common_effects.cluster_particles)
        rubia_weather_clouds.action_delivery.source_effects.smoke_name = "rubia_clouds"
        rubia_weather_clouds.action_delivery.source_effects.speed = {0.3, 0.0}
        rubia_weather_clouds.action_delivery.source_effects.speed_multiplier = 6.25 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
        rubia_weather_clouds.action_delivery.source_effects.probability = 0.1
        rubia_weather_clouds.action_delivery.source_effects.repeat_count = 2
        rubia_weather_clouds.action_delivery.source_effects.offset_deviation = {{-160, -48}, {96, 48}}
        rubia_weather_clouds.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(rubia_effects, rubia_weather_clouds)


        local rubia_clouds_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rubia_clouds_b.name = "rubia_clouds_b"
        rubia_clouds_b.color = {0.150, 0.125, 0.090, 0.125}
        rubia_clouds_b.start_scale = 5.0
        rubia_clouds_b.end_scale = 3.0
        rubia_clouds_b.duration = 60
        rubia_clouds_b.fade_in_duration = 30
        rubia_clouds_b.fade_away_duration = 30
        rubia_clouds_b.render_layer = "air-entity-info-icon"
        rubia_clouds_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        rubia_clouds_b.animation.frame_count = 1
        rubia_clouds_b.animation.size = 512
        data:extend({rubia_clouds_b})

        local rubia_weather_clouds_b = table.deepcopy(common_effects.cluster_particles)
        rubia_weather_clouds_b.action_delivery.source_effects.smoke_name = "rubia_clouds_b"
        rubia_weather_clouds_b.action_delivery.source_effects.speed = {0.3, 0.0}
        rubia_weather_clouds_b.action_delivery.source_effects.speed_multiplier = 7.8 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
        rubia_weather_clouds_b.action_delivery.source_effects.probability = 0.02
        -- rubia_weather_clouds_b.action_delivery.source_effects.repeat_count = 2
        rubia_weather_clouds_b.action_delivery.source_effects.offset_deviation = {{-160, -48}, {96, 48}}
        rubia_weather_clouds_b.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(rubia_effects, rubia_weather_clouds_b)
    end


    if settings.startup["shibadisaster-cwa-rubia-enable-additional-dust"].value then
        local rubia_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        rubia_dust.name = "rubia_dust"
        rubia_dust.color = {0.900, 0.831, 0.755, 1.0}
        rubia_dust.start_scale = 3.0
        rubia_dust.end_scale = 3.0
        rubia_dust.duration = 60
        rubia_dust.fade_in_duration = 30
        rubia_dust.fade_away_duration = 30
        rubia_dust.animation.filename = "__celestial-weather-updated__/graphics/entity/sand-particles.png"
        data.extend({rubia_dust})

        local rubia_weather_dust = table.deepcopy(common_effects.cluster_particles)
        rubia_weather_dust.cluster_count = 2
        rubia_weather_dust.action_delivery.source_effects.smoke_name= "rubia_dust"
        rubia_weather_dust.action_delivery.source_effects.speed = {0.3, 0.0}
        rubia_weather_dust.action_delivery.source_effects.speed_multiplier = 4.3 * settings.startup["shibadisaster-cwa-rubia-particle-speed"].value
        rubia_weather_dust.action_delivery.source_effects.offset_deviation = {{-160, -48}, {96, 48}}
        rubia_weather_dust.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(rubia_effects, rubia_weather_dust)
    end

    if #rubia_effects >= 1 then
        data.raw["planet"]["rubia"].player_effects = rubia_effects
    end
end