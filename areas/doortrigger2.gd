extends Area2D

var player

func _ready():
	set_process(false)
	
func _on_doortrigger_body_entered(body):
	print(body)
	if body.name == "player":
		set_process(true)
		player = body
		Global.goto_scene("res://areas/test1.tscn")

func _on_doortrigger_body_exited(body):
	if body.name =="player":
		set_process(false)
		player = body
		
func _process(delta):
	if player:
		if player and player.get_node("anim").AnimationPlayer == "walkdown":
			var spawn_data =  {
				"spawn_on_node": "house/door/doortrigger",
				}
			SceneManager.goto_scene("res://areas/test1.tscn", spawn_data)
			#get_tree().change_scene("res://areas/test1.tscn")
