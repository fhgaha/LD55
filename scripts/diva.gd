extends CharacterBody3D

@onready var anim_player = $AnimationPlayer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var water_amnt : float = 0
var target : Node3D
var isMoving : bool

func _ready() -> void:
	if (water_amnt <= 0):
		var well = Global.inst.well
		target = well
		isMoving = true
	pass

func _physics_process(delta):
	if (target == null): 
		return
	
	if (isMoving):
		#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		#var direction = (global_position - target.global_position).normalized()
		print(target.global_position)
		var direction = global_position.direction_to(target.global_position)
		if direction:
			play_anim(anim_player, "running")
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			play_anim(anim_player, "idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
		
		move_and_slide()


func play_anim(player: AnimationPlayer, anim_name: String):
	if (player.current_animation != anim_name):
		player.play(anim_name)
