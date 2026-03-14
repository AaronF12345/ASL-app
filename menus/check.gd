extends Button

@export var on : bool = true

func _ready() -> void:
	Options.alt_image = false

func _on_pressed() -> void:
	on = !on
	match on:
		true:
			Options.alt_image = false
			text = "on"
		false:
			Options.alt_image = true
			text = "off"
