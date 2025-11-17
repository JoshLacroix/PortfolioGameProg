extends AnimatableBody3D

var og_spot: Vector3
var end_spot: Vector3
@export var speed = 3
var moving_up: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	og_spot = position
	end_spot = og_spot + Vector3(0, 5, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving_up:
		position.y += speed * delta
		if position.y >= end_spot.y:
			position.y = end_spot.y
			moving_up = false
	else:
		position.y -= speed * delta
		if position.y <= og_spot.y:
			position.y = og_spot.y
			moving_up = true
