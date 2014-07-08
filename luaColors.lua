--[[ luaColors.lua by jose@josellausas.com 
	
	Allows for the usage of terminal colors with lua's print() function.
	Usage: print(luaColors.red .. "Hello Red World" .. luaColors.off) will print in red to terminal console.
]]


local ll = {}
--[[Whenever Lua sees a \ followed by a decimal number, 
it converts this decimal number into its ASCII equivalent.]]
ll.esc = '\27'

-- Defines the font colors
ll.black 	 	= ll.esc .. '[30m' 
ll.red 	 	 	= ll.esc .. '[31m'
ll.green 	 	= ll.esc .. '[32m'
ll.yellow 	 	= ll.esc .. '[33m'
ll.blue 	 	= ll.esc .. '[34m'
ll.magenta 	 	= ll.esc .. '[35m'
ll.cyan 	 	= ll.esc .. '[36m'
ll.white 	 	= ll.esc .. '[37m'


-- Defines the backgorund colors
ll.bg = {}

ll.bg.black   = ll.esc .. '[40m'
ll.bg.red 	  = ll.esc .. '[41m'
ll.bg.green   = ll.esc .. '[42m'
ll.bg.yellow  = ll.esc .. '[43m'
ll.bg.blue 	  = ll.esc .. '[44m'
ll.bg.magenta = ll.esc .. '[45m'
ll.bg.cyan 	  = ll.esc .. '[46m'
ll.bg.white   = ll.esc .. '[47m'

-- Other attributes
ll.bold		  	= ll.esc .. '[1m'
ll.underline	= ll.esc .. '[4m'
ll.blink		= ll.esc .. '[5m'
ll.inverse		= ll.esc .. '[7m'
ll.strikeout    = ll.esc .. '[8m'
ll.off		    = ll.esc .. '[0m'

ll.endl			= ll.esc .. '[0m\n'

ll.important = ll.esc .. '[1;44;37m'
ll.error    = ll.esc .. '[1;5;41;37m'



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

    -- The print fails if a message is nil or a table. 
    -- This is now fixed!
    -- Handle nil variables
    local betterMessage = message or 'nil';

    -- Handle table concatenatiosn
    if type(betterMessage) == "table" then
    	betterMessage = tostring( betterMessage )
    end

    -- Build a colorful and formatted print log. 
	local theString =  "\n" .. 
	ll.red .. 
	ll.bold .. "+] Source: " .. ll.off .. 
	ll.underline .. source_file .. ll.off .. "\n" .. 
	ll.red .. 
	ll.bold .. "+] Function: " .. ll.off .. 
	ll.green .. 
	ll.bold .. 
	funcName .. " - " ..
	ll.off .. ll.off .. 
	ll.bold .. ll.magenta .. "[line " .. line .. "]" .. ll.off .. 
	ll.cyan ..  "\n=]>> "  .. ll.off .. ll.bold .. betterMessage .. ll.off .. "\n\n";

	-- Prints with the original print function    
    original_print(theString)

end

-- This is the welcome message
local welcomeMessage =  "\n\n\t\t" .. ll.bold .. ll.inverse .. ll.bg.cyan .. ll.red .. 
" Hello! The luaConsoleColors was created by:" .. ll.off .. "\n" ..
ll.cyan .. ll.blink .. "\t\t---------------------------------\n".. ll.off .. "\t\t   " .. 
ll.bold .. ll.underline .. ll.green .. "jose@josellausas.com" .. ll.off .. "\n" ..
ll.cyan .. ll.blink .. "\t\t---------------------------------\n".. ll.off .. 
"\n\n"
-- Print our welcome message with pretty colors
original_print(welcomeMessage)



return ll;
