extends Control

var parent :Node

func _ready() -> void:
	hide()

func _on_done_button_button_down() -> void:
	parent = get_parent()
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()
	parent.get_node("VirtualKeyboard/SolvingPanel/VBoxContainer/LineEdit").grab_focus()
	if ScriptGlobal.current_scene.name != "MainMenu" and parent.current_score == parent.target_score:
		parent.AutoLoadNextLevel()

func _on_animation_player_animation_started(anim_name: StringName) -> void:
	if anim_name == "Load":
		show()

func Showing_Database_Scene():
	hide()
	%AlternativesText.scroll_to_line(0)
	%DrugDataText.scroll_to_line(0)
	DatabaseGlobal.show()
	DatabaseGlobal.get_node("AnimationPlayer").play("LoadFromTip")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Out" and ScriptGlobal.current_scene.name == "MainMenu":
		Showing_Database_Scene()
	elif anim_name == "Load":
		%AlternativesText.scroll_to_line(0)
		%DrugDataText.scroll_to_line(0)
		%DoneButton.grab_focus()
	else:
		%AlternativesText.scroll_to_line(0)
		%DrugDataText.scroll_to_line(0)
		hide()


func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST and is_visible_in_tree():
		hide()
		ScriptGlobal.get_node("BackAudio").play()
