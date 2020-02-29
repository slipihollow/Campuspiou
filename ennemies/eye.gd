extends "res://engine/entity.gd"

const DAMAGE = 0.25

var player : Player

func _ready() -> void:
	#$anim.play("skeletonR")
	$areadetector.connect("body_entered",self,"_on_areadetector_body_entered")
	set_physics_process(false)

func _physics_process(delta : float) -> void:
	damage_loop()
	movement_loop()
	var direction : = (player.global_position - global_position).normalized()
	var distance_to_player : = global_position.distance_to(player.global_position)
	#$sprite.flip_h = direction.x < 0
	if direction.x < 0:
		$anim.play("eyeL")
	else:
		$anim.play("eyeR")
	if distance_to_player <= min_move_distance:
		move_and_collide(direction * SPEED * delta)

func _on_areadetector_body_entered(body):
	if not body is Player:
		return
	player = body
	set_physics_process(true)
	$areadetector.disconnect("body_entered",self,"_on_areadetector_body_entered")
