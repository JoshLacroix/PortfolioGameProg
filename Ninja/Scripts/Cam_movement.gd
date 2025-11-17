extends Node3D

var rotation_speed = 0.005
var vertical_angle := 0.0
var min_vertical_angle := deg_to_rad(-30)
var max_vertical_angle := deg_to_rad(60)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * rotation_speed)
		vertical_angle = clamp(vertical_angle - event.relative.y * rotation_speed, min_vertical_angle, max_vertical_angle)
		var current_rotation = rotation_degrees
		current_rotation.x = deg_to_rad(vertical_angle)
		rotation_degrees = current_rotation
		
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
