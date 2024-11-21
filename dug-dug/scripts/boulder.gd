extends CharacterBody2D
@onready var raycast: RayCast2D = $RayCast2D
@onready var marker_2d: Marker2D = $Marker2D

signal on_ground

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast.is_colliding():
		emit_signal("on_ground")
	else:
		position.y += 150 * delta
