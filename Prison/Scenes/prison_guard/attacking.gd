extends State
class_name Attacking

@onready var prison_guard: CharacterBody3D = $"../.."
@onready var navigation_agent: NavigationAgent3D = $"../../NavigationAgent3D"
@onready var target : Node3D = $"../..".attack_target

func enter(_msg := {}) -> void:
	%AnimationPlayer.play("Attack")
	%AnimationPlayer.connect("animation_finished", Callable(self, "_on_attack_finished"))
	print("attack")

func physics_update(_delta: float) -> void:
	if target:
		prison_guard.look_at(target.global_position, Vector3.UP)
	
	orient_guard()

func _on_attack_finished(anim_name: String):
	if anim_name == "Attack":
		if prison_guard.patrol_points.size() > 0:
			state_machine.transition_to("Patrolling")
		else:
			state_machine.transition_to("Idle")

func orient_guard():
	var velocity = prison_guard.get_velocity()
	prison_guard.look_at(prison_guard.global_position + -velocity.normalized(), Vector3.UP)
