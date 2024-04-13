class_name GirlCharacter
extends CharacterBody3D

@onready var anim_player = $AnimationPlayer
@onready var state_machine: StateMachine = $StateMachine

var water_amnt : float = 0
var target : Node3D

func _ready() -> void:
	state_machine.config()
	pass


func play_anim(anim_name: String):
	if (anim_player.current_animation != anim_name):
		anim_player.play(anim_name)
