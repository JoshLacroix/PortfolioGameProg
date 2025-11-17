extends Area3D

@onready var timer: Timer = $Timer

var guard_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	timer.timeout.connect(_on_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D and body != get_parent():
		guard_inside = true
		timer.start()
		print("IN")


func _on_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D and body != get_parent():
		guard_inside = false
		timer.stop() 
		print("OUT")

func _on_timer_timeout() -> void:
	if guard_inside:
		trigger_fail()

func trigger_fail():
	get_tree().paused = true
	show_fail_ui()

func show_fail_ui():
	var ui = $"../../CanvasLayer"
	if ui:
		ui.show_fail_ui()
	pass
