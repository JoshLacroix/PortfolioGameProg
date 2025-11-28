extends CanvasLayer

@onready var return_Button: Button = $Container/VBoxContainer/ReturnButton
@onready var quit_button: Button = $Container/VBoxContainer/QuitButton

func _ready() -> void:
	return_Button.pressed.connect(_on_return_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_return_button_pressed() -> void:
	visible = false
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 

func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://test.tscn")
