extends Control

var ScenePath :String
@export var OkButton :Button


func _enter_tree() -> void:
	$AnimationPlayer.play("Load")

func _ready() -> void:
	ScriptGlobal.current_scene = get_tree().current_scene
	BgGlobal.show()
	print("Current Scene:",ScriptGlobal.current_scene)
	OkButton.grab_focus()
	Mute_Button_Logic()

func Tween_Anim() -> void:
	var tween :Tween = create_tween().set_loops()
	tween.tween_property(%TrashButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%TrashButton, "position:x", position.x-10, 0.5 ).as_relative()
	tween.tween_property(%BackButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%BackButton, "position:x", position.x-10, 0.5 ).as_relative()
	tween.tween_property(%MuteButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%MuteButton, "position:x", position.x-10, 0.5 ).as_relative()

func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScenePath = "res://main_menu/main_menu.tscn"
		%AnimationPlayer.play("Out")
func _on_back_button_button_down() -> void:
	ScenePath = "res://main_menu/main_menu.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()

func _on_mute_button_pressed() -> void:
	AudioServer.set_bus_mute(ScriptGlobal.master_bus, not AudioServer.is_bus_mute(ScriptGlobal.master_bus))
	ScriptGlobal.bus_mute_state = AudioServer.is_bus_mute(ScriptGlobal.master_bus)
	ScriptGlobal.save_data()

func Mute_Button_Logic() -> void:
	if AudioServer.is_bus_mute(ScriptGlobal.master_bus) == true:
		%MuteButton.set_pressed_no_signal(true)

func _on_trash_button_button_down() -> void:
	var dir = DirAccess.open("user://")
	dir.remove("user://save_file.save")
	ScriptGlobal.load_data()
	if SilentWolf.Auth.logged_in_player:
		SilentWolf.Players.delete_all_player_data(SilentWolf.Auth.logged_in_player)
		ScriptGlobal.cloud_save()
	ScriptGlobal.get_node("TrashAudio").play()
	ScenePath = "res://main_menu/main_menu.tscn"
	%AnimationPlayer.play("Out")
func _on_ok_button_button_down() -> void:
	_on_back_button_button_down()
	ScriptGlobal.get_node("BackAudio").play()
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Out": get_tree().change_scene_to_file(ScenePath)
		"Load": Tween_Anim()
func _on_tree_exiting() -> void:
	ScriptGlobal.previous_scene = get_tree().current_scene.name
	print("Previous Scene :",ScriptGlobal.previous_scene)
