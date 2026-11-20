class_name MoveSelector
extends Panel

var selector_list: Array[Control]
var current_idx := 0
var length := 0
var screen_width := 0
var is_focused := false

@onready var right_arrow: TextureRect = $MarginContainer/RightArrow
@onready var left_arrow: TextureRect = $MarginContainer/LeftArrow

func setup(selectors: Array[Control], idx, width) -> void :
	selector_list = selectors
	current_idx = idx
	length = selector_list.size()
	self.screen_width = width

func _ready() -> void:
	focus_entered.connect(func(): 
		is_focused = true
		show()
	)
	focus_exited.connect(func(): 
		is_focused = false
		hide()
	)

func show_arrows():
	# Right side
	if(current_idx == length - 1):
		right_arrow.hide()
	else:
		right_arrow.show()
	# Left side
	if(current_idx == 0):
		left_arrow.hide()
	else:
		left_arrow.show()

func move_right():
	current_idx += 1
	show_arrows()
	for i in range(length):
		selector_list[i].position.x = screen_width*((i+1-current_idx)/length)

func move_left():
	current_idx -= 1
	show_arrows()
	for i in range(length):
		selector_list[i].position.x = screen_width*((i+1-current_idx)/length)

func move_down():
	if selector_list[current_idx].has_method("pass_down"):
		selector_list[current_idx].focus_neighbor_top = get_path()
		selector_list[current_idx].pass_down()
	else:
		print_debug("No one to pass down to")

func _input(event: InputEvent) -> void:
	if !is_focused:
		if event is InputEventKey and event.is_released():
			if (event as InputEventKey).keycode == KEY_ESCAPE:
				grab_focus()
	if is_focused:
		if event is InputEventKey and event.is_released():
			if (event as InputEventKey).keycode == KEY_RIGHT and current_idx < (length - 1):
				move_right()
			elif (event as InputEventKey).keycode == KEY_LEFT and current_idx > 0:
				move_left()
			elif (event as InputEventKey).keycode == KEY_DOWN:
				move_down()
		if event is InputEventJoypadButton and event.is_released():
			if (event as InputEventJoypadButton).button_index == JOY_BUTTON_DPAD_RIGHT and current_idx < (length - 1):
				move_right()
			elif (event as InputEventJoypadButton).button_index == JOY_BUTTON_DPAD_LEFT and current_idx > 0:
				move_left()
			elif (event as InputEventJoypadButton).button_index == JOY_BUTTON_DPAD_DOWN:
				move_down()