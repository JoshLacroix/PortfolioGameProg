extends CanvasLayer

@onready var restart_button: Button = $Container/VBoxContainer/RestartButton
@onready var quit_button: Button = $Container/VBoxContainer/QuitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.pressed.connect(_on_restart_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	visible = false

func show_fail_ui():
	visible = true 

func _on_restart_button_pressed() -> void:
	get_tree().paused = false  
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
