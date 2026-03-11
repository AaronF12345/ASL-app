extends GridContainer

signal select

@export var database : Database
const TILE_BUTTON = preload("res://menus/tile_button.tscn")
@onready var main: Control = $"../../.."
var signid : int = Options.rand.randi_range(0,Options.topic.Signs.size()-1)
var list : PackedInt32Array
var on : bool = false

func _ready() -> void:
	for i in Options.quiz_length/2:
		create_question(Options.random_id())
	for i in get_children():
		move_child(i,randi_range(0,get_children().size()))

func get_sign(id : int) -> AbstractSign:
	return Options.topic.Signs[id]

func create_question(id : int):
	var button : Button = TILE_BUTTON.instantiate()
	while list.has(id):
		id = Options.random_id()
	button.text = get_sign(id).Word
	add_child(button)
	var button2 : Button = TILE_BUTTON.instantiate()
	button2.text = ""
	button2.icon = get_sign(id).SignArt
	add_child(button2)
	button.counterpart = button2
	button2.counterpart = button
	button.parent = self
	button2.parent = self
	button.connect("select",selected)
	button2.connect("select",selected)
	button.connect("correct",main._on_ans)
	button2.connect("correct",main._on_ans)
	list.append(id)

func selected():
	if on:
		select.emit()
		on = false
		return
	if !on:
		on = true

func _on_resized() -> void:
	pass
	#columns = round(size.x / 288)
