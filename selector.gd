extends Control

@export var selector_categories: Array[PackedScene]
@onready var move_selector: MoveSelector = $CanvasLayer/MoveSelector

func _ready() -> void:
	var selector_size = selector_categories.size()
	var selector_list: Array[Control] = []
	# selector_list.append(self)
	for i in range(selector_size):
		var selector: Control = selector_categories.get(i).instantiate()
		selector.position = Vector2(size.x*(i+1), 0)
		selector.focus_neighbor_top = move_selector.get_path()
		selector.focus_next = move_selector.get_path()
		selector_list.append(selector)
		add_child(selector)
	move_selector.setup(selector_list, 0, size.x)
	move_selector.grab_focus()
	
