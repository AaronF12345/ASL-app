extends Control

@export var topics : String
@export var settingsMenu : String
@export var progress : String
@onready var trans: ColorRect = $trans

func _on_button_3_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(topics)

func _on_button_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(settingsMenu)

func play_trans():
	trans.switch()

func _on_button_2_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(progress)
