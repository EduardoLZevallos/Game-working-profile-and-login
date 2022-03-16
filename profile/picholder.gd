extends HBoxContainer

func _on_FileDialog_file_selected(path):
	var image =  Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(image,0)
	$Sprite.texture = texture


func _on_changepropic_pressed():
	$FileDialog.popup()
