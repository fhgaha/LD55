class_name Crop
extends Node

@export_category("set")
@export var stage_0 : Node3D
@export var stage_1 : Node3D
@export var stage_2 : Node3D
@export var stage_3 : Node3D

@export_category("display")
@export var cur_stage : int = 0
@export var ready_bar : float = 0
@export var water_amnt : float = 0

func _ready() -> void:
	pass # Replace with function body.


func update_ready_bar(val: float) -> void:
	ready_bar += val;
	if (ready_bar > 1):
		print("ready_bar is full!")
	pass


func plant():
	stage_0.show()


func to_next_stage() -> void:
	if (cur_stage == 3):
		print("cant change stage already max")
	
	stage_0.hide()
	stage_1.hide()
	stage_2.hide()
	stage_3.hide()
	
	match cur_stage:
		0: stage_1.show()
		1: stage_2.show()
		2: stage_3.show()
	
	cur_stage += 1
	pass
