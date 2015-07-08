storage_technology =
{
    type = "technology",
    name = "aerotech-storage",
    icon = "__AeroTechStorage__/graphics/aerotech-storage.png",
    effects = {},
    prerequisites = {"automation-2"},
    unit =
    {
        count = 200,
        ingredients =
        {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 10
    },
    order = "z",
}

for i,item in ipairs(packageable_items) do
    if data.raw.item[item] then
        storage_technology.effects[2*i-1] = {type = "unlock-recipe",recipe = "crate-"..item}
        storage_technology.effects[2*i] = {type = "unlock-recipe",recipe = "uncrate-"..item}
    end
end

data:extend({storage_technology})
