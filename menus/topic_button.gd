extends Button

@export var topic : String

func _on_pressed() -> void:
	disabled = true
	Options.topic = load(topic)
