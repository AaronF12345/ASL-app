extends Button

@export var topic : Topic

func _on_pressed() -> void:
	Options.topic = topic
