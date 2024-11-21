extends Panel

@onready var gems: Label = $Gems
@onready var level: Label = $Level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gems.text = "GEMS: " + str(GameVariables.points)
	level.text = "LEVEL: " + str(GameVariables.level)
	pass


func _on_restart_pressed() -> void:
	GameVariables.points = 0
	get_tree().reload_current_scene()
