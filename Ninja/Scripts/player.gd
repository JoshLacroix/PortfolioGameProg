extends CharacterBody3D


@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	var camera = $CameraPivot/Camera3D
	var forward = -camera.global_transform.basis.z
	var right = camera.global_transform.basis.x
	
	forward = forward.normalized()
	right = right.normalized()
	
	var direction = (right * input_dir.x + forward * -input_dir.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	#var camera_pivot = $CameraPivot
	#rotation.y = camera_pivot.rotation.y

	move_and_slide()
	animate()

func animate():
	$AnimationTree["parameters/conditions/isMoving"] = abs(velocity.x) + abs(velocity.z) > 0.1
	$AnimationTree["parameters/conditions/isNotMoving"] = abs(velocity.x) + abs(velocity.z) < 0.1
	$AnimationTree["parameters/conditions/isGrounded"] = is_on_floor()
	$AnimationTree["parameters/conditions/isJumpPressed"] = Input.is_action_just_pressed("ui_accept") 

func animate_bad():
	if velocity.length() < 0.1:
		$AnimationPlayer.play("Idle0")
	else:
		if is_on_floor():
			$AnimationPlayer.play("Running0")
		else:
			$AnimationPlayer.play("Jump0")
