dataref1 = globalPropertyf(get(dataref1))
dataref2 = globalPropertyf(get(dataref2))
dataref3 = globalPropertyf(get(dataref3))
command1 = get(command1)
description1 = get(description1)
command2 = get(command2)
description2 = get(description2)
max = get(max)
min = get(min)
commandValue = 0

function increaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        commandValue = 0
    elseif phase == SASL_COMMAND_CONTINUE then
        commandValue = commandValue + 1
        if ((get(dataref1) < max) and (commandValue % 3 == 0)) then
            baro = get(dataref1) + 1
            set(dataref1, baro)
            set(dataref2, baro/100)
            set(dataref3, baro/100)
        end
    end
    return 0
end

function decreaseCommandHandler(phase)
    if phase == SASL_COMMAND_END then
        commandValue = 0
    elseif phase == SASL_COMMAND_CONTINUE then
        commandValue = commandValue - 1
        if ((get(dataref1) > min) and (commandValue % 3 == 0)) then
            baro = get(dataref1) - 1
            set(dataref1, baro)
            set(dataref2, baro/100)
            set(dataref3, baro/100)
        end
    end
    return 0
end

onCommand = sasl.createCommand(command1, description1)
sasl.registerCommandHandler(onCommand, 0, increaseCommandHandler)

offCommand = sasl.createCommand(command2, description2)
sasl.registerCommandHandler(offCommand, 0, decreaseCommandHandler)