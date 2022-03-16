extends Control


func _ready():
	$SignContainer.connect("logged", self, "_on_logged_go_to_profile")
	$SignContainer.connect("signed", self, "_on_logged_in")
	$SignContainer.connect("error", self, "_on_logged_in")

func _on_logged_in(value):
	print(value);

func _on_logged_go_to_profile(value):
	# will use this function to switch to the next page 
	get_tree().change_scene("res://profile/UserProfile.tscn")
	
func _on_Forgot_pressed():
	Firebase.Auth.send_password_reset_email($SignContainer.email)
	print("YOU FORGOT")

	
