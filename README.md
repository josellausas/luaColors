luaColors by jose@josellausas.com
=========

Output nice colors to the terminal using lua. This module also overrides the print() function to something more useful.

Use inside the print() function to turn off/on text formatting and colors. 

Example:
1. Turns off previous format. 
2. Turns on blue color. 
3. Turns on white background.

local lc = require(“luaColors”)
print(lc.off .. lc.blue .. lc.bg.white .. “Hello World” .. lc.off);

