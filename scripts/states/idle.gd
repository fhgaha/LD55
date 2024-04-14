extends State

var timer : float = 0

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player.play_anim("idle")
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO


func update(delta: float) -> void:
	timer += delta 
	if (timer > 0.5):
		timer = 0
		if try_find_crop_needy_start_moving():
			return
		if try_find_water_needy_start_moving():
			return
	pass


func exit() -> void:
	pass
