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
	if prison_guard.is_player_in_sight():
		state_machine.transition_to("Chasing")
	
