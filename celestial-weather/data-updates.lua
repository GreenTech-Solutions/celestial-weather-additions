------ cluster particles ------
local cluster_particles = {
  type = "cluster",
  distance = 8,
  distance_deviation = 8,
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.6,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ direct particles ------
local direct_particles = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.4,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ fog ------
local fog = {
  fog_type = "vulcanus",
  shape_noise_texture =
  {
    filename = "__core__/graphics/clouds-noise.png",
    size = 2048
  },
  detail_noise_texture =
  {
    filename = "__core__/graphics/clouds-detail-noise.png",
    size = 2048
  },
  color1 = {255, 217, 139, 1.0},
  color2 = {183, 255, 169, 1.0},
  tick_factor = 0.000001,
}




------ helpers ------
-- Adds a sound to the planet's semi-persistent ambient sounds instead of replacing them: Vulcanus lost its distant
-- rumble and flames and Corrundum its distant thunder to the rain.
local function add_semi_persistent(planet, definition)
  planet.persistent_ambient_sounds = planet.persistent_ambient_sounds or {}
  local list = planet.persistent_ambient_sounds.semi_persistent
  if not list then
    list = {}
  elseif list.sound then
    list = {list}
  end
  table.insert(list, definition)
  planet.persistent_ambient_sounds.semi_persistent = list
end




------ vulcanus ------
vu_effects = {}
-- ash --
if settings.startup["enable-vulcanus-weather-ash"].value then
  local vu_ash = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  vu_ash.name = "vu_ash"
  vu_ash.color = {0.443, 0.392, 0.317}
  vu_ash.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/sand-particles.png"
  data:extend({vu_ash})

  vu_weather_a = table.deepcopy(direct_particles)
  vu_weather_a.action_delivery.source_effects.smoke_name = "vu_ash"
  vu_weather_a.action_delivery.source_effects.speed = {-0.16, 0.4}
  vu_weather_a.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-ash-particle-speed"].value

  table.insert(vu_effects, vu_weather_a)
end
-- rain --
if settings.startup["enable-vulcanus-weather-rain"].value then
  local vu_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
  vu_rain.name = "vu_rain"
  vu_rain.color = {0.882, 0.847, 0.478}
  vu_rain.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/light-rain.png"
  vu_rain.animation.width = 256
  vu_rain.animation.height = 256
  vu_rain.animation.line_length = 2
  vu_rain.animation.frame_count = 4
  vu_rain.animation.animation_speed = 0.0001
  vu_rain.animation.scale = 1.3
  data:extend({vu_rain})

  vu_weather_r = table.deepcopy(direct_particles)
  vu_weather_r.action_delivery.source_effects.smoke_name = "vu_rain"
  vu_weather_r.action_delivery.source_effects.speed = {-0.06, 0.5}
  vu_weather_r.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-rain-particle-speed"].value

  local vu_fog = table.deepcopy(fog)
  vu_fog.color1 = {0.882, 0.847, 0.478, 0.6}
  vu_fog.color2 = {0.882, 0.847, 0.478, 0.6}
  vu_fog.tick_factor = 0.0003

  data.raw["planet"]["vulcanus"].surface_render_parameters = data.raw["planet"]["vulcanus"]["surface_render_parameters"] or {}
  data.raw["planet"]["vulcanus"].surface_render_parameters["fog"] = vu_fog

  add_semi_persistent(data.raw["planet"]["vulcanus"], {
    sound = {
      filename = "__celestial-weather-additions-updated__/sounds/rain.ogg", volume = 0.1
    }
  })

  table.insert(vu_effects, vu_weather_r)
end
-- fire particles--
if settings.startup["enable-vulcanus-weather-fire"].value then
  local vu_fire = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  vu_fire.name = "vu_fire"
  vu_fire.color = {0.926, 0.407, 0.075}
  vu_fire.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/fire-particles.png"
  data:extend({vu_fire})

  vu_weather_f = table.deepcopy(direct_particles)
  vu_weather_f.action_delivery.source_effects.smoke_name = "vu_fire"
  vu_weather_f.action_delivery.source_effects.speed = {-0.16, -0.4}
  vu_weather_f.action_delivery.source_effects.speed_multiplier = settings.startup["vulcanus-fire-particle-speed"].value

  table.insert(vu_effects, vu_weather_f)
end
-- implement --
if vu_weather_a then
  table.insert(vu_effects, vu_weather_a)
end

if vu_weather_r then
  table.insert(vu_effects, vu_weather_r)
end

if vu_weather_f then
  table.insert(vu_effects, vu_weather_f)
end

if #vu_effects > 0 then
  data.raw["planet"]["vulcanus"].ticks_between_player_effects = 1
  data.raw["planet"]["vulcanus"].player_effects = vu_effects
end




------ muluna ------
-- dust --
if mods ["planet-muluna"] and settings.startup["enable-muluna-weather"].value then
  local mu_dust = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  mu_dust.name = "mu_dust"
  mu_dust.color = {0.670, 0.682, 0.674}
  mu_dust.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/sand-particles.png",
  data.extend{(mu_dust)}

  -- a cluster, so the particle amount setting works: a direct trigger has no cluster_count and ignored it
  local mu_weather = table.deepcopy(direct_particles)
  mu_weather.type = "cluster"
  mu_weather.distance = 0
  mu_weather.distance_deviation = 0
  mu_weather.cluster_count = settings.startup["muluna-particle-amount"].value
  mu_weather.action_delivery.source_effects.smoke_name= "mu_dust"
  mu_weather.action_delivery.source_effects.speed = {-0.28, 0.36}
  mu_weather.action_delivery.source_effects.speed_multiplier = settings.startup["muluna-particle-speed"].value
-- implement --
  data.raw["planet"]["muluna"].ticks_between_player_effects = 1
  data.raw["planet"]["muluna"].player_effects =  {(mu_weather)}
end

------ fulgora ------
-- sand --
if settings.startup["enable-fulgora-weather"].value then
  local fu_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  fu_sand.name = "fu_sand"
  fu_sand.color = {0.741, 0.616, 0.596}
  fu_sand.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/sand-particles.png",
  data.extend{(fu_sand)}

  local fu_weather = table.deepcopy(cluster_particles)
  fu_weather.cluster_count = settings.startup["fulgora-particle-amount"].value
  fu_weather.action_delivery.source_effects.smoke_name= "fu_sand"
  fu_weather.action_delivery.source_effects.speed = {-0.28, 0}
  fu_weather.action_delivery.source_effects.speed_multiplier = settings.startup["fulgora-particle-speed"].value

  local fu_fog = table.deepcopy(fog)
  fu_fog.color1 = {1, 0.667, 0.667, 0.7}
  fu_fog.color2 = {0.741, 0.475, 0.475, 0.7}
  fu_fog.tick_factor = 0.0003
  fu_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/entity/dense-clouds.png"
-- implement --
  data.raw["planet"]["fulgora"].ticks_between_player_effects = 1
  data.raw["planet"]["fulgora"].player_effects =  {(fu_weather)}
  data.raw["planet"]["fulgora"].surface_render_parameters = data.raw["planet"]["fulgora"]["surface_render_parameters"] or {}
  data.raw["planet"]["fulgora"].surface_render_parameters["fog"] = fu_fog
end

------ moshine ------
mo_effects = {}
-- sand --
if mods["Moshine"] and settings.startup["enable-moshine-weather-sand"].value then
  local mo_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  mo_sand.name = "mo_sand"
  mo_sand.color = {1, 0.855, 0.624}
  mo_sand.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/sand-particles.png",
  data.extend{(mo_sand)}

  local mo_weather_s = table.deepcopy(cluster_particles)
  mo_weather_s.cluster_count = settings.startup["moshine-sand-particle-amount"].value
  mo_weather_s.action_delivery.source_effects.smoke_name= "mo_sand"
  mo_weather_s.action_delivery.source_effects.speed = {-0.32, 0}
  mo_weather_s.action_delivery.source_effects.speed_multiplier = settings.startup["moshine-sand-particle-speed"].value

  local mo_fog = table.deepcopy(fog)
  mo_fog.color1 = {1, 0.749, 0.2, 1.0}
  mo_fog.color2 = {1, 0.8, 0.2, 1.0}
  mo_fog.tick_factor = 0.0003
  mo_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/entity/dense-clouds.png"

  data.raw["planet"]["moshine"].surface_render_parameters = data.raw["planet"]["moshine"]["surface_render_parameters"] or {}
  data.raw["planet"]["moshine"].surface_render_parameters["fog"] = mo_fog

  table.insert(mo_effects, mo_weather_s)
end
-- fire particles --
if settings.startup["enable-moshine-weather-fire"].value then
  local mo_fire = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  mo_fire.name = "mo_fire"
  mo_fire.color = {1.0, 1.0, 1.0}
  mo_fire.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/fire-particles.png"
  data:extend({mo_fire})

  mo_weather_f = table.deepcopy(direct_particles)
  mo_weather_f.action_delivery.source_effects.smoke_name = "mo_fire"
  mo_weather_f.action_delivery.source_effects.speed = {-0.16, -0.4}
  mo_weather_f.action_delivery.source_effects.speed_multiplier = settings.startup["moshine-fire-particle-speed"].value

  table.insert(mo_effects, mo_weather_f)
end
-- implement
if mo_weather_s then
  table.insert(mo_effects, mo_weather_s)
end

if mo_weather_f then
  table.insert(mo_effects, mo_weather_f)
end

if mods["Moshine"] and #mo_effects > 0 then
  data.raw["planet"]["moshine"].ticks_between_player_effects = 1
  data.raw["planet"]["moshine"].player_effects = mo_effects
end

------ corrundum ------
co_effects = {}
-- sand --
if mods["corrundum"] and settings.startup["enable-corrundum-weather-sand"].value then
  local co_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  co_sand.name = "co_sand"
  co_sand.color = {0.494, 0.380, 0.290}
  co_sand.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/sand-particles.png",
  data.extend{(co_sand)}

  local co_weather_s = table.deepcopy(cluster_particles)
  co_weather_s.cluster_count = settings.startup["corrundum-sand-particle-amount"].value
  co_weather_s.action_delivery.source_effects.smoke_name= "co_sand"
  co_weather_s.action_delivery.source_effects.speed = {-0.32, 0}
  co_weather_s.action_delivery.source_effects.speed_multiplier = settings.startup["corrundum-sand-particle-speed"].value

  local co_fog = table.deepcopy(fog)
  co_fog.color1 = {0.588, 0.45, 0.341, 1.0}
  co_fog.color2 = {0.678, 0.549, 0.45, 1.0}
  co_fog.tick_factor = 0.0004
  co_fog.detail_noise_texture.filename = "__celestial-weather-additions-updated__/graphics/entity/dense-clouds.png"

  data.raw["planet"]["corrundum"].surface_render_parameters = data.raw["planet"]["corrundum"]["surface_render_parameters"] or {}
  data.raw["planet"]["corrundum"].surface_render_parameters["fog"] = co_fog

  table.insert(co_effects, co_weather_s)
end
-- rain --
if mods["corrundum"] and settings.startup["enable-corrundum-weather-rain"].value then
  local co_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
  co_rain.name = "co_rain"
  co_rain.color = {0.882, 0.847, 0.478}
  co_rain.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/light-rain.png"
  co_rain.animation.width = 256
  co_rain.animation.height = 256
  co_rain.animation.line_length = 2
  co_rain.animation.frame_count = 4
  co_rain.animation.scale = 0.8
  data:extend({co_rain})

  co_weather_r = table.deepcopy(cluster_particles)
  co_weather_r.cluster_count = 4
  co_weather_r.action_delivery.source_effects.smoke_name = "co_rain"
  co_weather_r.action_delivery.source_effects.speed = {-0.02, 0.5}
  co_weather_r.action_delivery.source_effects.speed_multiplier = settings.startup["corrundum-rain-particle-speed"].value

  add_semi_persistent(data.raw["planet"]["corrundum"], {
    sound = {
      filename = "__celestial-weather-additions-updated__/sounds/rain.ogg", volume = 0.2
    }
  })

  table.insert(co_effects, co_weather_r)
end
-- implement
if co_weather_s then
  table.insert(co_effects, co_weather_s)
end

if co_weather_r then
  table.insert(co_effects, co_weather_r)
end

if mods["corrundum"] and #co_effects > 0 then
  data.raw["planet"]["corrundum"].ticks_between_player_effects = 1
  data.raw["planet"]["corrundum"].player_effects = co_effects
end




------ aquilo ------
-- snow --
if settings.startup["enable-aquilo-weather"].value then
  local aq_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  aq_snow.name = "aq_snow"
  aq_snow.color = {1, 1, 1}
  data.extend{(aq_snow)}

  local aq_weather = table.deepcopy(cluster_particles)
  aq_weather.cluster_count = settings.startup["aquilo-particle-amount"].value
  aq_weather.action_delivery.source_effects.smoke_name= "aq_snow"
  aq_weather.action_delivery.source_effects.speed = {-0.15, 0.3}
  aq_weather.action_delivery.source_effects.speed_multiplier = settings.startup["aquilo-particle-speed"].value

  local aq_fog = table.deepcopy(fog)
  aq_fog.color1 = {1, 1, 1, 1}
  aq_fog.color2 = {1, 1, 1, 1}
  aq_fog.tick_factor = 0.0002
-- implement --
  data.raw["planet"]["aquilo"].ticks_between_player_effects = 1
  data.raw["planet"]["aquilo"].player_effects =  {(aq_weather)}
  data.raw["planet"]["aquilo"].surface_render_parameters = data.raw["planet"]["aquilo"]["surface_render_parameters"] or {}
  data.raw["planet"]["aquilo"].surface_render_parameters["fog"] = aq_fog
end

------ frozeta ------
-- snow --
if mods["secretas"] and settings.startup["enable-frozeta-weather"].value then
  local fr_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  fr_snow.name = "fr_snow"
  fr_snow.color = {1, 1, 1}
  data.extend{(fr_snow)}

  local fr_weather = table.deepcopy(cluster_particles)
  fr_weather.cluster_count = settings.startup["frozeta-particle-amount"].value
  fr_weather.action_delivery.source_effects.smoke_name= "fr_snow"
  fr_weather.action_delivery.source_effects.speed = {-0.6, 0.3}
  fr_weather.action_delivery.source_effects.speed_multiplier = settings.startup["frozeta-particle-speed"].value

  local fr_fog = table.deepcopy(fog)
  fr_fog.color1 = {1, 1, 1, 1}
  fr_fog.color2 = {1, 1, 1, 1}
  fr_fog.tick_factor = 0.0006
-- implement --
  data.raw["planet"]["frozeta"].ticks_between_player_effects = 1
  data.raw["planet"]["frozeta"].player_effects =  {(fr_weather)}
  data.raw["planet"]["frozeta"].surface_render_parameters = data.raw["planet"]["frozeta"]["surface_render_parameters"] or {}
  data.raw["planet"]["frozeta"].surface_render_parameters["fog"] = fr_fog
end

------ paracelsin ------
-- snow --
if mods["Paracelsin"] and settings.startup["enable-paracelsin-weather"].value then
  local pa_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  pa_snow.name = "pa_snow"
  pa_snow.color = {1, 1, 1}
  data.extend{(pa_snow)}

  local pa_weather = table.deepcopy(cluster_particles)
  pa_weather.cluster_count = settings.startup["paracelsin-particle-amount"].value
  pa_weather.action_delivery.source_effects.smoke_name= "pa_snow"
  pa_weather.action_delivery.source_effects.speed = {-0.1, 0.3}
  pa_weather.action_delivery.source_effects.speed_multiplier = settings.startup["paracelsin-particle-speed"].value

  local pa_fog = table.deepcopy(fog)
  pa_fog.color1 = {1, 1, 1, 1}
  pa_fog.color2 = {1, 1, 1, 1}
  pa_fog.tick_factor = 0.0002
-- implement --
  data.raw["planet"]["paracelsin"].ticks_between_player_effects = 1
  data.raw["planet"]["paracelsin"].player_effects =  {(pa_weather)}
  data.raw["planet"]["paracelsin"].surface_render_parameters = data.raw["planet"]["paracelsin"]["surface_render_parameters"] or {}
  data.raw["planet"]["paracelsin"].surface_render_parameters["fog"] = pa_fog
end

------ lemures ------
-- snow --
if mods["dea-dia-system"] and settings.startup["enable-lemures-weather"].value then
  local le_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  le_snow.name = "le_snow"
  le_snow.color = {1, 1, 1}
  data.extend{(le_snow)}

  local le_weather = table.deepcopy(cluster_particles)
  le_weather.cluster_count = settings.startup["lemures-particle-amount"].value
  le_weather.action_delivery.source_effects.smoke_name= "le_snow"
  le_weather.action_delivery.source_effects.speed = {-0.2, 0.3}
  le_weather.action_delivery.source_effects.speed_multiplier = settings.startup["lemures-particle-speed"].value

  local le_fog = table.deepcopy(fog)
  le_fog.color1 = {1, 1, 1, 1}
  le_fog.color2 = {1, 1, 1, 1}
  le_fog.tick_factor = 0.0004
-- implement --
  data.raw["planet"]["lemures"].ticks_between_player_effects = 1
  data.raw["planet"]["lemures"].player_effects =  {(le_weather)}
  data.raw["planet"]["lemures"].surface_render_parameters = data.raw["planet"]["lemures"]["surface_render_parameters"] or {}
  data.raw["planet"]["lemures"].surface_render_parameters["fog"] = le_fog
end

------ nix ------
-- snow --
if mods["metal-and-stars"] and settings.startup["enable-nix-weather"].value then
  local ni_snow = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  ni_snow.name = "ni_snow"
  ni_snow.color = {1, 1, 1}
  data.extend{(ni_snow)}

  local ni_weather = table.deepcopy(cluster_particles)
  ni_weather.cluster_count = settings.startup["nix-particle-amount"].value
  ni_weather.action_delivery.source_effects.smoke_name= "ni_snow"
  ni_weather.action_delivery.source_effects.speed = {-0.085, 0.3}
  ni_weather.action_delivery.source_effects.speed_multiplier = settings.startup["nix-particle-speed"].value

  local ni_fog = table.deepcopy(fog)
  ni_fog.color1 = {1, 1, 1, 1}
  ni_fog.color2 = {1, 1, 1, 1}
  ni_fog.tick_factor = 0.0003
-- implement --
  data.raw["planet"]["nix"].ticks_between_player_effects = 1.0
  data.raw["planet"]["nix"].player_effects =  {(ni_weather)}
  data.raw["planet"]["nix"].surface_render_parameters = data.raw["planet"]["nix"]["surface_render_parameters"] or {}
  data.raw["planet"]["nix"].surface_render_parameters["fog"] = ni_fog
end




------ lignumis ------
-- rain --
if mods["lignumis"] and settings.startup["enable-lignumis-weather"].value then
  local li_rain = table.deepcopy(data.raw["trivial-smoke"]["gleba-raindrops"])
  li_rain.name = "li_rain"
  li_rain.color = {0.533, 0.737, 0.929, 0.2}
  li_rain.animation.filename = "__celestial-weather-additions-updated__/graphics/entity/light-rain.png"
  li_rain.animation.width = 256
  li_rain.animation.height = 256
  li_rain.animation.line_length = 2
  li_rain.animation.frame_count = 4
  li_rain.animation.scale = 0.8
  data:extend({li_rain})

  li_weather = table.deepcopy(cluster_particles)
  li_weather.cluster_count = 10
  li_weather.action_delivery.source_effects.smoke_name = "li_rain"
  li_weather.action_delivery.source_effects.speed = {-0.02, 0.5}
  li_weather.action_delivery.source_effects.speed_multiplier = settings.startup["lignumis-particle-speed"].value

  local li_fog = table.deepcopy(fog)
  li_fog.color1 = {0.549, 0.737, 0.91, 1.0}
  li_fog.color2 = {0.431, 0.592, 0.741, 1.0}
  li_fog.tick_factor = 0.0002

  add_semi_persistent(data.raw["planet"]["lignumis"], {
    sound = {
      filename = "__celestial-weather-additions-updated__/sounds/rain.ogg", volume = 0.2
    }
  })
-- implement --
  data.raw["planet"]["lignumis"].ticks_between_player_effects = 1.0
  data.raw["planet"]["lignumis"].player_effects =  {(li_weather)}
  data.raw["planet"]["lignumis"].surface_render_parameters = data.raw["planet"]["lignumis"]["surface_render_parameters"] or {}
  data.raw["planet"]["lignumis"].surface_render_parameters["fog"] = li_fog
end