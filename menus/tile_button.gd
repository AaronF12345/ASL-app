extends Button

signal correct
signal select

var done : bool = false
@export var selected : bool = false
@export var parent : Node:
	set(new):
		parent = new
		parent.connect("select",clear)
@export var counterpart : Button:
	set(new):
		counterpart = new
		counterpart.connect("select",counterpart_pressed)

func counterpart_pressed():
	if selected:
		correct.emit()
		done = true
		counterpart.done = true

func _pressed() -> void:
	selected = true
	disabled = true
	select.emit()

func clear():
	if done:
		return
	selected = false
	disabled = false
