extends State

@export var SPEED : float = 5.0 
var target : Node3D = null

func enter(_msg := {}) -> void:
	target = player.target
	pass


func update(delta: float) -> void:
	if (target.name == "well" and
		player.global_position.distance_squared_to(target.global_position) < 1):
		state_machine.transition_to("LoadingWater")
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
	#else:
		#player.play_anim(player.anim_player, "idle")
		#player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
		#player.velocity.z = move_toward(player.velocity.z, 0, SPEED)
	
	player.move_and_slide()
