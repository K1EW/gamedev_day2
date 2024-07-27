extends CharacterBody2D

const GRAVITY = 480
const SPEED = 300
const JUMP_VELOCITY = -200

@export var player_sprite: Sprite2D

var has_double_jump: bool = true

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y = velocity.y + GRAVITY * delta

func player_move():
	var direction:float = Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
		
	if direction < 0:
		player_sprite.scale.x = -1
	if direction > 0:
		player_sprite.scale.x = 1
		
func player_jump():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		has_double_jump = true
	elif not is_on_floor() and has_double_jump and Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		has_double_jump = false
