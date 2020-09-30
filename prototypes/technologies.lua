for index, tech in pairs(data.raw.technology) do
local amountb = 0
for indexs, ingred in pairs(tech.unit.ingredients) do
local a = ingred.amount or ingred[2]
amountb = amountb + a
end
amountb = amountb / 100
if(amountb < 1) then
amountb = 1
end
tech.unit.ingredients = {{type="item", name="dummysciencepack", amount=amountb}}
--[[data:extend{
  {
    type = "technology",
    name = "assembling-machine-dynamic-1",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-dynamic-1"
      }
    },
    prerequisites = {"automation-1"},
    unit =
    {
      count = 50,
      ingredients = {"dummysciencepack", amountb},
      time = 30
    },
    order = "a-b-c"
  },
  {
    type = "technology",
    name = "assembling-machine-dynamic-2",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-dynamic-2"
      }
    },
    prerequisites = { "circuit-network", "automation-2"},
    unit =
    {
      count = 50,
      ingredients = {"dummysciencepack", amountb},
      time = 30
    },
    order = "a-b-c"
  },
  {
    type = "technology",
    name = "assembling-machine-dynamic-3",
    icon = "__base__/graphics/technology/automation.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine-dynamic-3"
      },
    },
    prerequisites = { "assembling-machine-dynamic", "automation-3", "oil-processing"},
    unit =
    {
      count = 50,
      ingredients = {"dummysciencepack", amountb},
      time = 30
    },
    order = "a-b-c"
  },
}]]--
end