extends ColorRect

const MAIN_MENU = preload("res://main_menu.tscn")


@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit

func _ready() -> void:
	play_button.pressed.connect(unpause)


func unpause():
	set_visible(false)
	animator.play("unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func pause():
	set_visible(true)
	animator.play("pause")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_quit_pressed():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://main_menu.tscn")
