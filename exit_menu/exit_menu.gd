extends Control

var ScenePath :String
@export var Cancel_Button :Button

func _enter_tree() -> void:
	%AnimationPlayer.play("Load")

func _ready() -> void:
	ScriptGlobal.current_scene = get_tree().current_scene
	print("Current Scene:",ScriptGlobal.current_scene)
	Cancel_Button.grab_focus()

func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScriptGlobal.get_node("BackAudio").play()
		get_tree().quit()
func _on_back_button_button_down() -> void:
	ScenePath = "res://main_menu/main_menu.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()
func _on_cancel_button_down() -> void:
	ScenePath = "res://main_menu/main_menu.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()
func Tween_Anim() -> void:
	var tween :Tween = create_tween().set_loops()
	tween.tween_property(%BackButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%BackButton, "position:x", position.x-10, 0.5 ).as_relative()
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Out": get_tree().change_scene_to_file(ScenePath)
		"Load": Tween_Anim()
func _on_tree_exiting() -> void:
	ScriptGlobal.previous_scene = get_tree().current_scene.name
	print("Previous Scene :",ScriptGlobal.previous_scene)
func _on_ok_button_down() -> void:
	ScriptGlobal.get_node("BackAudio").play()
	get_tree().quit()
