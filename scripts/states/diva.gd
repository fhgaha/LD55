class_name GirlCharacter
extends CharacterBody3D

@export var idle_point : Node3D
@onready var anim_player = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine
@onready var progress_bar: ProgressBar = $TextsAbove/SubViewport/ProgressBar
@onready var label: RichTextLabel = $TextsAbove/SubViewport/RichTextLabel


var _water_amnt : float = 0
var water_amnt : float = 0 :
	get:
		return _water_amnt
	set(value):
		progress_bar.value = value
		_water_amnt = value
var water_full : float = 20
	
var seed_amnt : float = 0
var target : Node3D

func _ready() -> void:
	state_machine.config()
	water_amnt = 0
	progress_bar.max_value = water_full
	
	state_machine.transitioned.connect(on_state_changed)
	pass


func on_state_changed(name: String):
	label.text = name
	pass


func play_anim(anim_name: String):
	if (anim_player.current_animation != anim_name):
		anim_player.play(anim_name)
