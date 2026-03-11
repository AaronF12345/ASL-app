extends Control

@export var games : String
@export var quiz : String
@onready var trans: ColorRect = $trans
@onready var correct: Label = $VBoxContainer/ScrollContainer/VBoxContainer/PanelContainer/HBoxContainer/Label2
@onready var incorrect: Label = $VBoxContainer/ScrollContainer/VBoxContainer/PanelContainer2/HBoxContainer/Label2

func _ready() -> void:
	correct.text = str(Options.current_question)
	incorrect.text = str(Options.wrong)
	if Options.type == Options.Types.tiles:
		Progress.tiles_taken += 1
		Progress.save()
		return
	Progress.correct_answers += Options.current_question
	Progress.incorrect_answers += Options.wrong
	if Options.type == Options.Types.quiz:
		Progress.quizzes_taken += 1
	Progress.save()

func _on_button_pressed() -> void:
	trans.switch()
	await trans.finished
	get_tree().change_scene_to_file(games)
