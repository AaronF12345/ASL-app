extends Control

@export var mainMenu : String
@onready var trans: ColorRect = $trans
@export var quiz : String
@export var tiles : String
var playing_trans =false

func _on_button_2_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)

func play_trans():
	playing_trans = true
	trans.switch()

func _on_quiz_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	Options.type = Options.Types.quiz
	Options.current_question = 0
	Options.wrong = 0
	get_tree().change_scene_to_file(quiz)


func _on_button_pressed() -> void:
	if playing_trans == true:
		return
	play_trans()
	await trans.finished
	Options.type = Options.Types.tiles
	Options.current_question = 0
	get_tree().change_scene_to_file(tiles)
