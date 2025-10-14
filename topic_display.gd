extends HBoxContainer

@export var database : Database
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var v_box_container_2: VBoxContainer = $VBoxContainer2
const TOPIC_BUTTON = preload("res://topic_button.tscn")
var flip : bool = true
@onready var main: Control = $"../../.."

func _ready() -> void:
	for i in get_topics():
		create_topic(i)

func get_topics() -> Array[Topic]:
	var topics : Array[Topic]
	for i in database.database.size():
		topics.append(database.database.get(i))
	return topics

func create_topic(topic : Topic):
	var button : Button = TOPIC_BUTTON.instantiate()
	button.text = topic.Name
	if flip:
		v_box_container.add_child(button,false,Node.INTERNAL_MODE_FRONT)
	else:
		v_box_container_2.add_child(button,false,Node.INTERNAL_MODE_FRONT)
	button.connect("pressed",main._on_topic)
	flip = !flip
