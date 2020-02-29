extends "res://engine/entity.gd"

const DAMAGE = 0.5

var player : Player

func _ready() -> void:
	$areadetector.connect("body_entered",self,"_on_areadetector_body_entered")
	set_physics_process(false)
	#$anim.play("medusa2MB2")
	
func _physics_process(delta : float) -> void:
	############
	for area in $hitbox2.get_overlapping_areas(): #pour les contacts de hitbox
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE: #si les 2 entités ne sont pas du même type 
			health -= body.get("DAMAGE")
			hitstun = 10
			damagesounds.play()
			knockdir = global_transform.origin - body.global_transform.origin
		if body.get_groups().has("destroy_on_hit"):
				body.queue_free()

############
	damage_loop()
	movement_loop()
	var direction : = (player.global_position - global_position).normalized()
	var distance_to_player : = global_position.distance_to(player.global_position)
	#$sprite.flip_h = direction.x < 0
	if direction.x < 0:
		$anim.play("medusa2L")
		$anim2.play("medusa3")
	else:
		$anim.play("medusa2R")
		$anim2.play("medusa3")
	if distance_to_player <= min_move_distance:
		move_and_collide(direction * SPEED * delta)
		
func _on_areadetector_body_entered(body):
	if not body is Player:
		return
	player = body
	set_physics_process(true)
	$areadetector.disconnect("body_entered",self,"_on_areadetector_body_entered")

