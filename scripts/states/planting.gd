extends State

@export var SPEED = 5.0 
var target : Node3D = null
var timer : float = 0

func enter(_msg := {}) -> void:
	player.play_anim("idle") 
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO
	(player.target as Cell).is_occupied = true
	pass


func update(delta: float) -> void:
	timer += 1 * delta;
	if (timer >= 1):
		timer = 0
		var cell = player.target as Cell
		cell.plant_crop()
		
		if try_find_crop_needy_start_moving():
			cell.is_occupied = false;
			return
		if try_find_water_needy_start_moving():
			cell.is_occupied = false;
			return
		player.target = player.idle_point
		state_machine.transition_to("Moving")
		cell.is_occupied = false;
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass



