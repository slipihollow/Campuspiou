extends Area2D

var player

func _ready():
	set_process(false)
	
func _on_doortrigger3_body_entered(body):
	print(body)
	if body.name == "player":
		set_process(true)
		player = body
		#get_tree().change_scene("res://areas/inside1.tscn")
		SceneManager.goto_scene("res://areas/cafe.tscn")

func _on_doortrigger3_body_exited(body):
	if body.name == "player":
		set_process(false)
		player = body
		
func _process(delta):
	#if player:
		#if player.get_node("anim").anim == "walkup":
			SceneManager.goto_scene("res://areas/cafe.tscn")
			#get_tree().change_scene("res://areas/inside1.tscn")

