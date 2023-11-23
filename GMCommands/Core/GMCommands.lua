local function tokenize(input)
    local tokens = {}
    for word in input:lower():gmatch("%w+") do
        table.insert(tokens, word)
    end
    return tokens
end

local function findCommand(tokens)
    local commands = {
        ["set"] = "set",
        ["level"] = "setLevel",
        ["teleport"] = "teleport",
        ["tp"] = "teleport"
    }

    for _, token in ipairs(tokens) do
        if commands[token] then
            return commands[token]
        end
    end
    return nil
end

local function extractParameters(command, tokens)
    if command == "setLevel" then
        for i, token in ipairs(tokens) do
            if tonumber(token) then
                return tonumber(token)
            end
        end
    end
end

local function interpretCommand(userInput)
    local tokens = tokenize(userInput)
    local command = findCommand(tokens)
    if command then
        local params = extractParameters(command, tokens)
        -- Map the interpreted command to an actual command
        if command == "setLevel" then
            return ".setlevel " .. (params or "")
        elseif command == "teleport" then
            -- Assuming teleport location is the token after 'teleport' or 'tp'
            return ".teleport " .. (params or "")
        end
    else
        return "Command not recognized"
    end
end

function onUserInput(input)
    local command = interpretCommand(input)
    print("Suggested Command: " .. command)
    -- Add functionality to display a button or option to execute 'command'
end