luaColors
=========

Outputs nice colors to the terminal when using lua's print() function. This module also gives you extra information that is handy for tracing your messages through the code. 

Use inside the print() function to turn off/on text formatting and colors. 

##Available colors and formats:

###Text and background colors:
- Black
- Red
- Green
- Yellow
- Blue
- Magenta
- Cyan
- White

###Other options:
- Bold
- Underline
- Blink
- Inverse
- Strikeout

## Example:

```lua
-- Use lc to toggle different text formats and colors. Reset them with lc.off
local lc = require(“luaColors”)
print(lc.off .. lc.blue .. lc.bg.white .. “Hello Color World” .. lc.off);
-- Turns off previous format. 
-- Turns on blue color. 
-- Turns on white background.

```
