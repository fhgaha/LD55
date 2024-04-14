class_name State
extends Node

var state_machine : StateMachine = null
var player : GirlCharacter

# Virtual function. Receives events from the `_unhandled_input()` callback.
func handle_input(_event: InputEvent) -> void:
	pass


# Virtual function. Corresponds to the `_process()` callback.
func update(_delta: float) -> void:
	pass


# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	pass


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	pass


# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass


func try_find_crop_needy_start_moving() -> bool:
	var cn = Global.inst.get_first_crop_needy_cell()
	if (cn):
		player.target = cn
		state_machine.transition_to("Moving")
		return true
	return false


func try_find_water_needy_start_moving() -> bool:
	var wn = Global.inst.get_first_water_needy_cell()
	if (wn):
		if (player.water_amnt > 0):
			#print("water amnt: ", player.water_amnt)
			player.target = wn
			state_machine.transition_to("Moving")
			return true
		else:
			player.target = Global.inst.well
			state_machine.transition_to("Moving")
			return true
	return false


