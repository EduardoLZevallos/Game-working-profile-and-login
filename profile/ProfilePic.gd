extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	$FileDialog.popup()


func _on_FileDialog_file_selected(path):
	var image =  Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(image,0)
	$Sprite.texture = texture
