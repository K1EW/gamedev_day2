extends Area2D

@export var collision_shape: CollisionShape2D
@export var animation_player: AnimationPlayer
@export var audio: AudioStreamPlayer2D
@export var sprite: Sprite2D

var is_collected: bool = false

func _on_body_entered(body):
	if not is_collected:
		audio.play(0.2)
		is_collected = true
		animation_player.play("collected")
		GameVariables.collected_coin += 1
		await animation_player.animation_finished
		sprite.visible = false
		await audio.finished
		queue_free()
