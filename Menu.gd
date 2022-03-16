extends Control

func _ready():
	$VBoxContainer/Profile.grab_focus()


func _on_Profile_pressed():
	pass # Replace with function body.


func _on_Character_Selection_pressed():
	get_tree().change_scene("res://CharacterSelection.tscn")


func _on_Map_pressed():
	get_tree().change_scene("res://Level1.tscn")


func _on_Friend_List_pressed():
	pass # Replace with function body.


func _on_Achievement_pressed():
	pass # Replace with function body.


func _on_Quit_pressed():
	get_tree().quit()
