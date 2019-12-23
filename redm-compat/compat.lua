-- NAMES ARE NOT CONFIRMED!!
-- Add blip for entity, <blipType, entity>
if not AddBlipForEntity then function AddBlipForEntity(...)
    return N_0x23f74c2fda6e7c61(...)
end end
-- Add blip for coord, <blipType, x, y, z>
if not AddBlipForCoord then function AddBlipForCoord(...)
    return N_0x554d9d53f696d002(...)
end end
-- Add blip for radius, <blipType, x, y, z, radius>
if not AddBlipForRadius then function AddBlipForRadius(...)
    return N_0x45f13b7e0a15c880(...)
end end
-- Add blip for area, <blipType, x, y, z, width, height, _, rotation>
if not AddBlipForArea then function AddBlipForArea(...)
    return N_0xec174adbcb611ecc(...)
end end
-- Set blip name to custom text, <blip, name>
if not SetBlipName then function SetBlipName(blip, name)
    N_0x9cb1a1623062f402(blip, TEXT(name))
end end
-- Get temperature at coords, <x, y, z>
if not GetCurrentTemperatureAtCoords then function GetCurrentTemperatureAtCoords(...)
    return N_0xb98b78c3768af6e0(...)
end end
-- Return if the user uses 24 hour time format
if not IsUsing24HourTime then function IsUsing24HourTime()
    return N_0x0177cf20345f44dd()
end end
-- Return if the user uses Celcius temperature format
if not IsUsingCelciusFormat then function IsUsingCelciusFormat()
    return N_0xff4aaf3275baab4f()
end end

-- Model request loop
function PerformRequest(hash)
    if HasModelLoaded(hash) then return true end
    RequestModel(hash, false)
    while not HasModelLoaded(hash) do Wait(0) end
    return true
end

function GetActivePlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

-- CreateVarString "wrapper"
function TEXT(text)
    return CreateVarString(10, 'LITERAL_STRING', text)
end

-- Prompt wrapper
function BuildPrompt(text, control, cb)
    local prompt = BeginRegisterPrompt()
    PromptSetText(prompt, text)
    PromptSetControlAction(prompt, control)
    if cb then
        cb(prompt)
    else
        -- default to infinite hold
        PromptSetHoldIndefinitelyMode(prompt)
    end
    EndRegisterPrompt(prompt)
    PromptSetEnabled(prompt, false)
    PromptSetVisible(prompt, false)
    return prompt
end

-- game text draw by smallo
-- somewhere
function DrawGameText(x, y, text, r, g, b, a, scaleX, scaleY)
    local fX = x / 1920
    local fY = y / 1080

    SetTextScale(scaleX, scaleY)
    SetTextColor(r, g, b, a)
    DrawText(TEXT(text), fX, fY)
end
