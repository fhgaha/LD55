class_name Bed
extends Node3D

@onready var floor: CSGBox3D = $floor

var grid = [Cell]
@export var grid_width : int 
@export var grid_height : int 

func _ready():
	init_grid()
	pass


func init_grid():
	grid_width = floor.size.x
	grid_height = floor.size.z
	pass


func _process(delta):
	pass

func get_cells() -> Array[Cell]:
	var arr : Array[Cell] = []
	for i in floor.get_children():
		arr.append(i as Cell)
	return arr
