---@diagnostic disable: undefined-global
-- 加载basiclua
require("configure.basic")

-- 加载lazy
require("module.lazy-init")

-- 加载键盘映射
require("keymap.init")


-- 加载endlua
require("configure.end")
