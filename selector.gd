extends Control

@export var selector_categories: Array[PackedScene]
@onready var move_selector: MoveSelector = $CanvasLayer/MoveSelector

func _ready() -> void:
	var selector_size = selector_categories.size()
	var selector_list: Array[Control] = []
	selector_list.append(self)
	for i in range(selector_size):
		var selector: Control = selector_categories.get(i).instantiate()
		add_child(selector)
		# selector.position = Vector2(size.x*((i+2)/(2*selector_size)), size.y*((i+3)/(2*selector_size)))
		selector.position = Vector2(size.x*((i+1)/selector_size), 0)
		selector.focus_neighbor_top = move_selector.get_path()
		selector.focus_next = move_selector.get_path()
		selector_list.append(selector)
	move_selector.setup(selector_list, 0, size.x)
	move_selector.grab_focus()
	
