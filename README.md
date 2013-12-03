luaColors
=========

Output nice colors to the terminal using lua. This module also overrides the print() function to something more useful.

Use inside the print() function to turn off/on text formatting and colors. 

### Example:
- Turns off previous format. 
- Turns on blue color. 
- Turns on white background.

```lua
local lc = require(“luaColors”)
print(lc.off .. lc.blue .. lc.bg.white .. “Hello World” .. lc.off);
```
