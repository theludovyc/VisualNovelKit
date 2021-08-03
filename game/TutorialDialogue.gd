extends Dialogue

func intro():
	start_event("intro")
	show("dialogue")
	
	hide("code")
	say(null, 
		"This is Tutorial/Showcase Demo of Rakugo\n"
		+ "Choose what you want to see/learn about."
	)
	var begin_from = menu([
		["Scripting Dialogue Tutorial", "scripting"],
		"Markups",
		["Showing/Hide Character", "showing"],
		["Jumping Between Scenes/Dialogues", "jumping"],
		["More to Come", "more", {"disabled":true}]
	])

	match begin_from:
		"scripting":
			$"../Scripting/Dialogue".start()

		"Markups":
			$"../Markups/Dialogue".start()

		"showing":
			pass

		"jumping":
			pass
	
	end_event()



