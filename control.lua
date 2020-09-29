local function onTick()

networks = {
  {
    inputs = {
      {
        entity = <the entity representing the connection>,
        buffer = <the amount/type of data available for transmission>,
      },
      ...
    },
    outputs = {
      {
        entity = <the entity representing the connection>,
        buffer = <the amount/type of data received and available for further consumption>,
      },
      ...
    },
  },
  ...
}
end

local dynamic_assembler_types = {
  ['assembling-machine-dynamic-1']=true,
  ['assembling-machine-dynamic-2']=true,
  ['assembling-machine-dynamic-3']=true,
}

local function onBuilt(event)
  local entity = event.created_entity
  if dynamic_assembler_types[entity.name] then

    local combinatorpos = {entity.position.x+2,entity.position.y}

    local combinator = entity.surface.find_entity("constant-combinator",combinatorpos)

    if not combinator then
      local ghost = entity.surface.find_entity("entity-ghost", combinatorpos)
      if ghost and ghost.valid and ghost.ghost_name == "constant-combinator" then
        _,combinator = ghost.revive()
      end
    end

    if not combinator then
      combinator = entity.surface.create_entity{
        name="constant-combinator",
        position = combinatorpos,
        force = entity.force
      }
    end


    combinator.operable=false
    combinator.minable=false
    combinator.destructible=false

    local control = combinator.get_or_create_control_behavior()

    local entData = {control = control, assembler=entity, combinator=combinator}
    global.dynamic_assemblers = global.dynamic_assemblers or {}
    table.insert(global.dynamic_assemblers,entData)
  end
end


script.on_event(defines.events.on_tick, onTick)
script.on_event(defines.events.on_built_entity, onBuilt)
script.on_event(defines.events.on_robot_built_entity, onBuilt)


