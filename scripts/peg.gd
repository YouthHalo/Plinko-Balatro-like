extends StaticBody2D

@export var gravity_strength: float = 20.0
@export var gravity_range: float = 60.0
@onready var sprite: Sprite2D = $Sprite2D
@onready var visualizer: Node2D = $"Gravity Visualizer"  

var gravity_direction: int = 0  # 0 = neutral, 1 = attract, -1 = repel

func _ready():
	sprite.modulate = Color(0.5, 0.5, 0.5) #Grey
	#apply_gravity()
	pass

func apply_gravity() -> void:
	var chance = randf()
	if chance < 0.2:  # 20% chance to be special
		gravity_direction = 1 if randf() < 0.5 else -1
		update_color()
		if visualizer:
			visualizer.enable_visual(gravity_range, gravity_direction)
	else:
		if visualizer:
			visualizer.disable_visual()

	update_color()

func update_color():
	if gravity_direction == 1:
		sprite.modulate = Color(0, 0, 1)  # Blue for attract
	elif gravity_direction == -1:
		sprite.modulate = Color(1, 0.5, 0)  # Orange for repel
	# Grey for normal

func _physics_process(delta):
	if gravity_direction == 0:
		return  

	for body in get_tree().get_nodes_in_group("balls"):
		var distance = global_position.distance_to(body.global_position)
		
		if distance < gravity_range:
			var force_direction = (global_position - body.global_position).normalized()
			var force = force_direction * gravity_strength * gravity_direction * (1.0 - (distance / gravity_range))
			
			body.apply_impulse(force)
