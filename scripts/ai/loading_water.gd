extends State

@export var SPEED = 5.0 
var target : Node3D = null
var timer : Timer

func enter(_msg := {}) -> void:
	player.play_anim("idle") 
	#move_toward(player.velocity.x, 0, SPEED)
	player.velocity = Vector3.ZERO
	timer = Timer.new()
	timer.autostart = 2
	pass


func update(delta: float) -> void:
	#if (timer.time_left <= 0):
		#var target = Global.inst.well
		#player.target = target
		#state_machine.transition_to("Moving")
	var cell = Cell.get_closest_cell(player.global_position)
	player.target = cell
	state_machine.transition_to("Moving")
	
	
		
	pass


func exit() -> void:
	pass

func physics_update(_delta: float) -> void:
	pass



