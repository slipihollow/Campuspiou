extends Area2D

var player

func _ready():
	set_process(false)
	
func _on_doortrigger4_body_entered(body):
	print(body)
	if body.name == "player":
		set_process(true)
		player = body
		var spawn_data =  {
				"spawn_on_node": "house/door/doortrigger3",
				}
		SceneManager.goto_scene("res://areas/ppal.tscn",spawn_data)
			#get_tree().change_scene("res://areas/test1.tscn")

func _on_doortrigger4_body_exited(body):
	if body.name =="player":
		set_process(false)
		player = body
		


