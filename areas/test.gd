extends Node


func init(params):
	print(params)
	if params:
		var spawning_point = get_node(params.spawn_on_node).global_position
		$player.global_position = spawning_point
		$player.get_node("anim").play("stand")
