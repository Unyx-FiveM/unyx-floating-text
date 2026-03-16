Config = {}
Config.Default = {
    font = 4,
    maxScale = 0.45,
    color = { r = 255, g = 255, b = 255, a = 235 },
    outline = true,
    shadow = false,
    dropShadow = {
        distance = 2,
        color    = { r = 0, g = 0, b = 0, a = 200 },
    },
    edge = false,
    edgeStyle = {
        size  = 2,
        color = { r = 0, g = 0, b = 0, a = 255 },
    },
    align = "center",
    proportional = true,
    hideOnDistance = true,
    maxDistance = 30.0,
    zOffset = 1.2,
}

Config.Texts = {
    {
        text           = "Bienvenue sur Unyx",
        coords         = vector3(-1098.369263, -2843.063721, 21.360474),
        zOffset        = 1.2,
        color          = { r = 0, g = 180, b = 255, a = 255 },
        edge           = true,
        hideOnDistance = true,
        maxDistance    = 30.0,
        edgeStyle      = {
            size  = 3,
            color = { r = 0, g = 180, b = 255, a = 255 },
        },
    },
    {
        text        = "Version 1.0.0 · Unyx · github.com/Unyx-FiveM",
        coords      = vector3(-1098.369263, -2843.063721, 21.360474),
        zOffset     = 1.0,
        font        = 0,
        maxScale    = 0.28,
        color       = { r = 180, g = 220, b = 255, a = 180 },
        outline     = true,
        edge        = false,
        maxDistance = 30.0,
    },
}
