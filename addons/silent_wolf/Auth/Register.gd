extends TextureRect

const SWLogger = preload("res://addons/silent_wolf/utils/SWLogger.gd")


func _ready():
	SilentWolf.check_auth_ready()
	SilentWolf.Auth.sw_registration_complete.connect(_on_registration_complete)
	SilentWolf.Auth.sw_registration_user_pwd_complete.connect(_on_registration_user_pwd_complete)


func _on_RegisterButton_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	var player_name = $"FormContainer/MainFormContainer/FormInputFields/PlayerName".text
	var email = $"FormContainer/MainFormContainer/FormInputFields/Email".text
	var password = $"FormContainer/MainFormContainer/FormInputFields/Password".text
	var confirm_password = $"FormContainer/MainFormContainer/FormInputFields/ConfirmPassword".text
	SilentWolf.Auth.register_player(player_name, email, password, confirm_password)
	show_processing_label()


func _on_RegisterUPButton_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	var player_name = $"FormContainer/MainFormContainer/FormInputFields/PlayerName".text
	var password = $"FormContainer/MainFormContainer/FormInputFields/Password".text
	var confirm_password = $"FormContainer/MainFormContainer/FormInputFields/ConfirmPassword".text
	SilentWolf.Auth.register_player_user_password(player_name, password, confirm_password)
	show_processing_label()


func _on_registration_complete(sw_result: Dictionary) -> void:
	if sw_result.success:
		registration_success()
	else:
		registration_failure(sw_result.error)


func _on_registration_user_pwd_complete(sw_result: Dictionary) -> void:
	if sw_result.success:
		registration_user_pwd_success()
	else:
		registration_failure(sw_result.error)


func registration_success() -> void:
	# redirect to configured scene (user is logged in after registration)
	var scene_name = SilentWolf.auth_config.redirect_to_scene
	# if doing email verification, open scene to confirm email address
	if ("email_confirmation_scene" in SilentWolf.auth_config) and (SilentWolf.auth_config.email_confirmation_scene) != "":
		SWLogger.info("registration succeeded, waiting for email verification...")
		scene_name = SilentWolf.auth_config.email_confirmation_scene
	else:
		SWLogger.info("registration succeeded, logged in player: " + str(SilentWolf.Auth.logged_in_player))
	get_tree().change_scene_to_file(scene_name)


func registration_user_pwd_success() -> void:
	var scene_name = SilentWolf.auth_config.redirect_to_scene
	get_tree().change_scene_to_file(scene_name)


func registration_failure(error: String) -> void:
	hide_processing_label()
	$"FormContainer/ErrorMessage".text = error
	$"FormContainer/ErrorMessage".show()


func _on_BackButton_pressed() -> void:
	ScriptGlobal.get_node("BackAudio").play()
	get_tree().change_scene_to_file(SilentWolf.auth_config.redirect_to_scene)


func show_processing_label() -> void:
	$"FormContainer/ProcessingLabel".show()


func hide_processing_label() -> void:
	$"FormContainer/ProcessingLabel".hide()


func _on_UsernameToolButton_mouse_entered() -> void:
	$"FormContainer/InfoBox".text = "Username should contain at least 6 characters (letters or numbers) and no spaces."
	$"FormContainer/InfoBox".show()


func _on_UsernameToolButton_mouse_exited() -> void:
	$"FormContainer/InfoBox".hide()


func _on_PasswordToolButton_mouse_entered() -> void:
	$"FormContainer/InfoBox".text = "Password should contain at least 8 characters including uppercase and lowercase letters, numbers and (optionally) special characters."
	$"FormContainer/InfoBox".show()


func _on_PasswordToolButton_mouse_exited() -> void:
	$"FormContainer/InfoBox".hide()


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
func EmailValidation(node: Node, new_text: String) -> void:
	ScriptGlobal.get_node("KeypressAudio").play()
	var allowed_characters = "[A-Za-z0-9-_@.]"
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
func _on_player_name_text_changed(new_text: String) -> void:
	PlayerNameValidation(%PlayerName, new_text)
func _on_email_text_changed(new_text: String) -> void:
	EmailValidation(%Email, new_text)
func _on_password_text_changed(new_text: String) -> void:
	PasswordValidation(%Password, new_text)
func _on_confirm_password_text_changed(new_text: String) -> void:
	PasswordValidation(%ConfirmPassword, new_text)

func _on_reveal_password_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%Password.set_secret(false)
		%ConfirmPassword.set_secret(false)
	else:
		%Password.set_secret(true)
		%ConfirmPassword.set_secret(true)

func _on_login_now_button_pressed() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	get_tree().change_scene_to_file("res://addons/silent_wolf/Auth/Login.tscn")
