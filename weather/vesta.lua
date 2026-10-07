local common_effects = require("common.common-effects")

------ VESTA ------
if true then


    if settings.startup["shibadisaster-cwa-vesta-enable-fog"].value then
        local vesta_fog = table.deepcopy(common_effects.fog)
        vesta_fog.color1 = settings.startup["shibadisaster-cwa-vesta-fog-color"].value
        vesta_fog.color2 = settings.startup["shibadisaster-cwa-vesta-fog-color"].value
        vesta_fog.tick_factor = 0.000005
        vesta_fog.detail_noise_texture.filename = "__celestial-weather-updated__/graphics/entity/dense-clouds.png"
        vesta_fog.fog_type = "gleba"

        data.raw["planet"]["vesta"].surface_render_parameters["fog"] = vesta_fog
        data.raw["planet"]["vesta"].surface_render_parameters["clouds"] = nil

        if data.raw["tile"]["dust-flat-vesta"] then data.raw["tile"]["dust-flat-vesta"].lowland_fog = false end
        if data.raw["tile"]["dust-crests-vesta"] then data.raw["tile"]["dust-crests-vesta"].lowland_fog = false end
        if data.raw["tile"]["dust-lumpy-vesta"] then data.raw["tile"]["dust-lumpy-vesta"].lowland_fog = false end
        if data.raw["tile"]["dust-patchy-vesta"] then data.raw["tile"]["dust-patchy-vesta"].lowland_fog = false end
        if data.raw["tile"]["ice-rough-vesta"] then data.raw["tile"]["ice-rough-vesta"].lowland_fog = false end
        if data.raw["tile"]["ice-smooth-vesta"] then data.raw["tile"]["ice-smooth-vesta"].lowland_fog = false end

        if data.raw["tile"]["ammoniacal-ocean-vesta-pink"] then data.raw["tile"]["ammoniacal-ocean-vesta-pink"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-lime"] then data.raw["tile"]["ammoniacal-ocean-vesta-lime"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-yellow"] then data.raw["tile"]["ammoniacal-ocean-vesta-yellow"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-yellow-ransom"] then data.raw["tile"]["ammoniacal-ocean-vesta-yellow-ransom"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-red"] then data.raw["tile"]["ammoniacal-ocean-vesta-red"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-red-ransom"] then data.raw["tile"]["ammoniacal-ocean-vesta-red-ransom"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-tritium"] then data.raw["tile"]["ammoniacal-ocean-vesta-tritium"].lowland_fog = true end
        if data.raw["tile"]["ammoniacal-ocean-vesta-deuterium"] then data.raw["tile"]["ammoniacal-ocean-vesta-deuterium"].lowland_fog = true end
    end
    

    -- note to self/whoever is reading this: since vesta didn't have existing player_effects, we can just add to player_effects like normal
    local vesta_effects = table.deepcopy(data.raw["planet"]["vesta"].player_effects) or {}

    -- note to self: okay! so i think i get colors now, by premultiplied alpha it means {r, g, b, a} should be {ar, ag, ab, a}
    -- vesta thick clouds
    if settings.startup["shibadisaster-cwa-vesta-enable-thick-clouds"].value then
        local vesta_thick_clouds = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        vesta_thick_clouds.name = "vesta_thick_clouds"
        vesta_thick_clouds.color = settings.startup["shibadisaster-cwa-vesta-thick-cloud-color"].value
        vesta_thick_clouds.start_scale = 4.0
        vesta_thick_clouds.end_scale = 4.0
        vesta_thick_clouds.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds.fade_in_duration = 120 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds.fade_away_duration = 120 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds.render_layer = "air-entity-info-icon"
        vesta_thick_clouds.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/diffuse-cloud.png"
        vesta_thick_clouds.animation.frame_count = 1
        vesta_thick_clouds.animation.size = 512
        vesta_thick_clouds.animation.blend_mode = "additive"
        data:extend({vesta_thick_clouds})

        local vesta_weather_thick_clouds = table.deepcopy(common_effects.direct_particles)
        vesta_weather_thick_clouds.action_delivery.source_effects.smoke_name = "vesta_thick_clouds"
        vesta_weather_thick_clouds.action_delivery.source_effects.speed = {0.0, 0.0}
        vesta_weather_thick_clouds.action_delivery.source_effects.speed_multiplier = 0.0
        vesta_weather_thick_clouds.action_delivery.source_effects.probability = 0.6
        vesta_weather_thick_clouds.action_delivery.source_effects.movement_slow_down_factor = 0.0

        table.insert(vesta_effects, vesta_weather_thick_clouds)
    end

    if settings.startup["shibadisaster-cwa-vesta-enable-clouds"].value then
        local vesta_thick_clouds_white_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        vesta_thick_clouds_white_a.name = "vesta_clouds_white_a"
        vesta_thick_clouds_white_a.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
        vesta_thick_clouds_white_a.start_scale = 2.0
        vesta_thick_clouds_white_a.end_scale = 3.0
        vesta_thick_clouds_white_a.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_a.fade_in_duration = 80 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_a.fade_away_duration = 80 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_a.render_layer = "floor"
        vesta_thick_clouds_white_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-a.png"
        vesta_thick_clouds_white_a.animation.frame_count = 1
        vesta_thick_clouds_white_a.animation.size = 512
        vesta_thick_clouds_white_a.animation.blend_mode = "additive"
        data:extend({vesta_thick_clouds_white_a})

        local vesta_thick_clouds_white_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        vesta_thick_clouds_white_b.name = "vesta_clouds_white_b"
        vesta_thick_clouds_white_b.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
        vesta_thick_clouds_white_b.start_scale = 2.0
        vesta_thick_clouds_white_b.end_scale = 3.0
        vesta_thick_clouds_white_b.duration = 240 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_b.fade_in_duration = 80 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_b.fade_away_duration = 80 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_b.render_layer = "smoke"
        vesta_thick_clouds_white_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-b.png"
        vesta_thick_clouds_white_b.animation.frame_count = 1
        vesta_thick_clouds_white_b.animation.size = 512
        vesta_thick_clouds_white_b.animation.blend_mode = "additive"
        data:extend({vesta_thick_clouds_white_b})

        local vesta_thick_clouds_white_c = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        vesta_thick_clouds_white_c.name = "vesta_clouds_white_c"
        vesta_thick_clouds_white_c.color = settings.startup["shibadisaster-cwa-vesta-cloud-color"].value
        vesta_thick_clouds_white_c.start_scale = 2.0
        vesta_thick_clouds_white_c.end_scale = 3.0
        vesta_thick_clouds_white_c.duration = 480 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_c.fade_in_duration = 160 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_c.fade_away_duration = 160 * settings.startup["shibadisaster-cwa-vesta-cloud-duration-multiplier"].value
        vesta_thick_clouds_white_c.render_layer = "air-entity-info-icon"
        vesta_thick_clouds_white_c.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-c.png"
        vesta_thick_clouds_white_c.animation.frame_count = 1
        vesta_thick_clouds_white_c.animation.size = 512
        vesta_thick_clouds_white_c.animation.blend_mode = "additive"
        data:extend({vesta_thick_clouds_white_c})

        local vesta_weather_thick_clouds_white_a = table.deepcopy(common_effects.direct_particles)
        vesta_weather_thick_clouds_white_a.action_delivery.source_effects.smoke_name = "vesta_clouds_white_a"
        vesta_weather_thick_clouds_white_a.action_delivery.source_effects.speed = {0.0, 0.0}
        vesta_weather_thick_clouds_white_a.action_delivery.source_effects.speed_multiplier = 0.0
        vesta_weather_thick_clouds_white_a.action_delivery.source_effects.probability = 0.05
        vesta_weather_thick_clouds_white_a.action_delivery.source_effects.movement_slow_down_factor = 0.0

        local vesta_weather_thick_clouds_white_b = table.deepcopy(common_effects.direct_particles)
        vesta_weather_thick_clouds_white_b.action_delivery.source_effects.smoke_name = "vesta_clouds_white_b"
        vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed = {0.0, 0.0}
        vesta_weather_thick_clouds_white_b.action_delivery.source_effects.speed_multiplier = 0.0
        vesta_weather_thick_clouds_white_b.action_delivery.source_effects.probability = 0.05
        vesta_weather_thick_clouds_white_b.action_delivery.source_effects.movement_slow_down_factor = 0.0

        
        table.insert(vesta_effects, vesta_weather_thick_clouds_white_a)
        table.insert(vesta_effects, vesta_weather_thick_clouds_white_b)

        if not settings.startup["shibadisaster-cwa-vesta-reduce-cloud-cover"].value then
            local vesta_weather_thick_clouds_white_c = table.deepcopy(common_effects.direct_particles)
            vesta_weather_thick_clouds_white_c.action_delivery.source_effects.smoke_name = "vesta_clouds_white_c"
            vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed = {0.0, 0.0}
            vesta_weather_thick_clouds_white_c.action_delivery.source_effects.speed_multiplier = 0.0
            vesta_weather_thick_clouds_white_c.action_delivery.source_effects.probability = 0.05
            vesta_weather_thick_clouds_white_c.action_delivery.source_effects.movement_slow_down_factor = 0.0

            table.insert(vesta_effects, vesta_weather_thick_clouds_white_c)
        end
    end


    

    
    
    if #vesta_effects >= 1 then
        data.raw["planet"]["vesta"].player_effects = vesta_effects
        data.raw["planet"]["vesta"].ticks_between_player_effects = 1
    end
end