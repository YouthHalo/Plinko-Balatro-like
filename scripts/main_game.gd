extends Node2D

const SCENE_TO_SPAWN = preload("res://scenes/ball.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		spawn_scene()

func spawn_scene() -> void:
	if SCENE_TO_SPAWN:
		var new_scene = SCENE_TO_SPAWN.instantiate()
		if new_scene is Node2D:
			add_child(new_scene)
			new_scene.position = Vector2(384, 65)
