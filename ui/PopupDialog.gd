extends PopupDialog

# Declare member variables here. Examples:

# var a = 2
# var b = "text"
var current_scene: Node = null
# Called when the node enters the scene tree for the first time.
func _ready():
	popup()

func _on_Button_pressed():
	SceneManager.goto_scene("res://areas/inscri.tscn")
	pass # Replace with function body.
