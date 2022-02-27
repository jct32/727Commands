dataref1 = globalPropertyf(get(dataref1))
dataref2 = globalPropertyf(get(dataref2))
command1 = get(command1)
description1 = get(description1)
command2 = get(command2)
description2 = get(description2)
command3 = get(command3)
description3 = get(description3)

function commandOneHandler(phase)
    if phase == SASL_COMMAND_END then
        set(dataref2, 0)
        set(dataref1, 2)
    end
    return 0
end

function commandTwoHandler(phase)
    if phase == SASL_COMMAND_END then
        set(dataref2, 0)
        set(dataref1, 1)
    end
    return 0
end

function commandThreeHandler(phase)
    if phase == SASL_COMMAND_END then
        set(dataref2, 1)
    end
    return 0
end

commandOne = sasl.createCommand(command1, description1)
sasl.registerCommandHandler(commandOne, 0, commandOneHandler)

commandTwo = sasl.createCommand(command2, description2)
sasl.registerCommandHandler(commandTwo, 0, commandTwoHandler)

commandThree = sasl.createCommand(command3, description3)
sasl.registerCommandHandler(commandThree, 0, commandThreeHandler)