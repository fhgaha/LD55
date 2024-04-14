class_name Crop
extends Node3D

@export_category("set")
@export var stage_0 : Node3D
@export var stage_1 : Node3D
@export var stage_2 : Node3D
@export var stage_3 : Node3D

@export_category("display")
@export var cur_stage  : int   = 0
@export var growth  : float = 0
@export var growth_max  : float = 1
@export var water_amnt : float = 0
@export var water_amnt_max : float = 1

var timer: float = 0

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	timer += delta
	if (timer > 1):
		timer = 0
		grow()
	pass


func grow():
	if (water_amnt <= 0): return
	
	water_amnt -= 0.1
	growth += 0.1
	print("%s: growth: %s" % [self.name, growth])
	if (growth >= growth_max):
		to_next_stage()
		growth = 0


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


func is_planted():
	return (stage_0.visible 
		 or stage_1.visible
		 or stage_2.visible
		 or stage_3.visible
	)

