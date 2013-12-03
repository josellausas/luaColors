----------------------------------------
-- main.lua by jose@josellausas.com
-- created on: Dec 3, 2013
-- This is a sample usage of luaColors

-- Require the luaColors module and use is as lc
local lc = require("luaColors")

-- The standard print that has now been overrided with a colorful one:
print("Hello luaColors")

-- Other examples:
-- Turns off current format and sets the color to blue
print(lc.off .. lc.blue .. "Hello Blue!" .. lc.off)

-- Sets the background to magenta and color to white, then turns off format
print(lc.bg.magenta .. lc.white .. "Hello Background!" .. lc.off)

-- Sets the format to blink text
print(lc.blink .. "Bye bye!" .. lc.off)