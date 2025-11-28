extends Control

@onready var prison_escape_scene: PackedScene 
@onready var ninja_parkour_scene: PackedScene  
@onready var forest_scene: PackedScene 
@onready var tower_defense_scene: PackedScene 

func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_prison_button_pressed() -> void:
	prison_escape_scene = load("res://Prison/Scenes/Prison/prison_scene.tscn")
	get_tree().change_scene_to_packed(prison_escape_scene)

func _on_ninja_button_pressed() -> void:
	ninja_parkour_scene = load("res://Ninja/Scenes/stage.tscn")
	get_tree().change_scene_to_packed(ninja_parkour_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_forrest_button_pressed() -> void:
	forest_scene = load("res://Forest/Scenes/world.tscn")
	get_tree().change_scene_to_packed(forest_scene)

func _on_td_button_pressed() -> void:
	tower_defense_scene = load("res://TowerDefense/Scenes/world.tscn")
	get_tree().change_scene_to_packed(tower_defense_scene)
