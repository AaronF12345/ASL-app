extends Control

@export var mainMenu : String
@onready var trans: ColorRect = $trans

func _on_button_pressed() -> void:
	trans.switch()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)
