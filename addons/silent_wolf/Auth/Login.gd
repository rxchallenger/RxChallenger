extends TextureRect

const SWLogger = preload("res://addons/silent_wolf/utils/SWLogger.gd")


func _ready():
	SilentWolf.Auth.sw_login_complete.connect(_on_login_complete)


func _on_LoginButton_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	var username = $"FormContainer/UsernameContainer/Username".text
	var password = $"FormContainer/PasswordContainer/Password".text
	var remember_me = $"FormContainer/RememberMeCheckBox".is_pressed()
	SWLogger.debug("Login form submitted, remember_me: " + str(remember_me))
	SilentWolf.Auth.login_player(username, password, remember_me)
	show_processing_label()


func _on_login_complete(sw_result: Dictionary) -> void:
	if sw_result.success:
		login_success()
	else:
		login_failure(sw_result.error)


func login_success() -> void:
	var scene_name = SilentWolf.auth_config.redirect_to_scene
	SWLogger.info("logged in as: " + str(SilentWolf.Auth.logged_in_player))
	ScriptGlobal.cloud_load()
	get_tree().change_scene_to_file(scene_name)


func login_failure(error: String) -> void:
	hide_processing_label()
	SWLogger.info("log in failed: " + str(error))
	$"FormContainer/ErrorMessage".text = error
	$"FormContainer/ErrorMessage".show()


func show_processing_label() -> void:
	$"FormContainer/ProcessingLabel".show()
	$"FormContainer/ProcessingLabel".show()


func hide_processing_label() -> void:
	$"FormContainer/ProcessingLabel".hide()


func _on_LinkButton_pressed() -> void:
	get_tree().change_scene_to_file(SilentWolf.auth_config.reset_password_scene)


func _on_back_button_pressed():
	ScriptGlobal.get_node("BackAudio").play()
	get_tree().change_scene_to_file(SilentWolf.auth_config.redirect_to_scene)
func _on_remember_me_check_box_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
func PlayerNameValidation(node: Node, new_text: String) -> void:
	ScriptGlobal.get_node("KeypressAudio").play()
	var allowed_characters = "[A-Za-z0-9-_]"
	var old_caret_column = node.caret_column
	var word = ""
	var regex = RegEx.new()
	regex.compile(allowed_characters)
	for valid_character in regex.search_all(new_text):
		word += valid_character.get_string()
	node.set_text(word)
	node.text = node.text.to_lower()
	node.caret_column = old_caret_column
func PasswordValidation(node: Node, new_text: String) -> void:
	ScriptGlobal.get_node("KeypressAudio").play()
	var allowed_characters = "[A-Za-z0-9!#$%^*(){}:;',<>?|~=_@./#&+-]"
	var old_caret_column = node.caret_column
	var word = ""
	var regex = RegEx.new()
	regex.compile(allowed_characters)
	for valid_character in regex.search_all(new_text):
		word += valid_character.get_string()
	node.set_text(word)
	node.caret_column = old_caret_column
func _on_username_text_changed(new_text: String) -> void:
	PlayerNameValidation(%Username, new_text)
func _on_password_text_changed(new_text: String) -> void:
	PasswordValidation(%Password, new_text)

func _on_signup_button_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	get_tree().change_scene_to_file("res://addons/silent_wolf/Auth/Register.tscn")


func _on_reveal_password_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%Password.set_secret(false)
	else:
		%Password.set_secret(true)
