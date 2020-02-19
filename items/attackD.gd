extends Node2D

var TYPE = null

const DAMAGE = 0.5

var maxamount = 3

var movedir = null
const SPEED = 160

func _ready():
	add_to_group("projectile")
	add_to_group("destroy_on_hit")
	
	TYPE = get_parent().TYPE #verifie le type
	movedir = get_parent().last_movedir
	position = get_parent().position
	$anim.play(get_parent().spritedir)
	
	var new_parent = get_parent().get_parent()
	get_parent().remove_child(self)
	new_parent.add_child(self)

func _process(delta):
	global_position += movedir * SPEED * delta
