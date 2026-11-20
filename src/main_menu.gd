extends Control

var selector_scene = preload("res://selector.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventKey or event is InputEventJoypadButton:
		get_tree().change_scene_to_packed(selector_scene)