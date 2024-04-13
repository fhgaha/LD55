extends State


# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player.play_anim("idle")
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO


func update(delta: float) -> void:
	if try_find_crop_needy_start_moving():
		return
	if try_find_water_needy_start_moving():
		return
	player.target = player.idle_point
	state_machine.transition_to("Moving")
	pass


func exit() -> void:
	pass
