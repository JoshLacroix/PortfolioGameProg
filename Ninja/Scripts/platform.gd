extends AnimatableBody3D

var og_spot: Vector3
var end_spot: Vector3
@export var speed = 3
var moving_forward: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	og_spot = position
	end_spot = og_spot + Vector3(0, 0, 5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving_forward:
		position.z += speed * delta
		if position.z >= end_spot.z:
			position.z = end_spot.z
			moving_forward = false
	else:
		position.z -= speed * delta
		if position.z <= og_spot.z:
			position.z = og_spot.z
			moving_forward = true
