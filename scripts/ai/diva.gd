class_name GirlCharacter
extends CharacterBody3D

@onready var anim_player = $AnimationPlayer

const SPEED = 5.0

var water_amnt : float = 0
var target : Node3D
var isMoving : bool

func _ready() -> void:
	pass


func play_anim(player: AnimationPlayer, anim_name: String):
	if (player.current_animation != anim_name):
		player.play(anim_name)
