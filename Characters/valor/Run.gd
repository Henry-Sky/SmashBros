extends SimpleState
@onready var valor: CharacterBody2D = $"../.."
@onready var idle: Node = $"."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

# Called when the state machine enters this state.
func on_enter() -> void:
	pass


# Called every frame when this state is active.
func on_process(_delta: float) -> void:
	manageStateShift()
	if valor.is_on_floor() and not is_zero_approx(valor.velocity.x):
		animation_player.play("run")


# Called every physics frame when this state is active.
func on_physics_process(_delta: float) -> void:
	pass


# Called when the state machine exits this state.
func on_exit() -> void:
	pass


func manageStateShift():
	if valor.is_on_floor() and is_zero_approx(valor.velocity.x):
		change_state("Idle")
	elif not valor.is_on_floor():
		change_state("Jump")

