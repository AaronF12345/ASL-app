extends Control

@export var mainMenu : String
@onready var trans: ColorRect = $trans
@onready var progress_bar: ProgressBar = $VBoxContainer/Panel/HBoxContainer/VBoxContainer/ProgressBar
@onready var progress_bar2: ProgressBar = $VBoxContainer/Panel/HBoxContainer/VBoxContainer/ProgressBar/ProgressBar2
@export var results : String
var done : bool = false

func _ready() -> void:
	progress_bar.max_value = Options.quiz_length
	progress_bar.value = Options.current_question
	progress_bar2.max_value = Options.quiz_length
	progress_bar2.value = Options.current_question + Options.wrong

func _on_button_2_pressed() -> void:
	play_trans()
	await trans.finished
	get_tree().change_scene_to_file(results)

func _on_ans(correct : bool):
	if done:
		return
	if !correct:
		Options.wrong += 1
	else:
		Options.current_question += 1
	progress_bar.value = Options.current_question
	progress_bar2.value = Options.current_question + Options.wrong
	done = true
	if Options.quiz_length <= (Options.current_question + Options.wrong):
		_on_button_2_pressed()
		return
	play_trans()
	await trans.finished
	get_tree().reload_current_scene()

func play_trans():
	trans.switch()
