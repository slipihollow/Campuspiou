extends Camera2D
#normal screen_size 160 /128 and in parameter : 160/144
#test1 screen_size 640/460 and in parameter 640 480
#640/344  pour 640/360
const SCREEN_SIZE = Vector2(640,344) 
const HUD_THICKNESS = 16
var grid_pos = Vector2(0,0) #position 

func _ready():
	$area.connect("body_entered",self,"body_entered")
	$area.connect("body_exited",self,"body_exited")
	$area.connect("area_exited", self, "area_exited")
	
func _process(delta):
	var player_grid_pos = get_grid_pos(get_node("../player").global_position)
	global_position = player_grid_pos * SCREEN_SIZE
	grid_pos = player_grid_pos
	
func get_grid_pos(pos):
	pos.y -= HUD_THICKNESS
	var x = floor(pos.x / SCREEN_SIZE.x)
	var y = floor(pos.y / SCREEN_SIZE.y)
	return Vector2(x,y)
	
func get_enemies():
	var enemies = []
	for body in $area.get_overlapping_bodies():
		if body.get("TYPE") == "ENEMY" and enemies.find(body) == -1:
			enemies.append(body)
	return enemies.size()
	
func body_entered(body): #active les ennemis dans caméra
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(true)

func body_exited(body): #gèle les ennemis hors caméra
	if body.get("TYPE") == "ENEMY":
		body.set_physics_process(false)
		
func area_exited(area):
	if area.get("disappears") == true:
		area.queue_free()
	var body = area.get_parent()
	if body.get_groups().has("projectile"):
		body.queue_free()