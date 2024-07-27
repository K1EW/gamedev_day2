extends State

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

func physics_update(_delta: float) -> void:
	owner.apply_gravity(_delta)
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		state_machine.transition_to("Run")
		
	if owner.is_on_floor() and Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
	
	owner.move_and_slide()

func enter(_msg := {}) -> void:
	owner.has_double_jump = true
	animation_player.play("idle")
