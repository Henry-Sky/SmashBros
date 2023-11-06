extends CharacterBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D

const RUN_SPEED := 400.0
const FLOOR_ACCELERATION := RUN_SPEED / 0.2
const AIR_ACCELERATION := RUN_SPEED / 0.02
const JUMP_VELOCITY := -550.0

# 定义了重力加速度
var gravity := ProjectSettings.get("physics/2d/default_gravity") as float


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	var acceleration := FLOOR_ACCELERATION if is_on_floor() else AIR_ACCELERATION
	# 重力影响
	velocity.y += gravity * delta
	# 横向移动
	velocity.x = move_toward(velocity.x, direction * RUN_SPEED, acceleration * delta)
	# 跳跃
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# 人物翻转
	if not is_zero_approx(direction):
		sprite_2d.flip_h = direction < 0
		
	move_and_slide()
