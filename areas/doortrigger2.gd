extends Area2D

var player

func _ready():
	set_process(false)
	
func _on_doortrigger2_body_entered(body):
	print(body)
	if body.name == "player":
		var spawn_data =  {
				"spawn_on_node": "house/door/doortrigger",
				}
		set_process(true)
		player = body
		SceneManager.goto_scene("res://areas/test1.tscn",spawn_data)

func _on_doortrigger2_body_exited(body):
	if body.name =="player":
		set_process(false)
		player = body
		
#func set_process(delta):
	#if player:
		#if player and $anim.play("walkdown"):
			
			#SceneManager.goto_scene("res://areas/test1.tscn",spawn_data)
			#get_tree().change_scene("res://areas/test1.tscn")



