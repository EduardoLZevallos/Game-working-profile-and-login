extends Control

var matches = [] # array to hold all possible matches to user input text


onready var items = $ScrollContainer/listoffriends.get_children() # scroll items in friends list



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# function to fulfill actions based on what user types
func _on_LineEdit_text_changed(new_text):
	new_text = new_text.to_lower() # casefold to avoid case sensitivity
	if new_text=="":
		for i in items:
			i.show() 
		return
	matches.clear() # ensures no innacurate results are shown
	for i in items:
		if new_text in i.text.to_lower():
			matches.append(i)
	for i in items:
		if i in matches:
			i.show()
		else:
			i.hide()



func _on_exit_pressed():
	get_tree().quit()


func _on_PLAY_pressed():
	get_tree().change_scene("res://Level1.tscn")


func _on_back_pressed():
	pass


func _on_findfriends_pressed():
	pass # Replace with function body.
