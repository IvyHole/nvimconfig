local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local p = require "luasnip.extras.postfix".postfix

local function get_file_name(file)
    return file:match("[^/]*.lua$");
end


return {
    s( { trig = "desc" }, 
        fmt([[
            /************* 
            * {file}
            * {name} : {date}
            *************/
        ]], 
        {
            file = t(get_file_name(debug.getinfo(1,'S').short_src)),
            name = i(1, "name"),
            date = t(os.date("%Y-%m-%d"))
        })
    )
}
