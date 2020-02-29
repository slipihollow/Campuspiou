extends KinematicBody2D

export (int) var MAXHEALTH = 50
export (String, "ENEMY", "PLAYER", "NPC", "ENEMY2") var TYPE = "ENEMY2"
export (float) var SPEED = 50

var movedir = Vector2(0,0)
var last_movedir = Vector2(0,1)
var knockdir = Vector2(0,0)
var spritedir = "down"
var hitstun = 0
var texture_default = null
var texture_hurt 	= null
######
export var health = 50
#var health = MAXHEALTH
export var min_move_distance = 150
onready var damagesounds = $"audioeffect/damagesound"
export var knock = 3
#####

func _ready():

	if TYPE == "ENEMY2": #définir collision entre type + sprites de dommage
		set_collision_mask_bit(1,1)
		set_physics_process(false)
	texture_default = $sprite.texture
	texture_hurt = load($sprite.texture.get_path().replace(".png","_hurt.png"))

func movement_loop(): # définir le knockback quand toucher un ennemi
	var motion
	if hitstun == 0:
		motion = movedir.normalized() * SPEED
	else:
		motion = knockdir.normalized() * SPEED * knock
	move_and_slide(motion, Vector2(0,0))
	
	if movedir != dir.center and dir.list.has(movedir):
		last_movedir = movedir
	
func spritedir_loop(): #définir les directions pour les sprites
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
func anim_switch(animation): #définir changement d'animation en fonction des directions pour les sprites
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func damage_loop(): #définir animation de dommage

	health = min(MAXHEALTH, health)
	
	if hitstun > 0:
		hitstun -= 1
		$sprite.texture = texture_hurt
	else:
		$sprite.texture = texture_default
		if TYPE == "ENEMY2" and health <= 0: #si l'ennemi est mort --> drop de coeur =)
			
			var drop = randi() % 3
			if drop == 0:
				instance_scene(preload("res://pickups/heart.tscn"))
			instance_scene(preload("res://ennemies/enemy_death.tscn"))
			queue_free()

	
	for area in $hitbox.get_overlapping_areas(): #pour les contacts de hitbox
		var body = area.get_parent()
		if hitstun == 0 and body.get("DAMAGE") != null and body.get("TYPE") != TYPE: #si les 2 entités ne sont pas du même type 
			health -= body.get("DAMAGE")
			hitstun = 10
			damagesounds.play()
			knockdir = global_transform.origin - body.global_transform.origin
			if body.get_groups().has("destroy_on_hit"):
				body.queue_free()
			

func use_item(item): 
	var newitem = item.instance()
	newitem.add_to_group(str(item,self))
	add_child(newitem)
	if get_tree().get_nodes_in_group(str(item,self)).size() > newitem.maxamount:
		newitem.queue_free() 

func instance_scene(scene):
	var new_scene = scene.instance()
	new_scene.global_position = global_position
	get_parent().add_child(new_scene)
