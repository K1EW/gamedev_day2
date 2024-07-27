extends State

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

func physics_update(_delta: float) -> void:
	owner.apply_gravity(_delta)
	owner.player_move()
	owner.player_jump()
	
	if owner.is_on_floor():
		state_machine.transition_to("Idle")
	
	if owner.velocity.y > 0:
		state_machine.transition_to("Fall")
	
	owner.move_and_slide()

func enter(_msg := {}) -> void:
	owner.player_jump()
	animation_player.play("jump")

func exit() -> void:
	pass
