extends Node2D

@export var radius: float = 0.0  # Default radius
var color: Color = Color(0, 0, 1, 0.1) #Default Opacity (last number)
@export var gradient_steps: int = 6  # Number of gradient layers


func enable_visual(new_radius: float, direction: int):
	radius = new_radius
	color = Color(0, 0, 1, 0.1) if direction == 1 else Color(1, 0.5, 0, 0.1)  # Blue for attract, Orange for repel
	queue_redraw()  # Update visuals

func disable_visual():
	color.a = 0  # Make the circle invisible
	queue_redraw()

func _draw():
	if Engine.is_editor_hint() or color.a > 0:
		for i in range(gradient_steps):
			var alpha = color.a * (1.0 - (i / float(gradient_steps)))  # Start at 0.15 and fade out
			var step_radius = radius * (i / float(gradient_steps))  # Expand outward
			draw_circle(Vector2.ZERO, step_radius, Color(color.r, color.g, color.b, alpha))
