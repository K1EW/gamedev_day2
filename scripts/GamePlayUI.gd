extends Control

@export var collected_coin_label: Label
@export var health_bar: ProgressBar

func _process(delta):
	collected_coin_label.text = str(GameVariables.collected_coin)
	health_bar.value = GameVariables.player_health
