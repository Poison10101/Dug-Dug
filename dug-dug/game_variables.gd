extends Node

var points = 0
var level = 0
var current_scene = null

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1)
	print(current_scene)

func switch_level(res_path):
	
	pass
