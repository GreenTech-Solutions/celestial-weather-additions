-- Most code here adapted from Celestial Weather mod by Varaxia!
-- PLEASE REPORT ANY CRASHES TO ME BECAUSE IT'S PROBABLY DUE TO ONE OF THESE UPDATING

-- nested so we can potentially hide settings when the corresponding mod is disabled without crashing
if mods["rubia"] then
    if settings.startup["shibadisaster-cwa-enable-rubia-changes"].value then
        require("__celestial-weather-additions-updated__.weather.rubia")
    end
end

if mods["skewer_planet_vesta"] then
    if settings.startup["shibadisaster-cwa-enable-vesta-changes"].value then
        require("__celestial-weather-additions-updated__.weather.vesta")
    end
end

if mods["Muria"] then
    if settings.startup["shibadisaster-cwa-enable-muria-changes"].value then
        require("__celestial-weather-additions-updated__.weather.muria")
    end
end

if mods["Paracelsin"] then
    if settings.startup["shibadisaster-cwa-enable-paracelsin-changes"].value then
        require("__celestial-weather-additions-updated__.weather.paracelsin")
    end
end

if mods["planet-rabbasca"] then
    if settings.startup["shibadisaster-cwa-enable-rabbasca-changes"].value then
        require("__celestial-weather-additions-updated__.weather.rabbasca")
    end
end

if mods["cubium"] then
    if settings.startup["shibadisaster-cwa-enable-cubium-changes"].value then
        require("__celestial-weather-additions-updated__.weather.cubium")
    end
end

if mods["Igrys"] then
    if settings.startup["shibadisaster-cwa-enable-igrys-changes"].value then
        require("__celestial-weather-additions-updated__.weather.igrys")
    end
end

if mods["alchemy-khemia"] then
    if settings.startup["shibadisaster-cwa-enable-khemia-changes"].value then
        require("__celestial-weather-additions-updated__.weather.khemia")
    end
end

if mods["panglia_planet"] then
    if settings.startup["shibadisaster-cwa-enable-panglia-changes"].value then
        require("__celestial-weather-additions-updated__.weather.panglia")
    end
end

if mods["pelagos"] then
    if settings.startup["shibadisaster-cwa-enable-pelagos-changes"].value then
        require("__celestial-weather-additions-updated__.weather.pelagos")
    end
end

if mods["carna"] then 
    if settings.startup["shibadisaster-cwa-enable-carna-changes"].value then
        require("__celestial-weather-additions-updated__.weather.carna") -- still wip!
    end
end