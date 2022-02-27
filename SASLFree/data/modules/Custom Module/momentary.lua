dataref = globalPropertyf(get(dataref))
command = get(command)
description = get(description)
initial = get(initial)
final = get(final)

function commandHandler(phase)
    if phase == SASL_COMMAND_BEGIN then
        set(dataref, initial)
    elseif phase == SASL_COMMAND_END then
        set(dataref, final)
    end
    return 0
end

onCommand = sasl.createCommand(command, description)
sasl.registerCommandHandler(onCommand, 0, commandHandler)