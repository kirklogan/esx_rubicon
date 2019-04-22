RegisterCommand("help", function(source, args)
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"Me", "Fuck you!"}
	})
end, false)