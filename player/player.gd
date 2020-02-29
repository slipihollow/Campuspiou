extends "res://engine/entity.gd"

######
class_name Player
onready var swordsounds = $"audioeffect/swordsound"
onready var spearsounds = $"audioeffect/spearsound"
######
var state = "default"

var keys = 0
var questies = 0

func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
		"attac":
			state_attac()
	
	keys = min(keys, 9)
	
func state_default():
	controls_loop()
	movement_loop()
	spritedir_loop()
	damage_loop()
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
		
	else:
		anim_switch("stand")
		
	if Input.is_action_just_pressed("ui_att"):
		use_item(preload("res://items/attack.tscn"))
		anim_switch("att")
		#######
		swordsounds.play()
		#######
	if Input.is_action_just_pressed("ui_attD"):
		use_item(preload("res://items/attackD.tscn"))
		########
		spearsounds.play()
		########


func state_swing():
	anim_switch("stand")
	movement_loop()
	damage_loop()
	movedir = dir.center
	
func state_attac():
	anim_switch("att")
	movement_loop()
	damage_loop()
	movedir = dir.center
	

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")

	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
