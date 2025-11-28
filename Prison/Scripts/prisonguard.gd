extends CharacterBody3D

@export var movement_speed: float = 2.0
@export var movement_target: Node3D
@export var patrol_points: Array[Node3D]
@export var attack_target: Node3D
@export var attack_range: float = 2.0
@export var max_sight_distance: float = 20.0
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var raycast: RayCast3D = $RayCast3D
@export var sight_angle: float = PI / 2
@export var original_position: Vector3
@export var original_rotation: Vector3

func _ready():
	navigation_agent.path_desired_distance = 0.5
	navigation_agent.target_desired_distance = 0.5
	
	original_position = global_position
	original_rotation = global_rotation 
	
	actor_setup.call_deferred()


func actor_setup():
	await get_tree().physics_frame

	print("set target")

func set_movement_target(movement_target: Vector3):
	navigation_agent.set_target_position(movement_target)

func set_attack_target(target: Node3D):
	attack_target = target

func is_player_in_sight() -> bool:
	if not attack_target:
		return false
	
	var distance = global_position.distance_to(attack_target.global_position)
	
	if distance > max_sight_distance:
		return false
		
	var direction_to_target = (attack_target.global_position - global_position).normalized()
	var forward = global_transform.basis.z.normalized()
	var dot = direction_to_target.dot(forward)
	if dot < cos(sight_angle / 2):
		return false
	
	var target_local = raycast.to_local(attack_target.global_position)
	var direction_local = target_local.normalized()
	var ray_length = max(distance, max_sight_distance)  
	raycast.target_position = direction_local * ray_length
	
	raycast.force_raycast_update()
	var collider = raycast.get_collider()
	
	var in_sight = collider and (collider == attack_target or attack_target.is_ancestor_of(collider))
	return in_sight

func is_player_in_range() -> bool:
	if not attack_target:
		return false
	
	var distance = global_position.distance_to(attack_target.global_position)
	var in_range = distance <= attack_range
	return in_range

func _physics_process(delta):
		
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * movement_speed
	move_and_slide()
