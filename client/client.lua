RegisterCommand("help", function(source, args)
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = true,
	  args = {"[System]", "Fuck you! \n And your mother!"}
	})
end, false)