require("neorg.modules.base")
local log = require("neorg.external.log")

-- https://github.com/danymat/neorg-gtd-things/blob/main/lua/neorg/modules/external/integrations/gtd-things/module.lua
-- https://github.com/meiji163/gh-notify

local mandatory_funs = {
    "tasks", "projects",
}
local fun_groups = { "get" }

local function e(...)
    return table.concat({ unpack(...) })
end

Register = function(name, t)
    if t["get"] == nil then
        error("api must define group get")
    end
    for _, vv in ipairs(mandatory_funs) do
        if t.get[vv] == nil then
            error(e("need to define get.", vv))
        end
    end
    local module = neorg.modules.create("external.integrations." .. name)
    -- TODO: All the boilerplate from dany's code goes here
end
