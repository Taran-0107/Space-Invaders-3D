extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit
@onready var restart_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Restart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animator.play("RESET")
	quit_button.pressed.connect(get_tree().quit)


func unpause():
	set_visible(false)
	animator.play_backwards("game_over")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func pause():
	set_visible(true)
	animator.play("game_over")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_restart_pressed():
	unpause()
	get_tree().reload_current_scene()
