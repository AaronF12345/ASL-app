@tool
extends Resource
class_name Topic

@export var Name : String
@export var Signs : Dictionary[int,AbstractSign]

@export var autofill : bool = false:
	set(new):
		autofill = false
		Name = self.get_path().get_file().get_basename()
		var folder = DirAccess.open("C:/Users/Aaron/OneDrive/Documents/asl-app/database/signs/")
		folder.make_dir("C:/Users/Aaron/OneDrive/Documents/asl-app/database/signs/" + Name + "/")
		var dirs := ResourceLoader.list_directory("res://assets/Clipart/")
		for i in dirs:
			if i.to_lower().contains(Name):
				var dirs2 := ResourceLoader.list_directory("res://assets/Clipart/" + i + "Sign Clip art/")
				if dirs2.is_empty():
					dirs2 = ResourceLoader.list_directory("res://assets/Clipart/" + i + "Sign Clipart/")
				for e in dirs2:
					if e.contains("01"):
						var new_sign = AbstractSign.new()
						new_sign.set_name(remove_capitals(e.get_slice("-",0).right(-5)).to_lower() + ".tres")
						var error = ResourceSaver.save(new_sign,"res://database/signs/" + Name + "/" + remove_capitals(e.get_slice("-",0).right(-5)).to_lower() + ".tres")
						if error == OK:
							print("Scene saved successfully at: ", "res://database/signs/" + Name + "/")
						else:
							print("Failed to save scene. Error code: ", error)
						Signs.get_or_add(dirs2.find(e)/2,ResourceLoader.load("res://database/signs/" + Name + "/" + remove_capitals(e.get_slice("-",0).right(-5)).to_lower() + ".tres"))
		for i in Signs:
			Signs.get(i).autofill = true

func remove_capitals(text: String) -> String:
	var result := ""
	for char in text:
		var cap = char.to_lower()
		if char != cap or char == " ":
			result += char
	if result.ends_with(" "):
		return result.left(-1)
	return result
