class_name Player
extends CharacterBody3D

@onready var camera_mount = $camera_mount
#@onready var animation_player = $visual/RoundChar/AnimationPlayer
@onready var visual = $visual
#@onready var stone : RigidBody3D = $visual/stone

#@export var SPEED = 5.0 
@export var sens_horizontal = 0.2
@export var sens_vertical = 0.2

var last_j

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#animation_player.speed_scale = 2


func _input(event) -> void:
	if event is InputEventMouseMotion:
		var yToRotate = event.relative.x * sens_horizontal
		rotate_y(deg_to_rad(-yToRotate))
		visual.rotate_y(deg_to_rad(yToRotate))
		camera_mount.rotate_x(deg_to_rad(-event.relative.y * sens_vertical))
	
	if event.is_action_released("ui_cancel"):
		get_tree().quit()
		
	if event.is_action_pressed("lmb"):
		pass


func _physics_process(delta):
	handle_movement_input()
	move_and_slide()
	pass


func handle_movement_input():
	# Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("left", "right", "forward", "backward")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		##play_anim("Run")
		#visual.look_at(position + direction)
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		##play_anim("Idle")
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
	pass


func play_anim(player: AnimationPlayer, anim_name: String):
	if (player.current_animation != anim_name):
		player.play(anim_name)
