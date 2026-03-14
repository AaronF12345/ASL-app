extends Control

@export var games : String
@export var quiz : String
@onready var trans: ColorRect = $trans

func _ready() -> void:
	Options.quiz_length = $VBoxContainer/ScrollContainer/VBoxContainer/PanelContainer/HBoxContainer/SpinBox.value
	$VBoxContainer/ScrollContainer/VBoxContainer/PanelContainer/HBoxContainer/SpinBox.max_value = Options.topic.Signs.size() * 2

func _on_button_pressed() -> void:
	trans.switch()
	await trans.finished
	get_tree().change_scene_to_file(games)


func _on_start_pressed() -> void:
	trans.switch()
	await trans.finished
	get_tree().change_scene_to_file(quiz)


func _on_spin_box_value_changed(value: float) -> void:
	Options.quiz_length = value


func _on_spin_box_2_value_changed(value: float) -> void:
	Options.answer_count = value
