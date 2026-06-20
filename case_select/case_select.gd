extends Control

var ScenePath :String
@export var locked_icon :Resource
@export var unlocked_icon :Resource

@onready var v_scrollbar :VScrollBar = %ContentScrollContainer.get_v_scroll_bar()
@onready var ContentScrollContainer :ScrollContainer = %ContentScrollContainer
@onready var ContentVBoxContainer :VBoxContainer = %ContentVBoxContainer
var ScrollValueDifference :int = 0
var value_down :float = 0.0
var value_up :float = 0.0
@export var Case_1_Button :Button

func _enter_tree() -> void:
	%AnimationPlayer.play("Load")

func _ready() -> void:
	SaveLoad()
	ScriptGlobal.current_scene = get_tree().current_scene
	print("Current Scene:",ScriptGlobal.current_scene)
	Loading_Cases()
	Case_1_Button.grab_focus()

func SaveLoad() -> void:
#region New Code Region TESTING
	#ScriptGlobal.total_cases = 100
	#ScriptGlobal.unlocked_cases = 100
	#ScriptGlobal.cloud_save()
#endregion TESTING
	ScriptGlobal.total_cases = 160
	ScriptGlobal.save_data()
	if await SilentWolf.Auth.logged_in_player:
		ScriptGlobal.cloud_save()
		ScriptGlobal.total_cases = 160
		ScriptGlobal.cloud_load()

func Loading_Cases() -> void:
	for case in ContentVBoxContainer.get_children():
		if case.name.to_int() <= ScriptGlobal.total_cases and case.name != "StayTuned":
			case.text = "Case " + case.get_name()
			case.connect('button_up', case_button_up.bind(case.name))
			case.connect('button_down', case_button_down.bind(case.name))
		elif case.name == "StayTuned":
			case.text = "Stay Tuned For Updates!"
		else:
			case.queue_free()
		if str_to_var(case.name) in range(ScriptGlobal.unlocked_cases+1):
			case.disabled = false
			case.set_button_icon(unlocked_icon)
			case.set_expand_icon(true)
		elif case.name == "StayTuned":
			case.disabled = false
		else:
			case.disabled = true
			case.set_button_icon(locked_icon)
			case.set_expand_icon(true)
func case_button_down(_case_pressed) -> void:
	value_down = v_scrollbar.value
func case_button_up(case_pressed) -> void:
	value_up = v_scrollbar.value
	ScrollValueDifference = abs(value_down - value_up)
	for case in ContentVBoxContainer.get_children():
		if case.name == case_pressed and ScrollValueDifference < 50:
			ScenePath = "res://case_select/cases/"+case_pressed+".tscn"
			%AnimationPlayer.play("Out")
			ScriptGlobal.get_node("LoadingInAudio").play()

func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScenePath = "res://main_menu/main_menu.tscn"
		ScriptGlobal.get_node("BackAudio").play()
		%AnimationPlayer.play("Out")
func _on_back_button_button_down() -> void:
	ScenePath = "res://main_menu/main_menu.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()
func _on_stay_tuned_button_down() -> void:
	ScriptGlobal.get_node("ClickAudio").play()
	OS.shell_open("https://play.google.com/store/apps/details?id=com.pharmacycafe.goodrx&pcampaignid=web_share")
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
