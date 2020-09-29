data:extend{
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
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
      ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}},
      time = 30
    },
    order = "a-b-c"
  },
}