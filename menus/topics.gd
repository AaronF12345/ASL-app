extends Control

@export var mainMenu : String
@export var games : String
@onready var trans: ColorRect = $trans
var playing_trans = false

func _on_button_2_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)

func _on_topic() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(games)

func play_trans():
	playing_trans = true
	trans.switch()
