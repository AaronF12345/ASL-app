extends Button

@export var correct : bool

func _ready() -> void:
	if text.length() >8:
		self.add_theme_font_size_override("font_size",90)
	if text.length() >14:
		self.add_theme_font_size_override("font_size",75)
