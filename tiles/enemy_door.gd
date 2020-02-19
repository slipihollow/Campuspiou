extends StaticBody2D

onready var camera = get_node("../Camera")
onready var player = get_node("../player")

func _ready():
	$anim.play("open")

func _process(delta):
	if camera.grid_pos == camera.get_grid_pos(global_position): #1)si la porte est dans le champ de caméra
		if camera.get_enemies() == 0: #2)si aucun ennemi
			if $anim.assigned_animation != "open": #2)et la porte n'est pas ouverte
				$anim.play("open") #2)ouvre la porte
		elif !$area.get_overlapping_bodies().has(player): #3)si le player n'est pas sur la porte et qu'il y a des ennemis
			if $anim.assigned_animation != "close": #3)et si la porte n'est pas déjà fermée
				$anim.play("close") #3)ferme la porte
	else:
		if $anim.assigned_animation != "open": #1)si la porte n'est pas dans le champ de caméra
				$anim.play("open") #1)la porte est ouverte
	