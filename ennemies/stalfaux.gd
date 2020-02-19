extends "res://engine/entity.gd"

const DAMAGE = 0.25

var movetimer_lenght = 15
var movetimer = 0

func _ready():
	$anim.play("stalfaux")
	movedir = dir.rand()
	
func _physics_process(delta):
	movement_loop()
	damage_loop()
	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 || is_on_wall():
		movedir = dir.rand()
		movetimer = movetimer_lenght
	#####
	#####