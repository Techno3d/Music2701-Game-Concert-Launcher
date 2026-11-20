extends Control

@onready var children: Array[Node] = get_children()
var radius = 200

func _ready() -> void:
	var children_num = children.size()
	for i in range(children_num):
		(children[i] as Control).position = Vector2(radius * cos(2*PI*(i+1)/children_num), radius * sin(2*PI*(i+1)/children_num))
