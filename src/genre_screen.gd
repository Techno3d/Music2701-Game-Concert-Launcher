extends Control

@export var start_card: Control

func _ready() -> void:
	start_card.focus_behavior_recursive = Control.FOCUS_BEHAVIOR_ENABLED

func pass_down():
	print("hi")
	start_card.grab_focus()
