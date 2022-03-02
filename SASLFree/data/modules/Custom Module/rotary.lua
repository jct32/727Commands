dataref = globalPropertyf(get(dataref))
command1 = get(command1)
description1 = get(description1)
command2 = get(command2)
description2 = get(description2)
max = get(max)
min = get(min)

function increaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        if get(dataref) < max then
            set(dataref, get(dataref)+1)
        end
    end
    return 0
end

function decreaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        if get(dataref) > min then
            set(dataref, get(dataref)-1)
        end
    end
    return 0
end

onCommand = sasl.createCommand(command1, description1)
sasl.registerCommandHandler(onCommand, 0, increaseCommandHandler)

offCommand = sasl.createCommand(command2, description2)
sasl.registerCommandHandler(offCommand, 0, decreaseCommandHandler)