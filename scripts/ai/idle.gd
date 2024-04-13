extends State

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player.play_anim("idle")
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO


func update(delta: float) -> void:
	if player.water_amnt <= 0:
		player.target = Global.inst.well
		state_machine.transition_to("Moving")


func exit() -> void:
	pass
