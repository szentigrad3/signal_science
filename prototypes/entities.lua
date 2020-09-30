local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
entity.name = "assembling-machine-dynamic-1"
entity.minable.result = "assembling-machine-dynamic-1"
data:extend{entity}

local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
entity.name = "assembling-machine-dynamic-2"
entity.minable.result = "assembling-machine-dynamic-2"
data:extend{entity}

local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
entity.name = "assembling-machine-dynamic-3"
entity.minable.result = "assembling-machine-dynamic-3"
data:extend{entity}
