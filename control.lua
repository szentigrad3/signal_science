require("prototypes/gui")
local crafting_machine = require("prototypes/crafting-machine")

local dynamic_assembler_types = {
  ['assembling-machine-dynamic-1']=true,
  ['assembling-machine-dynamic-2']=true,
  ['assembling-machine-dynamic-3']=true,
  ['super-computer']=true,
}

local function on_built(event)
local entity = event.entity or event.created_entity or event.destination
  if dynamic_assembler_types[entity.name] then

    local combinatorpos = {entity.position.x,entity.position.y+1}

    local combinator = entity.surface.find_entity("entity-information-reader",combinatorpos)

    if not combinator then
      local ghost = entity.surface.find_entity("entity-ghost", combinatorpos)
      if ghost and ghost.valid and ghost.ghost_name == "entity-information-reader" then
        _,combinator = ghost.revive()
      end
    end

    if not combinator then
      combinator = entity.surface.create_entity{
        name="entity-information-reader",
        position = combinatorpos,
        force = entity.force,
      }
    end

  if entity.name == "entity-information-reader" then
    entity.health = 0
    local entities = entity.surface.find_entities_filtered{position=entity.position, name="entity-information-reader", type="construction-robot", invert=true}
    local connected_entity
    if #entities > 0 then
      connected_entity = entities[1]
      local sprite_id = rendering.draw_sprite{sprite="entity/entity-information-reader", target=entity, surface=entity.surface, x_scale=0.4, y_scale=0.4}
      global.combinators[entity.position.x..","..entity.position.y] = {combinator=entity, entity=connected_entity, location=entity.position, sprite=sprite_id}
      entity.get_control_behavior().enabled = true
    else
	      -- entity.get_control_behavior().enabled = false
    end
  elseif entity.type ~= "entity-ghost" then
    local combinators = entity.surface.find_entities_filtered{area=entity.bounding_box, name="entity-information-reader"}
    for _, combinator in pairs(combinators) do
      if combinator.valid then
        local sprite_id = rendering.draw_sprite{sprite="entity/entity-information-reader", target=combinator, surface=entity.surface, x_scale=0.4, y_scale=0.4}
        global.combinators[combinator.position.x..","..combinator.position.y] = {combinator=combinator, entity=entity, location=combinator.position, sprite=sprite_id}
        combinator.get_control_behavior().enabled = true
      end
    end
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

local function on_tick()
  if not global.combinators then
    global.combinators = {}
  end
  for i, tbl in pairs(global.combinators) do
    if tbl.valid == false then
      if tbl.sprite ~= nil then
        rendering.destroy(tbl.sprite)
      end
      global.combinators[i] = nil
    elseif not tbl.combinator or not tbl.combinator.valid then
      if tbl.sprite ~= nil then
        rendering.destroy(tbl.sprite)
      end
      global.combinators[i] = nil
    elseif not tbl.entity or not tbl.entity.valid then
      if tbl.sprite ~= nil then
        rendering.destroy(tbl.sprite)
      end
      global.combinators[i] = nil
      tbl.combinator.get_control_behavior().enabled = false
    else
      local cb = tbl.combinator.get_control_behavior()
      if cb.enabled then
        local indices = {}
        for k, param in pairs(cb.parameters.parameters) do
          if param.signal.name then
            indices[param.index] = param.signal
          end
        end
        local signals = crafting_machine.calc_signals(tbl.entity, indices)
        local second_signals = {}
        for k, v in pairs(second_signals) do
          signals[k] = v
        end
        for index, count in pairs(signals) do
          local next_signal
          local cur_signal = cb.get_signal(index)
          next_signal = {signal=cur_signal.signal, count=count}
          cb.set_signal(index, next_signal)
        end
      end
    end
  end
end

script.on_event({defines.events.on_entity_cloned, defines.events.on_robot_built_entity, defines.events.on_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, on_built)
script.on_event(defines.events.on_entity_settings_pasted, on_settings_pasted)
script.on_nth_tick(1, on_tick)
