@tool
extends Resource
class_name AbstractSign

@export var Word : String
@export var SignArt : CompressedTexture2D
@export var AltSignArt : CompressedTexture2D
@export var ImageArt : CompressedTexture2D
@export var AltImageArt : CompressedTexture2D
@export var autofill : bool = false:
	set(new):
		autofill = false
		Word = self.get_path().get_file().get_basename()
		var dirs := ResourceLoader.list_directory("res://assets/Clipart/")
		for i in dirs:
			var done = false
			var dirs2 := ResourceLoader.list_directory("res://assets/Clipart/" + i)
			for y in dirs2:
				var items := ResourceLoader.list_directory("res://assets/Clipart/" + i + y)
				for v in items:
					if v.to_lower().begins_with("sign"):
						if v.to_lower().contains(Word):
							if !is_instance_valid(SignArt):
								SignArt = load("res://assets/Clipart/" + i + y + v)
							else:
								done = true
								AltSignArt = load("res://assets/Clipart/" + i + y + v)
					else:
						if v.to_lower().contains(Word):
							if !is_instance_valid(ImageArt):
								ImageArt = load("res://assets/Clipart/" + i + y + v)
							else:
								done = true
								AltImageArt = load("res://assets/Clipart/" + i + y + v)
			if done:
				break

func do_autofill():
	autofill = true
