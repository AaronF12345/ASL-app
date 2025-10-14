extends Control

@export var mainMenu : String
@export var games : String
@onready var trans: ColorRect = $trans

func _on_button_2_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)

func _on_topic() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(games)

func play_trans():
	trans.switch()
