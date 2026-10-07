local common_effects = require("common.common-effects")

------ MURIA ------
if true then
    if settings.startup["shibadisaster-cwa-muria-enable-fog"].value then
        local muria_fog = table.deepcopy(common_effects.fog)
        muria_fog.color1 = settings.startup["shibadisaster-cwa-muria-fog-color"].value
        muria_fog.color2 = settings.startup["shibadisaster-cwa-muria-fog-color"].value
        muria_fog.tick_factor = 0.00003
        muria_fog.detail_noise_texture.filename = "__celestial-weather-updated__/graphics/entity/dense-clouds.png"

        data.raw["planet"]["muria"].surface_render_parameters["fog"] = muria_fog
    end


    -- note to self/whoever is reading this: since muria already has an existing effect (rain), idk how to add my effect on top elegantly, if anyone knows how please leave something on the discussions page
    --     this was the first way i figured out to do this that worked, but refer to vesta effects to see a better way to do this
    -- local muria_effects_action_delivery = {table.deepcopy(data.raw["planet"]["muria"].player_effects.action_delivery)}
    local muria_effects = {table.deepcopy(data.raw["planet"]["muria"].player_effects)} or {}

    if not settings.startup["shibadisaster-cwa-muria-enable-original-rain"].value then muria_effects = {} end

    -- acid spores
    if settings.startup["shibadisaster-cwa-muria-enable-spores"].value then
        local muria_large_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_large_acid_spore.name = "muria_large_acid_spore"
        muria_large_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_large_acid_spore.animation.filename = "__celestial-weather-updated__/graphics/entity/fire-particles.png"
        muria_large_acid_spore.start_scale = 0.0
        muria_large_acid_spore.end_scale = 2.0
        muria_large_acid_spore.movement_slow_down_factor = 1.0
        data:extend({muria_large_acid_spore})

        local muria_small_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_small_acid_spore.name = "muria_small_acid_spore"
        muria_small_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_small_acid_spore.animation.filename = "__celestial-weather-updated__/graphics/entity/fire-particles.png"
        muria_small_acid_spore.start_scale = 0.0
        muria_small_acid_spore.end_scale = 1.0
        muria_small_acid_spore.movement_slow_down_factor = 1.0
        data:extend({muria_small_acid_spore})

        local muria_very_small_acid_spore = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_very_small_acid_spore.name = "muria_very_small_acid_spore"
        muria_very_small_acid_spore.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_very_small_acid_spore.animation.filename = "__celestial-weather-updated__/graphics/entity/fire-particles.png"
        muria_very_small_acid_spore.start_scale = 0.0
        muria_very_small_acid_spore.end_scale = 0.3
        muria_very_small_acid_spore.movement_slow_down_factor = 1.0
        data:extend({muria_very_small_acid_spore})


        local muria_weather_large_acid = table.deepcopy(common_effects.direct_particles)
        muria_weather_large_acid.action_delivery.source_effects.smoke_name = "muria_large_acid_spore"
        muria_weather_large_acid.action_delivery.source_effects.speed = {-0.02, 0.0}
        muria_weather_large_acid.action_delivery.source_effects.speed_multiplier = 2.0
        muria_weather_large_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_large_acid.action_delivery.source_effects.probability = 1.0

        local muria_weather_small_acid = table.deepcopy(common_effects.direct_particles)
        muria_weather_small_acid.action_delivery.source_effects.smoke_name = "muria_small_acid_spore"
        muria_weather_small_acid.action_delivery.source_effects.speed = {-0.03, 0.0}
        muria_weather_small_acid.action_delivery.source_effects.speed_multiplier = 2.0
        muria_weather_small_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_small_acid.action_delivery.source_effects.probability = 1.0

        local muria_weather_very_small_acid = table.deepcopy(common_effects.direct_particles)
        muria_weather_very_small_acid.action_delivery.source_effects.smoke_name = "muria_very_small_acid_spore"
        muria_weather_very_small_acid.action_delivery.source_effects.speed = {-0.04, 0.0}
        muria_weather_very_small_acid.action_delivery.source_effects.speed_multiplier = 2.0
        muria_weather_very_small_acid.action_delivery.source_effects.repeat_count = 1
        muria_weather_very_small_acid.action_delivery.source_effects.probability = 1.0

        table.insert(muria_effects, muria_weather_large_acid)
        table.insert(muria_effects, muria_weather_small_acid)
        table.insert(muria_effects, muria_weather_very_small_acid)
    end


    if settings.startup["shibadisaster-cwa-muria-enable-clouds"].value then
        local muria_cloud_a = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_cloud_a.name = "muria_cloud_a"
        muria_cloud_a.color = settings.startup["shibadisaster-cwa-muria-cloud-color"].value
        muria_cloud_a.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-a.png"
        muria_cloud_a.animation.frame_count = 1
        muria_cloud_a.animation.size = 512
        muria_cloud_a.start_scale = 3.0
        muria_cloud_a.end_scale = 5.0
        muria_cloud_a.duration = 720
        muria_cloud_a.fade_in_duration = 180
        muria_cloud_a.fade_away_duration = 180
        data:extend({muria_cloud_a})

        local muria_weather_cloud_a = table.deepcopy(common_effects.direct_particles)
        muria_weather_cloud_a.action_delivery.source_effects.smoke_name = "muria_cloud_a"
        muria_weather_cloud_a.action_delivery.source_effects.speed = {-0.010, 0.0}
        muria_weather_cloud_a.action_delivery.source_effects.speed_multiplier = 5.0
        muria_weather_cloud_a.action_delivery.source_effects.repeat_count = 1
        muria_weather_cloud_a.action_delivery.source_effects.probability = 0.03

        table.insert(muria_effects, muria_weather_cloud_a)

        local muria_cloud_b = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_cloud_b.name = "muria_cloud_b"
        muria_cloud_b.color = settings.startup["shibadisaster-cwa-muria-cloud-color"].value
        muria_cloud_b.animation.filename = "__celestial-weather-additions-updated__/graphics/vfx/cloud-b.png"
        muria_cloud_b.animation.frame_count = 1
        muria_cloud_b.animation.size = 512
        muria_cloud_b.start_scale = 3.0
        muria_cloud_b.end_scale = 5.0
        muria_cloud_b.duration = 720
        muria_cloud_b.fade_in_duration = 180
        muria_cloud_b.fade_away_duration = 180
        data:extend({muria_cloud_b})

        local muria_weather_cloud_b = table.deepcopy(common_effects.direct_particles)
        muria_weather_cloud_b.action_delivery.source_effects.smoke_name = "muria_cloud_b"
        muria_weather_cloud_b.action_delivery.source_effects.speed = {-0.012, 0.0}
        muria_weather_cloud_b.action_delivery.source_effects.speed_multiplier = 5.0
        muria_weather_cloud_b.action_delivery.source_effects.repeat_count = 1
        muria_weather_cloud_b.action_delivery.source_effects.probability = 0.03

        table.insert(muria_effects, muria_weather_cloud_b)
    end


    if settings.startup["shibadisaster-cwa-muria-enable-dust"].value then
        local muria_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
        muria_dust.name = "muria_dust"
        muria_dust.color = settings.startup["shibadisaster-cwa-muria-spore-color"].value
        muria_dust.start_scale = 1.0
        muria_dust.end_scale = 1.0
        muria_dust.animation.filename = "__celestial-weather-updated__/graphics/entity/sand-particles.png"
        muria_dust.movement_slow_down_factor = 1.0
        data.extend({muria_dust})

        local muria_weather_dust = table.deepcopy(common_effects.direct_particles)
        muria_weather_dust.action_delivery.source_effects.smoke_name= "muria_dust"
        muria_weather_dust.action_delivery.source_effects.speed = {-0.06, 0.0}
        muria_weather_dust.action_delivery.source_effects.probability = 0.3
        muria_weather_dust.action_delivery.source_effects.speed_multiplier = 1.0

        table.insert(muria_effects, muria_weather_dust)
    end

    if #muria_effects >= 1 then
        data.raw["planet"]["muria"].ticks_between_player_effects = 1
        data.raw["planet"]["muria"].player_effects = muria_effects
    end
end