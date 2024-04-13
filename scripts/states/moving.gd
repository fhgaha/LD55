extends State

@export var SPEED : float = 5.0 
var target : Node3D = null

func enter(_msg := {}) -> void:
	target = player.target
	pass


func update(delta: float) -> void:
	if target.name == "well" and is_reached_target(target, 1):
		state_machine.transition_to("LoadingWater")
	
	var cell = target as Cell
	if cell and cell.need["crop"] and is_reached_target(target, 2):
		state_machine.transition_to("Planting")
	if (cell and cell.need["water"] and player.water_amnt > 0 
		and is_reached_target(target, 2)):
		state_machine.transition_to("Watering")
	
	if target.name.contains("idle_point") and is_reached_target(target, 2):
		state_machine.transition_to("Idle")
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	var direction = player.global_position.direction_to(target.global_position)
	if direction:
		player.play_anim("running")
		player.velocity.x = direction.x * SPEED
		player.velocity.z = direction.z * SPEED
		player.look_at(target.global_position + player.velocity, Vector3.UP)
	
	player.move_and_slide()


func is_reached_target(target : Node3D, thres: float) -> bool:
	return player.global_position.distance_squared_to(
		target.global_position) < thres
	pass
