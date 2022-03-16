extends Control

var matches = [] # array to hold all possible matches to user input text
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var items =$ScrollContainer/listoffriends.get_children()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
