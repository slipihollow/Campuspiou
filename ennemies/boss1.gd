extends "res://engine/entity.gd"

const DAMAGE = 1

var player : Player

func _ready() -> void:
	$areadetector.connect("body_entered",self,"_on_areadetector_body_entered")
	set_physics_process(false)

func _physics_process(delta : float) -> void:
	damage_loop()
	movement_loop()
	var direction : = (player.global_position - global_position).normalized()
	var distance_to_player : = global_position.distance_to(player.global_position)
	#$sprite.flip_h = direction.x < 0
	if direction.x < 0:
		$anim.play("boss1L")
	else:
		$anim.play("boss1R")
	if distance_to_player <= min_move_distance:
		move_and_collide(direction * SPEED * delta)

func _on_areadetector_body_entered(body):
	if not body is Player:
		return
	player = body
	set_physics_process(true)
	$areadetector.disconnect("body_entered",self,"_on_areadetector_body_entered")

