extends State

@export var SPEED = 5.0 
var target : Node3D = null

func enter(_msg := {}) -> void:
	player.play_anim("idle") 
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO
	(player.target as Cell).is_occupied = true
	pass


func update(delta: float) -> void:
	var cell = player.target as Cell
	if player.water_amnt > 0:
		var crop : Crop = cell.crop
		var val: float = 10 * delta
		player.water_amnt -= val
		cell.water_crop(val) 
		return

	
	if (player.water_amnt <= 0):
		if try_find_crop_needy_start_moving():
			cell.is_occupied = false
			return
		if try_find_water_needy_start_moving():
			cell.is_occupied = false;
			return
		player.target = player.idle_point
		state_machine.transition_to("Moving")
		cell.is_occupied = false;
		return
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass



