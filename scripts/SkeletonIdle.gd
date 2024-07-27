extends State

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

# Virtual function. Corresponds to the `_physics_process()` callback.
func physics_update(_delta: float) -> void:
	owner.apply_gravity(_delta)
	
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	var vec: Vector2 = player.global_position - owner.global_position
	if vec.length() <= owner.DETECT_DIST:
		state_machine.transition_to("Walk")
	
	owner.move_and_slide()


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	owner.velocity.x = 0
	animation_player.play("idle")
