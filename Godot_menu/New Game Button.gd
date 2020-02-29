extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_node("AudioStreamPlayer")
onready var timer = get_parent().get_node("AudioStreamPlayer/Timer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_New_Game_Button_pressed():
  player.play()
  timer.start()
  yield(timer, "timeout")
  SceneManager.goto_scene("res://ui/Intro.tscn")	

func _on_Timer_timeout():
	pass # Replace with function body.
