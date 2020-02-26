extends Node2D

onready var player: KinematicBody2D = $player

func _ready():
	player.position = $doortrigger16.position
	player.get_node("anim").play("stand")

func _on_doortrigger16_body_exited(body):
	pass # Replace with function body.
