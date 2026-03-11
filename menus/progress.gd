extends Control

@export var main : String
@onready var trans: ColorRect = $trans
@onready var correct: Label = $"VBoxContainer/ScrollContainer/VBoxContainer/quiz correct/HBoxContainer/Label2"
@onready var incorrect: Label = $"VBoxContainer/ScrollContainer/VBoxContainer/quiz incorrect/HBoxContainer/Label2"
@onready var quizzes: Label = $VBoxContainer/ScrollContainer/VBoxContainer/quizzes/HBoxContainer/Label2
@onready var tiles: Label = $VBoxContainer/ScrollContainer/VBoxContainer/tiles/HBoxContainer/Label2

func _ready() -> void:
	correct.text = str(Progress.correct_answers)
	incorrect.text = str(Progress.incorrect_answers)
	quizzes.text = str(Progress.quizzes_taken)
	tiles.text = str(Progress.tiles_taken)

func _on_button_pressed() -> void:
	trans.switch()
	await trans.finished
	get_tree().change_scene_to_file(main)
