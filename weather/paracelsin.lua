local common_effects = require("common.common-effects")

------ PARACELSIN ------
if true then
    if settings.startup["shibadisaster-cwa-paracelsin-ash-snow"].value then
        local paracelsin_snow = data.raw["trivial-smoke"]["pa_snow"]
        paracelsin_snow.color = {0.188, 0.188, 0.188, 1.0}
        paracelsin_snow.start_scale = 0.8
        paracelsin_snow.end_scale = 1.2
    end
    
    -- what the hell happens with the lighting when i dont do this
    -- someone who knows please tell me
    -- OKAY note to whoever, the tint/lamp colors are based on the lookup at 0.0, so we can actually set custom lamp colors by changing 0.0
    if settings.startup["shibadisaster-cwa-paracelsin-always-dark"].value then
        data.raw["planet"]["paracelsin"].surface_render_parameters.day_night_cycle_color_lookup = {
            {0.00000000, "identity"},
            {0.00000001, "__celestial-weather-additions-updated__/graphics/luts/cryovolcanic_paracelsin_night.png"},
            {0.99999999, "__celestial-weather-additions-updated__/graphics/luts/cryovolcanic_paracelsin_night.png"}
        }
    end

    local paracelsin_effects = table.deepcopy(data.raw["planet"]["paracelsin"].player_effects) or {}

    if #paracelsin_effects >= 1 then

    end
end