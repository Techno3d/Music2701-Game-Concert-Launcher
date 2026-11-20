extends Control

@onready var anim_player: AnimationPlayer = $AnimationPlayer
var main_scene: PackedScene = preload("res://main_menu.tscn")
var is_started := false

func _ready() -> void:
	anim_player.animation_finished.connect(func (_x):
		if is_started:
			get_tree().change_scene_to_packed(main_scene)
	)

func _input(event: InputEvent) -> void:
	if !is_started and event is InputEventKey or event is InputEventJoypadButton:
		anim_player.play("intro")
		is_started = true