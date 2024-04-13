class_name Global
extends Node

static var inst : Global
@export var well : Node3D
@export var beds : Array[Bed]


func _ready() -> void:
	if (inst == null):
		inst = self
	pass


func get_first_crop_needy_cell() -> Cell:
	for b in beds:
		for c in b.get_cells():
			if c.need["crop"]:
				return c
	return null


func get_first_water_needy_cell() -> Cell:
	for b in beds:
		for c in b.get_cells():
			if c.need["water"]:
				return c
	return null


func get_first_needy_cells() -> Dictionary:
	var d = {"cell" : null, "need_type" : null}
	for b in beds:
		for c in b.get_cells():
			if c.need["crop"]:
				d["cell"] = c
				d["need_type"] = "crop"
				return d
			if c.need["water"]:
				d["cell"] = c
				d["need_type"] = "water"
				return d
	return d


func get_crop_needy_cells() -> Array[Cell]:
	var cells : Array[Cell] = []
	for b in beds:
		for c in b.get_cells():
			if c.need["crop"]:
				cells.append(c)
	return cells


func get_water_needy_cells() -> Array[Cell]:
	var cells : Array[Cell] = []
	for b in beds:
		for c in b.get_cells():
			if c.need["water"]:
				cells.append(c)
	return cells
