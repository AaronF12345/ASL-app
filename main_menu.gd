extends Control

@export var gameMenu : String
@export var settingsMenu : String

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file(gameMenu)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(settingsMenu)
