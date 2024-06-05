extends ColorRect


@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit
@onready var restart_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Restart


func _ready() -> void:
	animator.play("RESET")
	play_button.pressed.connect(unpause)
	#quit_button.pressed.connect(get_tree().quit)
	


func unpause():
	set_visible(false)
	animator.play_backwards("pause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func pause():
	set_visible(true)
	animator.play("pause")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_restart_pressed():
	unpause()
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
