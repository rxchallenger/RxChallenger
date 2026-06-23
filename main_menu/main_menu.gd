extends Control

var ScenePath :String

func _enter_tree() -> void:
	%AnimationPlayer.play("Load")
func _ready() -> void:
	ScriptGlobal.current_scene = get_tree().current_scene
	BgGlobal.show()
	$MenuGridContainer/CaseSelectButton.grab_focus()
	print("Current Scene:",ScriptGlobal.current_scene)
	await get_tree().process_frame
	UpdateLogginState()

	if OS.has_feature("web"):
		$VBoxContainer.hide()
		$Announcement.show()
	else:
		$Announcement.hide()

func SystemInfo() -> void:
	$UID.show()
	$MenuGridContainer.hide()
	var arrayString = OS.get_video_adapter_driver_info()
	var string = " ".join(arrayString)
	$UID/get_distribution_name.text = "get_distribution_name: " + (OS.get_distribution_name())
	$UID/get_name.text = "get_name: " + (OS.get_name())
	$UID/get_processor_name.text = "get_processor_name: " + (OS.get_processor_name())
	$UID/get_user_data_dir.text ="get_user_data_dir: " + (OS.get_user_data_dir())
	$UID/get_video_adapter_driver_info.text = "get_video_adapter_driver_info: " + string
	$UID/get_unique_id.text ="get_unique_id: " + (OS.get_unique_id())
	$UID/get_processor_count.text = "get_processor_count: " + str((OS.get_processor_count()))
	$UID/get_model_name.text ="get_model_name: " + (OS.get_model_name())
	$UID/get_executable_path.text ="get_executable_path: " + (OS.get_executable_path())

func _on_case_select_button_button_down() -> void:
	ScenePath = "res://case_select/case_select.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("ClickAudio").play()
func _on_leader_board_button_button_down() -> void:
	ScenePath = "res://addons/silent_wolf/Scores/Leaderboard.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("ClickAudio").play()
func _on_database_button_button_down() -> void:
	ScenePath = "res://database/database.tscn"
	%AnimationPlayer.play("DatabaseOut")
	ScriptGlobal.get_node("ClickAudio").play()
func _on_settings_button_button_down() -> void:
	ScenePath = "res://settings/settings.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("ClickAudio").play()
func _on_exit_button_button_down() -> void:
	ScenePath = "res://exit_menu/exit_menu.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("ClickAudio").play()
func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScenePath = "res://exit_menu/exit_menu.tscn"
		%AnimationPlayer.play("Out")
		ScriptGlobal.get_node("BackAudio").play()

func UpdateLogginState() -> bool:
	if SilentWolf.Auth.logged_in_player:
		$VBoxContainer/PlayerName.text = SilentWolf.Auth.logged_in_player
		$VBoxContainer/LogoutButton.show()
		$VBoxContainer/LoginButton.hide()
		$VBoxContainer/RegisterButton.hide()
		return true
	else:
		$VBoxContainer/PlayerName.text = "Not Logged in"
		$VBoxContainer/LogoutButton.hide()
		$VBoxContainer/LoginButton.show()
		$VBoxContainer/RegisterButton.show()
		return false
func _on_login_button_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	get_tree().change_scene_to_file("res://addons/silent_wolf/Auth/Login.tscn")
func _on_logout_button_pressed() -> void:
	ScriptGlobal.get_node("BackAudio").play()
	if SilentWolf.Auth.logged_in_player:
		SilentWolf.Auth.logout_player()
		ScriptGlobal.initialize_data()
func _on_register_button_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	get_tree().change_scene_to_file("res://addons/silent_wolf/Auth/Register.tscn")
func _on_timer_timeout() -> void:
	if  UpdateLogginState() != true:
		UpdateLogginState()

func _on_icon_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	for node in $Icon.get_children():
		node.show()
	$VBoxContainer.hide()
	$MenuGridContainer.hide()
	$Icon.self_modulate= Color(1,1,1,0.001)
	$IMC.self_modulate= Color(1,1,1,0.001)
func _on_icon_back_button_button_down() -> void:
	ScriptGlobal.get_node("BackAudio").play()
	for node in $Icon.get_children():
		node.hide()
	$VBoxContainer.show()
	$MenuGridContainer.show()
	$Icon.self_modulate= Color(1,1,1,1)
	$IMC.self_modulate= Color(1,1,1,1)
func _on_icon_done_button_button_down() -> void:
	ScriptGlobal.get_node("BackAudio").play()
	for node in $Icon.get_children():
		node.hide()
	$VBoxContainer.show()
	$MenuGridContainer.show()
	$Icon.self_modulate= Color(1,1,1,1)
	$IMC.self_modulate= Color(1,1,1,1)
func _on_website_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/digital-solutions/rx-challenger")
func _on_faq_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/faq")
func _on_privacy_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/privacy")
func _on_terms_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/terms")
func _on_about_us_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/about")
func _on_contact_us_button_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/contact")

func _on_imc_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://imc-hub.github.io/")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Out":
		get_tree().change_scene_to_file(ScenePath)
	elif anim_name == "DatabaseOut":
		hide()
		DatabaseGlobal.show()
		DatabaseGlobal.get_node("AnimationPlayer").play("Load")
		DatabaseGlobal.get_node("VirtualKeyboard/SolvingPanel/VBoxContainer/LineEdit").grab_focus()
		DatabaseGlobal.get_node("VirtualKeyboard/SolvingPanel/VBoxContainer/LineEdit").clear()
func _on_tree_exiting() -> void:
	ScriptGlobal.previous_scene = get_tree().current_scene.name
	print("Previous Scene :",ScriptGlobal.previous_scene)
