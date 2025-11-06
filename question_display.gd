extends HBoxContainer

@export var database : Database
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2
const QUIZ_BUTTON = preload("res://quiz_button.tscn")
var flip : bool = true
@onready var main: Control = $"../../../.."
var signid : int = Options.rand.randi_range(0,Options.topic.Signs.size()-1)
@onready var sign_label: Label = $"../Panel/Label"
@onready var texture_rect: TextureRect = $"../Panel/TextureRect"
var list : PackedInt32Array

func _ready() -> void:
	texture_rect.texture = get_sign(signid).SignArt
	sign_label.text = ""
	var correctnumb = Options.rand.randi_range(0,Options.answer_count-1)
	for i in Options.answer_count:
		if i == correctnumb:
			create_question(signid, true)
			continue
		create_question(Options.random_id())

func get_sign(id : int) -> AbstractSign:
	return Options.topic.Signs[id]

func create_question(id : int, correct : bool = false):
	var button : Button = QUIZ_BUTTON.instantiate()
	while list.has(id):
		id = Options.random_id()
	button.text = get_sign(id).Word
	if flip:
		v_box_container.add_child(button,false,Node.INTERNAL_MODE_FRONT)
	else:
		v_box_container_2.add_child(button,false,Node.INTERNAL_MODE_FRONT)
	button.connect("pressed",main._on_ans.bind(correct))
	flip = !flip
	list.append(id)
