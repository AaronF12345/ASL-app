extends Node

@export var quizzes_taken : int
@export var tiles_taken : int
@export var correct_answers : int
@export var incorrect_answers : int

const SAVE_PATH := "user://save_data.tres"
var save_res: Save

func _enter_tree() -> void:
	load_save()

func save():
	save_res.quizzes_taken = quizzes_taken
	save_res.correct_answers = correct_answers
	save_res.incorrect_answers = incorrect_answers
	save_res.tiles_taken = tiles_taken

	if OS.has_feature("windows"):
		var error = ResourceSaver.save(save_res, SAVE_PATH)
		if error != OK:
			push_error("Save failed: " + error_string(error))
	if OS.has_feature("ios"):
		pass
	if OS.has_feature("android"):
		var error = ResourceSaver.save(save_res, SAVE_PATH)
		if error != OK:
			push_error("Save failed: " + error_string(error))

func load_save():
	if OS.has_feature("windows"):
		if ResourceLoader.exists(SAVE_PATH):
			save_res = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
		else:
			save_res = Save.new()
	if OS.has_feature("ios"):
		pass
	if OS.has_feature("android"):
		if ResourceLoader.exists(SAVE_PATH):
			save_res = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
		else:
			save_res = Save.new()

	quizzes_taken = save_res.quizzes_taken
	correct_answers = save_res.correct_answers
	incorrect_answers = save_res.incorrect_answers
	tiles_taken = save_res.tiles_taken
