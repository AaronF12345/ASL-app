extends Button

signal correct
signal select

var max_font_size: int = 155
var min_font_size: int = 0

var lest : bool = false
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

func _ready() -> void:
	fit_text_to_width(max_font_size)
	if text.length() >6:
		self.add_theme_font_size_override("font_size",120)
	#if !text.is_empty():
	#	rich_text_label.text = text
	#	text = ""

func counterpart_pressed():
	if selected:
		correct.emit()
		done = true
		counterpart.done = true
	else:
		lest = true

func _pressed() -> void:
	selected = true
	disabled = true
	select.emit()

func clear():
	if done:
		return
	selected = false
	disabled = false
	if lest == true:
		Options.wrong += 1
	lest = false

func _on_resized() -> void:
	pass
	#custom_minimum_size.y = size.x
	if !text.is_empty():
		fit_text_to_width(max_font_size)
	if text.length() >4:
		self.add_theme_font_size_override("font_size",130)
	if text.length() >8:
		self.add_theme_font_size_override("font_size",90)
	if text.length() >14:
		self.add_theme_font_size_override("font_size",75)
	#if !is_instance_valid(rich_text_label):
	#	return
	#while(rich_text_label.get_content_width() > size.x):
	#	rich_text_label.add_theme_font_size_override("normal_font_size", rich_text_label.get_theme_font_size("normal_font_size")+1)
	#	force_update_transform()

func fit_text_to_width(font_size: int) -> void:
	self.add_theme_font_size_override("font_size",font_size)
	while font_size > min_font_size:
		var text_width = theme.default_font.get_string_size(text).x
		if text_width <= size.x:
			break
		font_size -= 1
		self.add_theme_font_size_override("font_size",font_size)
