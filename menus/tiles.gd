extends Control

@export var mainMenu : String
@onready var trans: ColorRect = $trans
@onready var progress_bar: ProgressBar = $VBoxContainer/Panel/HBoxContainer/VBoxContainer/ProgressBar

func _ready() -> void:
	progress_bar.max_value = Options.quiz_length
	progress_bar.value = Options.current_question

func _on_button_2_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(mainMenu)

func _on_ans():
	Options.current_question += 2
	progress_bar.value = Options.current_question
	if Options.quiz_length <= Options.current_question:
		_on_button_2_pressed()
		return

func play_trans():
	trans.switch()
