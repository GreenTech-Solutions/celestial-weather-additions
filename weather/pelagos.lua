local common_effects = require("common.common-effects")

------ PELAGOS ------
if true then
    local pelagos_effects = table.deepcopy(data.raw["planet"]["pelagos"].player_effects) or {}


    if settings.startup["shibadisaster-cwa-pelagos-enable-tropical-recolor"].value then
        data.raw["planet"]["pelagos"].surface_render_parameters.day_night_cycle_color_lookup = {
            {0.00000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_day.png"},
            {0.00000001, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_day.png"},
            {0.25000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_day.png"},
            {0.30000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_dusk.png"},
            {0.35000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_night.png"},
            {0.65000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_night.png"},
            {0.70000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_dusk.png"},
            {0.75000000, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_day.png"},
            {0.99999999, "__celestial-weather-additions-updated__/graphics/luts/tropical_pelagos_day.png"}
        }
    end


    if settings.startup["shibadisaster-cwa-pelagos-enable-clouds"].value then
        local pelagos_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        pelagos_cloud_a.name = "pelagos_cloud_a"
        pelagos_cloud_a.color = {255.0/255.0 * 0.1, 255.0/255.0 * 0.1, 255.0/255.0 * 0.1, 1.0 * 0.1}
        pelagos_cloud_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        pelagos_cloud_a.animation.frame_count = 1
        pelagos_cloud_a.animation.size = 512
        pelagos_cloud_a.start_scale = 3.0
        pelagos_cloud_a.end_scale = 5.0
        pelagos_cloud_a.duration = 600
        pelagos_cloud_a.fade_in_duration = 150
        pelagos_cloud_a.fade_away_duration = 150
        data:extend({pelagos_cloud_a})

        local pelagos_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        pelagos_weather_cloud_a.action_delivery.source_effects.smoke_name = "pelagos_cloud_a"
        pelagos_weather_cloud_a.action_delivery.source_effects.speed = {0.02, 0.0}
        pelagos_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 1.0
        pelagos_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        pelagos_weather_cloud_a.action_delivery.source_effects.probability = 0.05

        table.insert(pelagos_effects, pelagos_weather_cloud_a)


        local pelagos_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        pelagos_cloud_b.name = "pelagos_cloud_b"
        pelagos_cloud_b.color = {255.0/255.0 * 0.1, 255.0/255.0 * 0.1, 255.0/255.0 * 0.1, 1.0 * 0.1}
        pelagos_cloud_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-b.png"
        pelagos_cloud_b.animation.frame_count = 1
        pelagos_cloud_b.animation.size = 512
        pelagos_cloud_b.start_scale = 3.0
        pelagos_cloud_b.end_scale = 5.0
        pelagos_cloud_b.duration = 600
        pelagos_cloud_b.fade_in_duration = 150
        pelagos_cloud_b.fade_away_duration = 150
        data:extend({pelagos_cloud_b})

        local pelagos_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        pelagos_weather_cloud_b.action_delivery.source_effects.smoke_name = "pelagos_cloud_b"
        pelagos_weather_cloud_b.action_delivery.source_effects.speed = {0.01, 0.0}
        pelagos_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 1.0
        pelagos_weather_cloud_b.action_delivery.source_effects.repeat_count = 1 -- * 10
        pelagos_weather_cloud_b.action_delivery.source_effects.probability = 0.05

        table.insert(pelagos_effects, pelagos_weather_cloud_b)
    end

    
    if settings.startup["shibadisaster-cwa-pelagos-enable-water-ripples"].value then
        local pelagos_fog = table.deepcopy(common_effects.fog)
        pelagos_fog.color1 = {224.0/255.0, 224.0/255.0, 255.0/255.0}
        pelagos_fog.color2 = {224.0/255.0, 224.0/255.0, 255.0/255.0}
        pelagos_fog.tick_factor = 0.000005
        pelagos_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/vfx/caustics-fog.png"
        if settings.startup["shibadisaster-cwa-pelagos-larger-water-ripples"].value then
            pelagos_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/vfx/tess-fog.png"
        end
        pelagos_fog.fog_type = "gleba"

        data.raw["planet"]["pelagos"].surface_render_parameters = data.raw["planet"]["pelagos"].surface_render_parameters or {}
        data.raw["planet"]["pelagos"].surface_render_parameters.fog = pelagos_fog

        if data.raw["tile"]["pelagos-deepsea"] then data.raw["tile"]["pelagos-deepsea"].lowland_fog = true end
    end

    if #pelagos_effects >= 1 then
        data.raw["planet"]["pelagos"].ticks_between_player_effects = 1
        data.raw["planet"]["pelagos"].player_effects = pelagos_effects
    end
end