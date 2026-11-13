local function modify_surface_visuals(surface)
    -- checking if the mod is enabled isn't needed since no surface names will match anyway

    ------ PARACELSIN ------
    if surface.name == "paracelsin" then
        if settings.startup["shibadisaster-cwa-paracelsin-always-dark"].value and settings.startup["shibadisaster-cwa-enable-paracelsin-changes"].value then
            surface.daytime = 0.5
            surface.freeze_daytime = true
        end
    end


    ------ RUBIA ------
    -- if surface.name == "rubia" then
    --     if settings.startup["shibadisaster-cwa-enable-rubia-changes"].value then
    --         surface.wind_speed = 0.5
    --         surface.wind_orientation = 0.25
    --         surface.wind_orientation_change = 0.0
    --     end
    -- end
end


local migrated_storage = require("migrated_storage")

-- A save that had Celestial Weather or its Additions (migrates_from in info.json) hands their storage over; they keep
-- nothing there, so it is dropped.
local function drop_original_storage()
    while migrated_storage.take({ "celestial-weather-additions", "celestial-weather", "celestial-weather-updated" }) do
    end
end

script.on_configuration_changed(drop_original_storage)

-- modify existing planets on load/save creation
script.on_init(function()
    drop_original_storage()
    for _, surface in pairs(game.surfaces) do
        modify_surface_visuals(surface)
    end
end)

-- modify surfaces that get created
script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.surfaces[event.surface_index]
    modify_surface_visuals(surface)
end)

-- modify surfaces every 5 seconds (todo: on save loading?)
script.on_nth_tick(300, function()
    for _, surface in pairs(game.surfaces) do
        modify_surface_visuals(surface)
    end
end)