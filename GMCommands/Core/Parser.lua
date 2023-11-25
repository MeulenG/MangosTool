function TeleportPlayer(destination)
    TeleportHandler(destination)
    return destination
end


function AddItem(player, itemDetails)
    
end

function CycleCommands(command)
    for _, word in ipairs(commands) do
        if commands[word] then
            return commands[word]
        end
    end
    return nil
end