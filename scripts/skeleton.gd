extends CharacterBody2D

const GRAVITY = 480
const SPEED = 50
const DETECT_DIST = 150
const ATTACK_DIST = 50
const ATTACK_DMG = 15

@export var sprite: Sprite2D
@export var take_hit_sfx: AudioStreamPlayer2D

func apply_gravity(delta: float):
	if not is_on_floor():
		velocity.y = velocity.y + GRAVITY * delta

func skeleton_move():
	var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
	var vec: Vector2 = player.global_position - global_position
	if vec.x > 0:
		velocity.x = SPEED
		sprite.scale.x = 1
	if vec.x < 0:
		velocity.x = -SPEED
		sprite.scale.x = -1

func _on_hit_area_body_entered(body):
	GameVariables.player_health = GameVariables.player_health - ATTACK_DMG
	take_hit_sfx.play(0.75)
	if GameVariables.player_health <= 0:
		await get_tree().create_timer(0.5).timeout
		get_tree().quit()
