extends Control

@export var topics : String
@export var settingsMenu : String
@export var progress : String
@onready var trans: ColorRect = $trans
var playing_trans = false

func _on_button_3_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(topics)

func _on_button_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(settingsMenu)

func play_trans():
	playing_trans =true
	trans.switch()

func _on_button_2_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(progress)
