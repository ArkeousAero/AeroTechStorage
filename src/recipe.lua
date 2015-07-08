for i,item in ipairs(packageable_items) do
    if data.raw.item[item] then
        data:extend({
            {
                type = "recipe",
                name = "crate-"..item,
                category = "advanced-crafting",
                icon = "__AeroTechStorage__/graphics/crate/crate-"..item..".png",
                subgroup = "aerotech-storage-crate",
                order = item,
                enabled = "false",
                energy_required = 10,
                ingredients = 
                {
                    {"wooden-chest", 1},
                    {item, data.raw.item[item].stack_size}
                },
                result = item.."-crate",
                result_count = 1
            },
            {
                type = "recipe",
                name = "uncrate-"..item,
                category = "advanced-crafting",
                icon = "__AeroTechStorage__/graphics/uncrate/uncrate-"..item..".png",
                subgroup = "aerotech-storage-uncrate",
                order = item,
                enabled = "false",
                energy_required = 10,
                ingredients = 
                {
                    {item.."-crate", 1},
                },
                result = item,
                result_count = data.raw.item[item].stack_size
            }
        })
    end
end
