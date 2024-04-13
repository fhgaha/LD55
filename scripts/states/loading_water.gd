extends State

@export var SPEED = 5.0 

func enter(_msg := {}) -> void:
	player.play_anim("idle") 
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO
	pass


func update(delta: float) -> void:
	if (player.water_amnt < 1):
		player.water_amnt += 2 * delta
	
	if (player.water_amnt >= 5):
		if try_find_water_needy_start_moving():
			return
		player.target = player.idle_point
		state_machine.transition_to("Moving")
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass



