extends Control

@export var ContentVBoxContainer :VBoxContainer
@export var ContentScrollContainer :ScrollContainer
@onready var v_scrollbar :VScrollBar = ContentScrollContainer.get_v_scroll_bar()

@onready var Buttons_Count :int = ContentVBoxContainer.get_child_count()
var Database_Drug_Count :int = DrugsGlobal.get_child_count()
var x :int = 0

var DrugButtons :Button
var ScrollValueDifference :int = 0
var value_down :float = 0.0
var value_up :float = 0.0

var parent :Node

func _enter_tree() -> void:
	hide()

func _ready() -> void:
	Loading_Drugs()


func Loading_Drugs() -> void:
	for node in DrugsGlobal.get_children():
		if Database_Drug_Count <= Buttons_Count and x <= Database_Drug_Count:
			DrugButtons = ContentVBoxContainer.get_child(x)
			DrugButtons.text = node.name
			DrugButtons.connect('button_up', drug_button_up.bind(node.name))
			DrugButtons.connect('button_down', drug_button_down.bind(node.name))
			x += 1
	for node in ContentVBoxContainer.get_children():
		if node.text == "":
			node.hide()

func drug_button_down(_drug_pressed) -> void:
	value_down = v_scrollbar.value
func drug_button_up(drug_pressed) -> void:
	value_up = v_scrollbar.value
	ScrollValueDifference = abs(value_down - value_up)
	for node in ContentVBoxContainer.get_children() :
		if node.text == drug_pressed and ScrollValueDifference < 50:
			DrugInfo(node.text)
			%AnimationPlayer.play("OutTip")
			ScriptGlobal.get_node("ClickAudio").play()

func DrugInfo(drug_name) -> void:
	for DrugTexture in DrugsGlobal.get_children():
		if drug_name == DrugTexture.name:
			var trade_name :String = drug_name
			var picture :Texture2D = DrugTexture.get_texture()
			var alternatives :String = DrugsGlobal.alternatives_dictionary.get(drug_name)
			var generic_name :String = DrugsGlobal.generic_dictionary.get(drug_name)
			var data :String = DrugsGlobal.drugdata_dictionary.get(generic_name)
			%TipPanel/%TradeLabel.text = trade_name
			%TipPanel/%TradePicture.set_texture(picture)
			%TipPanel/%AlternativesText.text = alternatives
			%TipPanel/%DrugDataLabel.text = generic_name
			%TipPanel/%DrugDataText.text = data

func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScriptGlobal.get_node("BackAudio").play()
		%AnimationPlayer.play("Out")
func _on_back_button_button_down() -> void:
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("BackAudio").play()
	parent = get_parent()
	parent.get_node("DatabaseGlobal/VirtualKeyboard/SolvingPanel/VBoxContainer/LineEdit").clear()

func Showing_MainMenu() -> void:
	hide()
	ContentScrollContainer.set_v_scroll(0)
	var MainMenu :Node = get_parent().get_node("/root/MainMenu")
	var MainMenu_Anim :Node = get_parent().get_node("/root/MainMenu/AnimationPlayer")
	MainMenu.show()
	MainMenu_Anim.play("Load")

func Tween_Anim() -> void:
	var tween :Tween = create_tween().set_loops()
	tween.tween_property(%BackButton, "position:x", %BackButton.position.x+5, 0.5 )
	tween.tween_property(%BackButton, "position:x", %BackButton.position.x-5, 0.5 )
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Out" and get_parent().has_node("/root/MainMenu") and is_visible_in_tree():
		Showing_MainMenu()
		var focus_button :Node = get_parent().get_node("/root/MainMenu/MenuGridContainer/CaseSelectButton")
		focus_button.grab_focus()

	elif anim_name == "OutTip" and get_parent().has_node("/root/MainMenu") and is_visible_in_tree():
		%TipPanel/%AnimationPlayer.play("Load")

	elif anim_name == "Load":
		Tween_Anim()
