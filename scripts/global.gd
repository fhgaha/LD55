class_name Global
extends Node

static var inst : Global
@export var well : Node3D


func _ready() -> void:
	if (inst == null):
		inst = self
	print("Global: well: ", well)
	pass
