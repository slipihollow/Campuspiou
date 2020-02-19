extends Node2D

var TYPE = null

const DAMAGE = 1

var maxamount = 1

func _ready():
	TYPE = get_parent().TYPE #verifie le type
	$anima.connect("animation_finished",self,"destroy") #détruire l'animation à sa fin
	$anima.play(str("sword2",get_parent().spritedir))
	
	if get_parent().has_method("state_swing"):
		get_parent().state = "att"
		
func destroy(animation):
	if get_parent().has_method("state_swing"):
		get_parent().state = "default"
	queue_free()
	
