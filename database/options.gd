extends Node

var rand : RandomNumberGenerator = RandomNumberGenerator.new()
var topic : Topic
@export var answer_count : int = 4
@export var quiz_length : int = 5
@export var current_question : int = 0
@export var wrong : int = 0
@export var alt_image : bool = false
enum Types{
	quiz,
	tiles,
}
@export var type : Types

func random_id() -> int:
	return rand.randi_range(0,topic.Signs.size()-1)
