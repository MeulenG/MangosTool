-- Define templates for the new format
local templates = {
    { sentence = "Add [item] to my [container]", label = "add_item" },
    { sentence = "Put [item] in [container]", label = "add_item" },
    { sentence = "I need a [item] in my [container]", label = "add_item" },
    { sentence = "Teleport me to [location]", label = "teleport" },
    { sentence = "Take me to [location]", label = "teleport" },
    { sentence = "Move me to [location]", label = "teleport" }
    -- Add more templates as needed
}

-- Define variation lists (update as needed)
local items = {"Thrash Blade", "Arcane Staff", "Healing Potion"}
local containers = {"bag", "inventory"}
local locations = {"Stormwind", "Orgrimmar", "Undercity"}

-- Function to generate commands in the new format
function generateCommands()
    local commands = {}
    for _, template in ipairs(templates) do
        if template.label == "add_item" then
            for _, item in ipairs(items) do
                for _, container in ipairs(containers) do
                    local command = {
                        sentence = template.sentence:gsub("%[item%]", item):gsub("%[container%]", container),
                        label = template.label
                    }
                    table.insert(commands, command)
                end
            end
        elseif template.label == "teleport" then
            for _, location in ipairs(locations) do
                local command = {
                    sentence = template.sentence:gsub("%[location%]", location),
                    label = template.label
                }
                table.insert(commands, command)
            end
        end
    end
    return commands
end

-- Generate and print commands in the new format
local generatedCommands = generateCommands()
for _, command in ipairs(generatedCommands) do
    print("{ sentence = \"" .. command.sentence .. "\", label = \"" .. command.label .. "\" },")
end
