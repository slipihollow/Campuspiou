extends Control

# Declare member variables here. Examples:
# va1lled when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_New_Game_Button_pressed():
	pass
#	get_tree().change_scene("res://ui/Intro.tscn")
	

func _on_Button_pressed():
	get_tree().quit()
	