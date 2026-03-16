local function resolveStyle(entry)
    local d = Config.Default
    return {
        font        = entry.font        or d.font,
        maxScale    = entry.maxScale    or d.maxScale,
        color       = entry.color       or d.color,
        outline     = entry.outline     ~= nil and entry.outline or d.outline,
        shadow      = entry.shadow      ~= nil and entry.shadow  or d.shadow,
        dropShadow  = entry.dropShadow  or d.dropShadow,
        edge        = entry.edge        ~= nil and entry.edge    or d.edge,
        edgeStyle   = entry.edgeStyle   or d.edgeStyle,
        align       = entry.align       or d.align,
        proportional= entry.proportional~= nil and entry.proportional or d.proportional,
        hideOnDistance = entry.hideOnDistance ~= nil and entry.hideOnDistance or d.hideOnDistance,
        maxDistance    = entry.maxDistance or d.maxDistance,
        zOffset     = entry.zOffset     or d.zOffset,
    }
end


local function DrawText3D(x, y, z, text, style)
    local camX, camY, camZ = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(camX, camY, camZ) - vector3(x, y, z))
    if style.hideOnDistance and dist > style.maxDistance then return end

    local onScreen, sx, sy = World3dToScreen2d(x, y, z)
    if not onScreen then return end

    local scale = math.min((1 / dist) * 2 * ((1 / GetGameplayCamFov()) * 100), style.maxScale)
    local c     = style.color

    if style.shadow then
        local s = style.dropShadow
        SetTextDropShadow(s.distance, s.color.r, s.color.g, s.color.b, s.color.a)
    end

    if style.edge then
        local e = style.edgeStyle
        SetTextEdge(e.size, e.color.r, e.color.g, e.color.b, e.color.a)
    end

    if style.outline then
        SetTextOutline()
    end

    if style.align == "center" then
        SetTextCentre(true)
    elseif style.align == "right" then
        SetTextRightJustify(true)
    end

    SetTextScale(0.0, scale)
    SetTextFont(style.font)
    SetTextProportional(style.proportional)
    SetTextColour(c.r, c.g, c.b, c.a)
    SetTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawText(sx, sy)
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pedX, pedY, pedZ = table.unpack(GetEntityCoords(ped, true))

        for _, entry in ipairs(Config.Texts) do
            local style = resolveStyle(entry)
            local x, y, z

            if entry.onPed then
                x = pedX
                y = pedY
                z = pedZ + style.zOffset
            else
                x = entry.coords.x
                y = entry.coords.y
                z = entry.coords.z + style.zOffset
            end

            DrawText3D(x, y, z, entry.text, style)
        end
    end
end)

exports('AddText', function(id, coords, text, styleOverride)
    local entry = styleOverride or {}
    entry.text   = text
    entry.coords = coords
    Config.Texts[id] = entry
end)

exports('AddTextOnPed', function(id, text, styleOverride)
    local entry = styleOverride or {}
    entry.text  = text
    entry.onPed = true
    Config.Texts[id] = entry
end)

exports('RemoveText', function(id)
    Config.Texts[id] = nil
end)