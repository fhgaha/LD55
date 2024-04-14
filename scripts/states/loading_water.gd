extends State

var full_thresh : float = 5

func enter(_msg := {}) -> void:
	player.play_anim("idle") 
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO
	pass


func update(delta: float) -> void:
	if (player.water_amnt < player.water_full):
		player.water_amnt += 10 * delta
	
	if (player.water_amnt >= player.water_full):
		if try_find_water_needy_start_moving():
			return
		player.target = player.idle_point
		state_machine.transition_to("Moving")
		return
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass



