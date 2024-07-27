extends State

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	owner.apply_gravity(_delta)
	owner.player_move()
	owner.player_jump()

	if owner.is_on_floor():
		state_machine.transition_to("Idle")
		
	if owner.velocity.y < 0 and not owner.is_on_floor():
		state_machine.transition_to("Jump")
	
	owner.move_and_slide()

func enter(_msg := {}) -> void:
	animation_player.play("fall")

func exit() -> void:
	pass
