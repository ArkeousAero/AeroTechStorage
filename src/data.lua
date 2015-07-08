require("config")

data:extend({
    {
        type = "item-group",
        name = "aerotech-storage",
        order = "z",
        inventory_order = "z",
        icon = "__AeroTechStorage__/graphics/aerotech-storage.png"
    },
    {
        type = "item-subgroup",
        name = "aerotech-storage-item",
        group = "aerotech-storage",
        order = 1
    },
    {
        type = "item-subgroup",
        name = "aerotech-storage-crate",
        group = "aerotech-storage",
        order = 1
    },
    {
        type = "item-subgroup",
        name = "aerotech-storage-uncrate",
        group = "aerotech-storage",
        order = 1
    }
})

for i,item in ipairs(packageable_items) do
    if data.raw.item[item] then
        data:extend({
            {
                type = "item",
                name = item.."-crate",
                icon = "__AeroTechStorage__/graphics/icon/"..item.."-crate.png",
                flags = {"goes-to-main-inventory"},
                subgroup = "aerotech-storage-item",
                order = "z",
                stack_size = 100
            },
            {
                type = "recipe",
                name = "crate-"..item,
                icon = "__AeroTechStorage__/graphics/crate/crate-"..item..".png",
                subgroup = "aerotech-storage-crate",
                order = item,
                enabled = "true",
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
                icon = "__AeroTechStorage__/graphics/uncrate/uncrate-"..item..".png",
                subgroup = "aerotech-storage-uncrate",
                order = item,
                enabled = "true",
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
