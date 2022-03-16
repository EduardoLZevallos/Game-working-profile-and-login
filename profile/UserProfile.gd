extends Control

#onready var http : HTTPRequest = $HTTPRequest
onready var nickname = $Container/VBoxContainer2/Name/LineEdit
onready var strength : Slider = $Container/VBoxContainer2/Strength/Slider


var new_profile := false

var profile := {
	"nickname": {},
	"character_class": {},
	"strength": {}
} #setget set_profile

#pulls the document with the fields we need for the profile
func _ready() -> void:
	#calls the document with the data associated with the email
	var collection : FirestoreCollection = Firebase.Firestore.collection("userdata")
	collection.get(Global.email)
	var document : FirestoreDocument = yield(collection, "get_document")
	
	#has all the fields associated with our firestore db 
	self.profile = document.doc_fields;
	
	# if size of profile is one means there is only the email in the firestore db 
	if profile.size() == 1:
		new_profile = true;
	#it is an old profile set it 
	else: 
		set_profile(self.profile)
	

#updates the info to the profile 
#might be broken
func _on_ConfirmButton_pressed() -> void:
	#want to implement a notifcation to enter your nickname 
	if nickname.text.empty(): #or character_class.text.empty():
		#notification.text = "Please, enter your nickname and class"
		return
	#profile["nickname"]= { "stringValue": nickname.text }
	#profile.character_class = { "stringValue": character_class.text }
	#profile["strength"]= { "integerValue": strength.value }
	#profile.intelligence = { "integerValue": intelligence.value }
	#profile.dexterity = { "integerValue": dexterity.value }
	
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("userdata")
	#match new_profile:
	var up_task : FirestoreTask = firestore_collection.update(Global.email, {'nickname': nickname.text, 'strength': strength.value})
	var document : FirestoreTask = yield(up_task, "task_finished");


#function to set the profile 
func set_profile(value: Dictionary) -> void:
	#might want to do a find condition on the dictionary in case some profiles dont have all fields
	profile = value
	nickname.text = profile["nickname"];
	#character_class.text = profile.character_class.stringValue
	strength.value = profile["strength"]
	#intelligence.value = int(profile.intelligence.integerValue)
	#dexterity.value = int(profile.dexterity.integerValue)







# insert path to main menu in quotes
func _on_mainmenu_pressed():
	get_tree().change_scene("")


func _on_exit_pressed():
	get_tree().quit()
