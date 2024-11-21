extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if GameVariables.level == 1:
		GameVariables.level += 1
		call_deferred("load_two")
	elif GameVariables.level == 2:
		GameVariables.level += 1
		call_deferred("load_three")
	pass # Replace with function body.

func load_two():
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func load_three():
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
