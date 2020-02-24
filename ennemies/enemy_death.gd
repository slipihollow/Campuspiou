extends Node2D
######
onready var deathsounds = $"audioeffect/deathsound"
######
func _ready():
	$anim.play("default")
	#####
	deathsounds.play()
	#####
	$anim.connect("animation_finished",self,"destroy")

func destroy(animation): #faire disparaître le sprite à sa mort
	queue_free()