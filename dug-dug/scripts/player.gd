extends CharacterBody2D

var speed = 75
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collect: AudioStreamPlayer = $Collect
@onready var key: AudioStreamPlayer = $Key
@onready var timer: Timer = $Timer

signal stop_music

func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed

func _ready() -> void:
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("g"):
		GameVariables.points += 1000
	if velocity != Vector2(0,0):
		animation_player.play("move")
	else:
		animation_player.play("idle")
	get_input()
	move_and_collide(velocity * delta)
	
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		var collider = collision_info.get_collider()
		if collider.is_in_group("Dirt_Block"):
			collider.queue_free()
		if collider.is_in_group("Gem"):
			GameVariables.points += 1
			collect.play()
			collider.queue_free()
		if collider.is_in_group("Boulder"):
			if velocity == Vector2(0,0):
				timer.start()
				$Sprite2D.visible = false
				$CollisionShape2D.disabled = true
				emit_signal("stop_music")
		if collider.is_in_group("RedKey"):
			collider.queue_free()
			GameVariables.red_key = true
			key.play()
		if collider.is_in_group("BlueKey"):
			collider.queue_free()
			GameVariables.blue_key = true
			key.play()


func _on_timer_timeout() -> void:
	die()
	
func die():
	print("EFASF")
	get_tree().reload_current_scene()
	GameVariables.points = 0
