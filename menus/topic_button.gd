extends Button

@export var topic : String

func _on_pressed() -> void:
	Options.topic = load(topic)
