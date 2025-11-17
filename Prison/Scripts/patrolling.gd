extends State
class_name Patrolling

@onready var patrol_points: Array[Node3D] = $"../..".patrol_points
@onready var navigation_agent: NavigationAgent3D = $"../../NavigationAgent3D"
@onready var prison_guard: CharacterBody3D = $"../.."

func enter(_msg := {}) -> void:
	if patrol_points.size() == 0:
		state_machine.transition_to("Idle")
		return
	
	%AnimationPlayer.play("Walk")
	select_next_target()
	print("patroll")

func update(_delta: float) -> void:
	if navigation_agent.is_target_reached():
		select_next_target()
	
	orient_guard()
	if prison_guard.is_player_in_sight():
		state_machine.transition_to("Chasing")

var patrol_index = 0
func select_next_target():
	if patrol_points.size() == 0:
		return
	
	patrol_index += 1
	var next_target = patrol_points[patrol_index % patrol_points.size()]
	navigation_agent.set_target_position(next_target.global_position)
	
	if not navigation_agent.is_target_reachable():
		patrol_index += 1
		next_target = patrol_points[patrol_index % patrol_points.size()]
		navigation_agent.set_target_position(next_target.global_position)

func orient_guard():
	var velocity = prison_guard.get_velocity()
	prison_guard.look_at(prison_guard.global_position + -velocity.normalized(), Vector3.UP)
