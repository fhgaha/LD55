class_name Global
extends Node

static var inst : Global
@export var well : Node3D
@export var beds : Array[Bed]


func _ready() -> void:
	if (inst == null):
		inst = self
	pass
