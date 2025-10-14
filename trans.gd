extends ColorRect

signal finished

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.animation_finished.connect(finished.emit)
	position.y = 0
	force_update_transform()
	animation_player.play("fade")

func switch():
	position.y = size.y
	force_update_transform()
	animation_player.play("switch")
