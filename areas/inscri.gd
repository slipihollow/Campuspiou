extends Node2D

onready var player: KinematicBody2D = $player

func _ready():
	player.position = $doortrigger6.position
	player.get_node("anim").play("stand")