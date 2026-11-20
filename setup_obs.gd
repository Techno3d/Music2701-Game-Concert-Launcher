extends Control

@onready var password: LineEdit = %OBSPass
@onready var connect_bttn: Button = %ConnectButton
@onready var connected_lbl: Label = $ConnectedLbl
var start_scene: PackedScene = preload("res://start_screen.tscn")

func _ready() -> void:
	connected_lbl.hide()
	connect_bttn.pressed.connect(func():
		ObsWebsocket.password = password.text
		ObsWebsocket.establish_connection()
	)
	ObsWebsocket.connection_authenticated.connect(func():
		connected_lbl.show()
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_packed(start_scene)
	)
