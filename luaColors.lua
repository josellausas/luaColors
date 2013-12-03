--[[ luaColors.lua by jose@josellausas.com 
	
	Allows for the usage of terminal colors with lua's print() function.
	Usage: print(luaColors.red .. "Hello Red World" .. luaColors.off) will print in red to terminal console.
]]

local luaColors = {}
--[[Whenever Lua sees a \ followed by a decimal number, 
it converts this decimal number into its ASCII equivalent.]]
luaColors.esc = '\27'

-- Defines the font colors
luaColors.black 	 	= luaColors.esc .. '[30m' 
luaColors.red 	 	 	= luaColors.esc .. '[31m'
luaColors.green 	 	= luaColors.esc .. '[32m'
luaColors.yellow 	 	= luaColors.esc .. '[33m'
luaColors.blue 	 		= luaColors.esc .. '[34m'
luaColors.magenta 	 	= luaColors.esc .. '[35m'
luaColors.cyan 	 		= luaColors.esc .. '[36m'
luaColors.white 	 	= luaColors.esc .. '[37m'


-- Defines the backgorund colors
luaColors.bg = {}

luaColors.bg.black    = luaColors.esc .. '[40m'
luaColors.bg.red 	  = luaColors.esc .. '[41m'
luaColors.bg.green    = luaColors.esc .. '[42m'
luaColors.bg.yellow   = luaColors.esc .. '[43m'
luaColors.bg.blue 	  = luaColors.esc .. '[44m'
luaColors.bg.magenta  = luaColors.esc .. '[45m'
luaColors.bg.cyan 	  = luaColors.esc .. '[46m'
luaColors.bg.white    = luaColors.esc .. '[47m'

-- Other attributes
luaColors.bold		  	= luaColors.esc .. '[1m'
luaColors.underline		= luaColors.esc .. '[4m'
luaColors.blink			= luaColors.esc .. '[5m'
luaColors.inverse		= luaColors.esc .. '[7m'
luaColors.strikeout    	= luaColors.esc .. '[8m'
luaColors.off		    = luaColors.esc .. '[0m'

luaColors.endl			= luaColors.esc .. '[0m\n'

luaColors.important = luaColors.esc .. '[1;44;37m'
luaColors.error    = luaColors.esc .. '[1;5;41;37m'



---------------------------------------------------------------
-- This overrides the print function: 
--[[
-- Each print() call will display: 
			- Source file path.
			- Invoking function name.
			- Invoking line number.
			- Original message.
		
-- Example Output for 'print("Welcome!")' :

		sourceFile:		/Users/theUser/folder/./myFile.lua
		Function:		myCallingFunction() -->[ 169 ] --> Welcome!
 
 ]]
---------------------------------------------------------------
local original_print = print -- Stores the original function
print = function(message) 

	-- According to lua documentation, debug.getinfo() is expensive and not very efficient.
	-- We call the function once and store all its values to prevent calling it too often.
	local di 	= debug.getinfo(2) 
	-- The parameter specifies the stack level
		-- '0' = Gets info for getinfo() function
		-- '1' = Gets info for this print() function
		-- '2' = Gets info about the function that called print()

	-- Now we have access to the invoking function's details
    local source_file 	= di.short_src
    local line 			= di.currentline
    local funcName 		= di.name

    -- Not all functions have a name, replace nil with <nameless>
    if funcName then
    	funcName = funcName .. "()"
    else
    	funcName = "()"
    end

    -- Build a colorful and formatted print log. 
	local theString =  "\n" .. 
	luaColors.red .. 
	luaColors.bold .. "+] Source: " .. luaColors.off .. 
	luaColors.underline .. source_file .. luaColors.off .. "\n" .. 
	luaColors.red .. 
	luaColors.bold .. "+] Function: " .. luaColors.off .. 
	luaColors.green .. 
	luaColors.bold .. 
	funcName .. " - " ..
	luaColors.off .. luaColors.off .. 
	luaColors.bold .. luaColors.magenta .. "[line " .. line .. "]" .. luaColors.off .. 
	luaColors.cyan ..  "\n=]>> "  .. luaColors.off .. luaColors.bold .. message .. luaColors.off .. luaColors.off;

	-- Prints with the original print function    
    original_print(theString)

end

-- This is the welcome message
local welcomeMessage =  "\n\n\t\t" .. luaColors.bold .. luaColors.inverse .. luaColors.bg.cyan .. luaColors.red .. 
" Hello! The luaConsoleColors was created by:" .. luaColors.off .. "\n" ..
luaColors.cyan .. luaColors.blink .. "\t\t---------------------------------\n".. luaColors.off .. "\t\t   " .. 
luaColors.bold .. luaColors.underline .. luaColors.green .. "jose@josellausas.com" .. luaColors.off .. "\n" ..
luaColors.cyan .. luaColors.blink .. "\t\t---------------------------------\n".. luaColors.off;
-- Print our welcome message with pretty colors
original_print(welcomeMessage)



return luaColors;
