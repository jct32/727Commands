datarefs = get(datarefs)
command1 = get(command1)
description1 = get(description1)
command2 = get(command2)
description2 = get(description2)

function onCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        for toggle = 1, #datarefs do
            set(globalPropertyf(datarefs[toggle]), 1)
        end
    end
    return 0
end

function offCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        for toggle = 1, #datarefs do
            set(globalPropertyf(datarefs[toggle]), 0)
        end
    end
    return 0
end

onCommand = sasl.createCommand(command1, description1)
sasl.registerCommandHandler(onCommand, 0, onCommandHandler)

offCommand = sasl.createCommand(command2, description2)
sasl.registerCommandHandler(offCommand, 0, offCommandHandler)