extends State

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

func physics_update(_delta: float) -> void:
	owner.player_move()
	owner.apply_gravity(_delta)
	
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction == 0:
		state_machine.transition_to("Idle")
		
	if owner.is_on_floor() and Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
	
	if owner.velocity.y > 0:
		state_machine.transition_to("Fall")
	
	owner.move_and_slide()
	
func enter(_msg := {}) -> void:
	owner.has_double_jump = true
	animation_player.play("run")
