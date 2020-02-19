extends Node2D

func _ready():
	$anim.play("default")
	$anim.connect("animation_finished",self,"destroy")

func destroy(animation): #faire disparaître le sprite à sa mort
	queue_free()