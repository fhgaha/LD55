extends State

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	player.velocity = Vector3.ZERO


func update(delta: float) -> void:
	if player.water_amnt <= 0:
		var target = Global.inst.well
		player.target = target
		state_machine.transition_to("Moving")


func exit() -> void:
	pass
