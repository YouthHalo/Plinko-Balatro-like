extends Node2D

const PEG_SCENE = preload("res://scenes/peg.tscn")  # Ensure this path is correct

@export var rows: int = 8  # Number of rows in the triangle
@export var spacing: float = 31.0  # Distance between pegs

func _ready():
	spawn_peg_triangle(Vector2.ZERO, rows, spacing)  # Start from PegGrid's position
	var first_peg_position = Vector2(position.x, position.y)
	print("First peg would have been at:", first_peg_position)

func spawn_peg_triangle(start_position: Vector2, row_count: int, peg_spacing: float) -> void:
	
	for row in range(1, row_count):  # Start from row 1 instead of 0
		var row_y = start_position.y + row * peg_spacing  # Vertical position
		var start_x = start_position.x - (row * peg_spacing * 0.5)  # Center pegs

		for col in range(row + 1):  # Each row has row+1 pegs
			var peg_x = start_x + col * peg_spacing
			spawn_peg(Vector2(peg_x, row_y))

func spawn_peg(position: Vector2) -> void:
	if PEG_SCENE:
		var peg = PEG_SCENE.instantiate()
		add_child(peg)
		peg.position = position
