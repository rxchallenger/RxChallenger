extends Control

@onready var keyboard_buttons = get_tree().get_nodes_in_group("Keyboard_Buttons_Gp")

@onready var database_global_trades = DatabaseGlobal.get_node(
"DatabaseMarginContainer/Panel/ContentScrollContainer/ContentVBoxContainer"
).get_children()

@onready var line_edit = %LineEdit
@onready var del_button = %Del
@onready var enter_button = %Enter
@onready var letter_count = %LetterCount
@onready var timer = $Timer

var accept_input := true
var updating_text := false

func _ready() -> void:
	connect_button_signals()
	update_buttons()
	update_letter_count()

func connect_button_signals() -> void:
	for button in keyboard_buttons:
		if button is Button:
			button.pressed.connect(_on_keyboard_button_pressed.bind(button))

func _on_keyboard_button_pressed(button: Button) -> void:
	line_edit_typing(button.name)



	if button:
		tween_button(button)

func _input(event: InputEvent) -> void:
	if not accept_input:
		return

	if event.is_action_pressed("ui_accept"):
		accept_input = false
		line_edit_typing("Enter")
		timer.start()

func _on_timer_timeout() -> void:
	accept_input = true

func line_edit_typing(button_name: String) -> void:

	match button_name:

		"Del":
			if line_edit.text.length() > 0:
				line_edit.text = line_edit.text.substr(
					0,
					line_edit.text.length() - 1
			)

		"Enter":
			if get_parent().name == "DatabaseGlobal":
				line_edit.clear()
			else:
				var answer: String = line_edit.text.to_upper()
				ScriptGlobal.answer_signal.emit(answer)
			line_edit.clear()

		_:
			line_edit.text += button_name

	update_buttons()
	update_letter_count()

	filter_database(line_edit.text.to_upper())

	ScriptGlobal.current_text.emit(line_edit.text)

func update_buttons() -> void:
	var has_text: bool = line_edit.text.length() > 0

	del_button.disabled = not has_text
	enter_button.disabled = not has_text

func update_letter_count() -> void:
	letter_count.text = "Char: %d" % line_edit.text.length()

func _on_line_edit_text_changed(new_text: String) -> void:

	if updating_text:
		return

	updating_text = true

	var regex := RegEx.new()
	regex.compile("[A-Za-z]")

	var filtered_text := ""

	for result in regex.search_all(new_text):
		filtered_text += result.get_string().to_upper()

	if filtered_text != line_edit.text:
		line_edit.text = filtered_text
		line_edit.set_caret_column(line_edit.text.length())

	update_buttons()
	update_letter_count()

	filter_database(filtered_text)

	ScriptGlobal.current_text.emit(line_edit.text)

	var audio_player = ScriptGlobal.get_node_or_null("KeypressAudio")
	if audio_player:
		audio_player.play()

	updating_text = false

func filter_database(search_text: String) -> void:

	if search_text.is_empty():

		for item in database_global_trades:
			if item.text != "":
				item.show()

		return

	var matches := []

	for item in database_global_trades:
		if search_text in item.text.to_upper():
			matches.append(item)

	for item in database_global_trades:
		if item in matches and item.text != "":
			item.show()
		else:
			item.hide()

func tween_button(button: Button) -> void:

	var tween := create_tween()

	tween.tween_property(
		button,
		"scale",
		Vector2(1.1, 1.1),
		0.1
	)

	tween.tween_property(
		button,
		"modulate",
		Color("PINK"),
		0.1
	)

	tween.tween_property(
		button,
		"scale",
		Vector2.ONE,
		0.1
	)

	tween.tween_property(
		button,
		"modulate",
		Color.WHITE,
		0.1
	)
