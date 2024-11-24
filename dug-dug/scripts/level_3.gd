extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameVariables.red_key = false
	GameVariables.blue_key = false
	GameVariables.level = 3
	TitleMusic.stop()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
