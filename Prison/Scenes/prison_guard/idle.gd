extends State
class_name Idle

@onready var prison_guard: CharacterBody3D = $"../.."
@onready var navigation_agent: NavigationAgent3D = $"../../NavigationAgent3D"
@onready var target : Node3D = $"../..".attack_target

func enter(_msg := {}) -> void:
	%AnimationPlayer.play("Idle")
	print("Idle")
	if prison_guard.patrol_points.size() > 0:
		state_machine.transition_to("Patrolling")

func update(_delta: float) -> void:
	if not navigation_agent.is_target_reached():
		%AnimationPlayer.play("Walk")
	else:
		%AnimationPlayer.play("Idle")
		prison_guard.global_rotation = prison_guard.original_rotation
	
	if prison_guard.is_player_in_sight():
		state_machine.transition_to("Chasing")

func physics_update(_delta: float) -> void:
	orient_guard()

func orient_guard():
	var velocity = prison_guard.get_velocity()
	prison_guard.look_at(prison_guard.global_position + -velocity.normalized(), Vector3.UP)
	
