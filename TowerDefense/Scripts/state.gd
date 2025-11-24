@abstract
class_name OgreState
extends Node

# Abstract class

var state_machine: OgreStateMachine = null

# Virtual methods
func handle_input(_event: InputEvent):
	pass
	
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass
	
func enter(_msg := {}) -> void:
	pass
	
func exit() -> void:
	pass
