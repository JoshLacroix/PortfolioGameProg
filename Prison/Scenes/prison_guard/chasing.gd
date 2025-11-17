extends State
class_name Chasing

@onready var prison_guard: CharacterBody3D = $"../.."
@onready var navigation_agent: NavigationAgent3D = $"../../NavigationAgent3D"

var original_speed: float

func enter(_msg := {}) -> void:
	%AnimationPlayer.play("Run")
	original_speed = prison_guard.movement_speed
	prison_guard.movement_speed = 4.0
	print("chasing")

func exit() -> void:
	prison_guard.movement_speed = original_speed

func update(_delta: float) -> void:
	if not prison_guard.is_player_in_sight():
		if prison_guard.patrol_points.size() > 0:
			state_machine.transition_to("Patrolling")
		else:
			state_machine.transition_to("Idle")
	
	if prison_guard.is_player_in_range():
		state_machine.transition_to("Attacking")

func physics_update(_delta: float) -> void:
	if prison_guard.attack_target:
		navigation_agent.set_target_position(prison_guard.attack_target.global_position)
	orient_guard()

func orient_guard():
	var velocity = prison_guard.get_velocity()
	prison_guard.look_at(prison_guard.global_position + -velocity.normalized(), Vector3.UP)
