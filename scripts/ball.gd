extends RigidBody2D

func _ready() -> void:
	add_to_group("balls")
	var small_nudge = Vector2(randf_range(-6, 6), 0)  # Small horizontal force
	apply_impulse(small_nudge)
	#position nudge is currently in main_game
	
func _process(delta: float) -> void:
	#kill the ball :)
	if not get_viewport_rect().grow(50).has_point(global_position):
		queue_free()

func _physics_process(delta) -> void:
	if linear_velocity.length() < 5.0:  # If ball is too slow
		apply_impulse(Vector2(randf_range(-2, 2), randf_range(-1, 1)))  # Small random nudge
