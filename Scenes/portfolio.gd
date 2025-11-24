extends Control

@onready var prison_escape_scene: PackedScene = preload("res://Prison/Scenes/Prison/prison_scene.tscn")
@onready var ninja_parkour_Scene: PackedScene = preload("res://Ninja/Scenes/stage.tscn")
@onready var forest_scene: PackedScene = preload("res://Forest/Scenes/world.tscn")
@onready var tower_defense_scene: PackedScene = preload("res://TowerDefense/Scenes/world.tscn")

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_prison_button_pressed() -> void:
	get_tree().change_scene_to_packed(prison_escape_scene)

func _on_ninja_button_pressed() -> void:
	get_tree().change_scene_to_packed(ninja_parkour_Scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_forrest_button_pressed() -> void:
	get_tree().change_scene_to_packed(forest_scene)

func _on_td_button_pressed() -> void:
	get_tree().change_scene_to_packed(tower_defense_scene)
