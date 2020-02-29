extends "res://pickups/pickup.gd"

func body_entered(body):
	if body.name == "player" and body.get("questies") < 9:
		body.questies += 1
		queue_free()