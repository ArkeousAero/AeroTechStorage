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
                stack_size = 10
            }
        })
    end
end
