class_name GameCard
extends PanelContainer

@onready var hover: Panel = $Hover
@onready var name_lbl: Label = $Card/MarginContainer/VBoxContainer/ColorRect/GameNameLabel
@onready var game_texture: TextureRect = $Card/MarginContainer/VBoxContainer/TextureRect
@export var game_name: String = "Game Name"
@export var texture: Texture2D

func _ready() -> void:
	name_lbl.text = game_name
	game_texture.texture = texture
	hover.hide()
	focus_entered.connect(hover.show)
	focus_exited.connect(hover.hide)
	mouse_entered.connect(grab_focus)
	mouse_exited.connect(release_focus)
