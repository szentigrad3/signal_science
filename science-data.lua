data:extend(
{ 
  {
    type = "recipe",
    name = "automation-science-data",
    energy_required = 5,
    ingredients =
    {
      {"copper-plate", 1},
      {"iron-gear-wheel", 1}
    },
    result = "automation-science-data"
  },
  {
    type = "recipe",
    name = "logistic-science-data",
    enabled = false,
    energy_required = 6,
    ingredients =
    {
      {"inserter", 1},
      {"transport-belt", 1}
    },
    result = "logistic-science-data"
  },
  {
    type = "recipe",
    name = "chemical-science-data",
    enabled = false,
    energy_required = 24,
    ingredients =
    {
      {"engine-unit", 2},
      {"advanced-circuit", 3},
      {"sulfur", 1}
    },
    result_count = 2,
    result = "chemical-science-data"
  },
  {
    type = "recipe",
    name = "military-science-data",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"piercing-rounds-magazine", 1},
      {"grenade", 1},
      {"stone-wall", 2}
    },
    result_count = 2,
    result = "military-science-data"
  },
  {
    type = "recipe",
    name = "production-science-data",
    enabled = false,
    energy_required = 21,
    ingredients =
    {
     {"electric-furnace", 1},
     {"productivity-module", 1},
     {"rail", 30}
    },
    result_count = 3,
    result = "production-science-data"
  },
  {
    type = "recipe",
    name = "utility-science-data",
    enabled = false,
    energy_required = 21,
    ingredients =
    {
      {"low-density-structure", 3},
      {"processing-unit", 2},
      {"flying-robot-frame", 1}
    },
    result_count = 3,
    result = "utility-science-data"
  },
 {
    type = "tool",
    name = "automation-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/automation-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "a[automation-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
  {
    type = "tool",
    name = "logistic-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/logistic-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "b[logistic-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
    {
    type = "tool",
    name = "chemical-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/chemical-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "d[chemical-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
  {
    type = "tool",
    name = "military-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/military-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "c[military-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
  {
    type = "tool",
    name = "production-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/production-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "e[production-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
  {
    type = "tool",
    name = "utility-science-data",
    localised_description = {"item-description.science-data"},
    icon = "__base__/graphics/icons/utility-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "f[utility-science-data]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
  {
    type = "tool",
    name = "space-science-data",
    icon = "__base__/graphics/icons/space-science-pack.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "science-data",
    order = "g[space-science-data]",
    stack_size = 2000,
    durability = 1,
    rocket_launch_product = {"raw-fish", 1},
    durability_description_key = "description.science-data-remaining-amount-key",
    durability_description_value = "description.science-data-remaining-amount-value"
  },
})  