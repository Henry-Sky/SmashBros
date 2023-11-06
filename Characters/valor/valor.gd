extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const RUN_SPEED := 400.0
const FLOOR_ACCELERATION := RUN_SPEED / 0.2
const AIR_ACCELERATION := RUN_SPEED / 0.02
const JUMP_VELOCITY := -550.0

# 定义了重力加速度
var gravity := ProjectSettings.get("physics/2d/default_gravity") as float


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	var acceleration := FLOOR_ACCELERATION if is_on_floor() else AIR_ACCELERATION
	
	velocity.x = move_toward(velocity.x, direction * RUN_SPEED, acceleration * delta)
	velocity.y += gravity * delta
	
	move_and_slide()
