RegisterCommand("testMeDaddy", function(source, args)
    TriggerEvent('chat:addMessage', {
	  color = { 255, 0, 0},
	  multiline = false,
	  args = {"Daddy", "Testing you"}
	})
end, false)