class_name Global
extends Node

static var inst : Global

@export var well : Node3D

static var global_val : int = 10

func _ready() -> void:
	if (inst == null):
		inst = self
	pass
