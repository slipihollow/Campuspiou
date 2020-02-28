extends PopupDialog

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var z_index = 999
# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	z_index
	popup_centered(Vector2 (641, 0))
	pass # Replace with function body.



func _on_Button_pressed():
	_on_PopupDialog_popup_hide()
	pass	
	
func _on_PopupDialog_popup_hide():
	queue_free()
	pass # Replace with function body.
	

