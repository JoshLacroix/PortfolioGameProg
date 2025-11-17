extends Node3D

@export var spin_speed = 90.0
@export var spin_axis = Vector3.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(spin_axis.normalized(), deg_to_rad(spin_speed * delta))


func _on_area_3d_body_entered(body: CharacterBody3D) -> void:
	body.global_transform.origin = Vector3(0, 2.3, 23)
	pass # Replace with function body.
