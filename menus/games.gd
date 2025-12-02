extends Control

@export var mainMenu : String
@onready var trans: ColorRect = $trans
@export var quiz : String
@export var tiles : String

func _on_button_2_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)

func play_trans():
	trans.switch()

func _on_quiz_pressed() -> void:
	play_trans()
	await trans.finished
	Options.current_question = 0
	Options.wrong = 0
	get_tree().change_scene_to_file(quiz)


func _on_button_pressed() -> void:
	play_trans()
	await trans.finished
	Options.current_question = 0
	get_tree().change_scene_to_file(tiles)
