extends Area3D

@onready var text_label = $"../Label3D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	text_label.visible = true
	pass # Replace with function body.
