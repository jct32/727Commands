dataref = globalPropertyf(get(dataref))
positionSwitch = globalPropertyf("FJS/727/autopilot/altDialHunThouSwitch")
command1 = get(command1)
description1 = get(description1)
command2 = get(command2)
description2 = get(description2)
max = get(max)
min = get(min)

function increaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        if get(positionSwitch) == 1 then
            if (get(dataref) + 100) > max then
                set(dataref, max)
            else
                set(dataref, get(dataref) + 100)
            end
        else
            if (get(dataref) + 1000) > max then
                set(dataref, max)
            else
                set(dataref, get(dataref) + 1000)
            end
        end
    end
    return 0
end

function decreaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        if get(positionSwitch) == 1 then
            if (get(dataref) - 100) < min then
                set(dataref, min)
            else
                set(dataref, get(dataref) - 100)
            end
        else
            if (get(dataref) - 1000) < min then
                set(dataref, min)
            else
                set(dataref, get(dataref) - 1000)
            end
        end
    end
    return 0
end

onCommand = sasl.createCommand(command1, description1)
sasl.registerCommandHandler(onCommand, 0, increaseCommandHandler)

offCommand = sasl.createCommand(command2, description2)
sasl.registerCommandHandler(offCommand, 0, decreaseCommandHandler)