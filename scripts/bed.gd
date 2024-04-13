class_name Bed
extends Node3D

@onready var floor : CSGBox3D = $floor

var grid = []
@export var grid_width : int 
@export var grid_height : int 

func _ready():
	init_grid()
	pass


func init_grid():
	grid_width = floor.size.x
	grid_height = floor.size.z
	
	for i in grid_width:
		grid.append([])
		for j in grid_height:
			grid[i].append(0) # Set a starter value for each position
	
	pass


func _process(delta):
	pass

