-- This is a sample usage of luaColors

local lc = require("luaColors")

-- lc.off turns off the current color formatting

print("Hello luaColors")
print(lc.off .. lc.blue .. "Hello Blue!" .. lc.off)
print(lc.bg.magenta .. lc.white .. "Hello Background!" .. lc.off)
print(lc.blink .. "Bye bye!" .. lc.off)