extends CharacterBody2D

const RUN_SPEED := 200.0
const JUMP_VELOCITY := -300.0

# 定义了重力加速度
var gravity := ProjectSettings.get("physics/2d/default_gravity") as float

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	velocity.x = direction * RUN_SPEED
	velocity.y += gravity * delta
	
	# 受重力影响的下坠速度
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	
	if is_on_floor():
		if is_zero_approx(direction):
			animation_player.play("idle")
		else:
			animation_player.play("run")
	else:
		animation_player.play("jump")
	
	if not is_zero_approx(direction):
		sprite_2d.flip_h = direction < 0
		
	move_and_slide()
	
