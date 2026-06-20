extends Control

#region Declaration
var ScenePath :String
var home_icon = preload("res://assets/icons/home.webp")
@onready var DrugButtons_Nodes :Array[Node] = get_tree().get_nodes_in_group("DrugButtons")
@onready var DrugLetterButtons_Nodes :Array[Node] = get_tree().get_nodes_in_group("DrugLetterButtons")
@onready var AltTexture_Nodes :Array[Node] = get_tree().get_nodes_in_group("AltTextures")
@onready var HideTexture_Nodes :Array[Node] = get_tree().get_nodes_in_group("HideTextures")
@export var TipPanel :Node
@export var LineEdit_Node :LineEdit
@export var Clinical_Node : Node
var DrugButtonsTextArray : Array
var current_score :int
var target_score :int
var rewarded_ad : RewardedAd
var rewarded_ad_load_callback := RewardedAdLoadCallback.new()
var zoom_min :Vector2 = Vector2(1.00001,1.00001)
var zoom_max :Vector2 = Vector2(1.3000001,1.3000001)
var zoom_speed :Vector2 = Vector2(0.15,0.15)
var desired_zoom : Vector2 = Vector2(1.00001,1.00001)
var events = {}
#endregion

#region Image Download
const  ImageWeb_scene = preload("res://image_web/image_web.tscn")
#endregion


func _enter_tree() -> void:
	%AnimationPlayer.play("Load")
	%CaseMarginContainer/%Label.text = "Case "+self.name+" - "+%CaseMarginContainer/%Speciality.text
	ScriptGlobal.answer_signal.connect(Solve)
	ScriptGlobal.current_text.connect(CheckLineEdit)
func _process(_delta: float) -> void:
	%ToolsPanel/%CDLabel.text = "%02d:%02d" % Time_Left()
	$Camera2D.zoom = lerp($Camera2D.zoom, desired_zoom, 0.15)
	#%ToolsPanel/%CDTimer.set_wait_time(0.01)


func _ready() -> void:
	await get_tree().process_frame
	ScriptGlobal.current_case = str_to_var(self.name)
	ScriptGlobal.current_scene = get_tree().current_scene
	print("Current Scene:",ScriptGlobal.current_scene)
	Score_Logic()
	DrugButton_Nodes_Logic()
	DrugLetterButtons_Nodes_Logic()
	AltTexture_Nodes_Logic()
	HideTexture_Nodes_Logic()
	HideTexture_Nodes_Visibility("hide")
	AltTexture_Nodes_Visibility("show")
	LineEdit_Node.grab_focus()
	GoNextButton_Logic()
	#%ToolsPanel/%CDTimer.set_wait_time(0.1)
	%ToolsPanel/%CDTimer.start()
	_SignalsConnect()
	#_LoadWebImages()

	#Hiding and Disabling Solved Button
	_HelpButton(true,Color(1,1,1,0))
	#Hiding and Disabling Solved Button
	_SolvedButton(true,Color(1,1,1,0))

	_on_load_banner_pressed()
	_on_load_interstitial_pressed()
	rewarded_ad_load_callback.on_ad_failed_to_load = on_rewarded_ad_failed_to_load
	rewarded_ad_load_callback.on_ad_loaded = on_rewarded_ad_loaded



func _SignalsConnect()->void:
	%ToolsPanel/%CDTimer.timeout.connect(_on_cd_timer_timeout)
	%ToolsPanel/%HistoryButton.button_down.connect(_on_history_button_button_down)
	%ToolsPanel/%ComplaintButton.button_down.connect(_on_complaint_button_button_down)
	%ToolsPanel/%DiagnosisButton.button_down.connect(_on_diagnosis_button_button_down)
	%ToolsPanel/%LabButton.button_down.connect(_on_lab_button_button_down)
	%ToolsPanel/%InteractionButton.button_down.connect(_on_interaction_button_button_down)
	%ToolsPanel/%SolvedButton.button_down.connect(_on_solved_button_button_down)
	%ToolsPanel/%HelpButton.button_down.connect(_on_help_button_button_down)
	pass

func _SolvedButton(boolean:bool,colour:Color) ->void:
	%ToolsPanel/%SolvedButton.set_modulate(colour)
	%ToolsPanel/%SolvedButton.set_disabled(boolean)

func _HelpButton(boolean:bool,colour:Color) ->void:
	%ToolsPanel/%HelpButton.set_modulate(colour)
	%ToolsPanel/%HelpButton.set_disabled(boolean)


#region Admob
func _on_load_banner_pressed() -> void:
	var unit_id : String
	if OS.get_name() == "Android":
		unit_id = "ca-app-pub-3213953831362227/4065942055"
		#Google's = "ca-app-pub-3940256099942544/6300978111"
		#Mine = "ca-app-pub-3213953831362227/4065942055"
	elif OS.get_name() == "iOS":
		unit_id = "ca-app-pub-3940256099942544/2934735716"
		#Google's = "ca-app-pub-3940256099942544/2934735716"
	var ad_view := AdView.new(unit_id, AdSize.LEADERBOARD, AdPosition.Values.TOP)
	ad_view.load_ad(AdRequest.new())
func _on_load_interstitial_pressed() -> void:
	var unit_id : String
	if OS.get_name() == "Android":
		unit_id = "ca-app-pub-3213953831362227/8327570866"
		#Google's = "ca-app-pub-3940256099942544/5224354917"
		#Mine = "ca-app-pub-3213953831362227/8327570866"
	elif OS.get_name() == "iOS":
		unit_id = "ca-app-pub-3940256099942544/1712485313"
		#Google's = "ca-app-pub-3940256099942544/1712485313"

	RewardedAdLoader.new().load(unit_id, AdRequest.new(), rewarded_ad_load_callback)
func on_rewarded_ad_failed_to_load(adError : LoadAdError) -> void:
	print(adError.message)
@warning_ignore("shadowed_variable")
func on_rewarded_ad_loaded(rewarded_ad : RewardedAd) -> void:
	self.rewarded_ad = rewarded_ad
func _on_show_pressed():
	if rewarded_ad:
		rewarded_ad.show()
#endregion


func Time_Left() -> Array:
	var time_left = %ToolsPanel/%CDTimer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
func _on_cd_timer_timeout() -> void:
	_on_load_interstitial_pressed()
	_HelpButton(false,Color(1,1,1,1))
func Score_Logic() -> void:
	for DrugButtons_Node in DrugButtons_Nodes:
		target_score +=1
	%CaseMarginContainer/%Score.text = var_to_str(current_score)+"/"+var_to_str(target_score)
func DrugButton_Nodes_Logic() -> void:

	for DrugButtons_Node in DrugButtons_Nodes:
		DrugButtons_Node.hide()
		var DrugButtons_Clicked :Array
		DrugButtons_Clicked.append(DrugButtons_Node.text)
		DrugButtons_Clicked.append(DrugButtons_Node)
		DrugButtons_Node.connect('button_down', Show_Tip_Pannel.bindv(DrugButtons_Clicked))
		print(DrugButtons_Node.text)



func DrugLetterButtons_Nodes_Logic() -> void:
	var N_Of_Drugs :int = 1
	for DrugButtons_Node in DrugButtons_Nodes:
		DrugButtonsTextArray.append(DrugButtons_Node.text)
		var DrugLetterCount = get_node("CaseMarginContainer/Panel/ContentControl/DrugLetterCount%s"%str(N_Of_Drugs))
		DrugLetterCount.text = str(DrugButtons_Node.text.length())
		N_Of_Drugs +=1
func AltTexture_Nodes_Logic() -> void:
	var N_Of_Drugs :int = 1
	for AltTexture_Node in AltTexture_Nodes:
		var DrugButton_Node = get_node("CaseMarginContainer/Panel/ContentControl/Drug%s"%str(N_Of_Drugs))
		var AltTexture_Clicked :Array
		AltTexture_Clicked.append(DrugButton_Node.text)
		AltTexture_Clicked.append(AltTexture_Node)
		AltTexture_Node.connect('button_down', Show_Tip_Pannel.bindv(AltTexture_Clicked))
		N_Of_Drugs +=1
func HideTexture_Nodes_Logic() -> void:
	var N_Of_Drugs :int = 1
	for DrugButtons_Node in DrugButtons_Nodes:
		var HideDrug = get_node("CaseMarginContainer/Panel/ContentControl/HideDrug%s"%str(N_Of_Drugs))
		HideDrug.connect('button_down', Drug_Visibility.bind(DrugButtons_Node))
		N_Of_Drugs +=1
func HideTexture_Nodes_Visibility(visibility :String) -> void:
	for HideTexture_Node in HideTexture_Nodes:
		if visibility == "show":
			HideTexture_Node.show()
		elif visibility == "hide":
			HideTexture_Node.hide()
func AltTexture_Nodes_Visibility(visibility :String) -> void:
	for AltTexture_Node in AltTexture_Nodes:
		if visibility == "show":
			AltTexture_Node.show()
		elif visibility == "hide":
			AltTexture_Node.hide()
func Drug_Visibility(DrugButtons_Node :Node) ->void:
	ScriptGlobal.get_node("ClickAudio").play()
	if DrugButtons_Node.is_visible_in_tree():
		DrugButtons_Node.hide()
	else:
		DrugButtons_Node.show()
func Show_Tip_Pannel(Trade :String, node :Node):
	ScriptGlobal.get_node("ClickAudio").play()
	if node is Button:
		%TipPanel/%TradeMarginContainer.show()
		%TipPanel/%AlternativesMarginContainer.show()
	elif node is TextureButton:
		%TipPanel/%TradeMarginContainer.hide()
		%TipPanel/%AlternativesMarginContainer.hide()
	for DrugTexture in DrugsGlobal.get_children():
		if Trade == DrugTexture.name:
			var trade_name :String = Trade
			#var picture :Texture2D = DrugTexture.get_texture()
			var alternatives :String = DrugsGlobal.alternatives_dictionary.get(Trade)
			var generic_name :String = DrugsGlobal.generic_dictionary.get(Trade)
			var data :String = DrugsGlobal.drugdata_dictionary.get(generic_name)
			%TipPanel/%TradeLabel.text = trade_name
			#%TipPanel/%TradePicture.set_texture(picture)
			%TipPanel/%AlternativesText.text = alternatives
			%TipPanel/%DrugDataLabel.text = generic_name
			%TipPanel/%DrugDataText.text = data

			var base_url :String = "https://raw.githubusercontent.com/rxchallenger/RxChallenger/main/"
			var image_url :String
			var url_drug = Trade.to_lower()
			image_url = base_url + url_drug + ".webp"
			var ImageWeb_instance = ImageWeb_scene.instantiate()
			add_child(ImageWeb_instance)
			ImageWeb_instance.url = image_url
			print(ImageWeb_instance.url)
			ImageWeb_instance.image_loaded.connect(func(texture):
				%TipPanel/%TradePicture.texture = texture)
			ImageWeb_instance.download_image()

	TipPanel.get_node("AnimationPlayer").play("Load")


func CheckLineEdit(current_text :String) -> void:
	if current_text in DrugButtonsTextArray:
		Solve(current_text)
		%VirtualKeyboard/%LineEdit.clear()
func Solve(answer :String) -> void:
	if answer != "":
		var loop :int = 1
		for DrugButtons_Node in DrugButtons_Nodes:
			if answer == DrugButtons_Node.text:
				DrugButtons_Node.show()
				DrugButtons_Node.emit_signal("button_down")
				var AltTexture_Node = get_node("CaseMarginContainer/Panel/ContentControl/Alt%s"%str(loop))
				if AltTexture_Node.is_visible_in_tree():
					ScriptGlobal.get_node("CorrectAudio").play()
					current_score += 1
					Update_Score()
					AltTexture_Node.hide()
					Win()
				var HideDrug_Node = get_node("CaseMarginContainer/Panel/ContentControl/HideDrug%s"%str(loop))
				HideDrug_Node.show()
			loop += 1

		if DrugButtonsTextArray.has(answer) == false:
			ScriptGlobal.get_node("WrongAudio").play()
func Update_Score() -> void:
	%CaseMarginContainer/%Score.text = var_to_str(current_score)+"/"+var_to_str(target_score)
func Win() -> void:
	if current_score == target_score:
		ScriptGlobal.get_node("SuccessAudio").play()
		for DrugButtons_Node in DrugButtons_Nodes:
			DrugButtons_Node.show()
		%CaseMarginContainer/%CPUParticles2D.set_emitting(true)
		%ToolsPanel/%CDTimer.stop()
		if ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn"):
			if ScriptGlobal.current_case+1 > ScriptGlobal.unlocked_cases and ScriptGlobal.total_cases>ScriptGlobal.current_case:
				ScriptGlobal.unlocked_cases = ScriptGlobal.current_case + 1
			ScriptGlobal.score = ScriptGlobal.unlocked_cases*100
			ScriptGlobal.save_data()
			if SilentWolf.Auth.logged_in_player:
				ScriptGlobal.cloud_save()
				var sw_result = await SilentWolf.Scores.get_top_score_by_player(SilentWolf.Auth.logged_in_player).sw_top_player_score_complete
				var ldboard_name = "main"
				var metadata = {"name": OS.get_name(),
				"unique_id": OS.get_unique_id(),
				"processor_count": OS.get_processor_count(),
				"model_name": OS.get_model_name()
				}
				if sw_result.has("top_score") && ScriptGlobal.score>sw_result.top_score.get("score"):
					print("top_score : ", sw_result.top_score.get("score"))
					SilentWolf.Scores.save_score(SilentWolf.Auth.logged_in_player, ScriptGlobal.score, ldboard_name, metadata)
					print("The player have top_score")
				elif sw_result.has("top_score") == false:
					SilentWolf.Scores.save_score(SilentWolf.Auth.logged_in_player, ScriptGlobal.score, ldboard_name, metadata)
					print("The player does not have top_score")
				else:
					print("score is either the same or lower")
	GoNextButton_Logic()
func _on_win_timer_timeout() -> void:
	if current_score == target_score:
		%CaseMarginContainer/%CPUParticles2D.set_emitting(true)
func GoNextButton_Logic() -> void:
	if ScriptGlobal.unlocked_cases > ScriptGlobal.current_case and \
	ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn"):
		%CaseMarginContainer/%NextButton.modulate.a = 1.0
		%CaseMarginContainer/%NextButton.disabled = false
	elif ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn"):
		%CaseMarginContainer/%NextButton.modulate.a = 0.0
		%CaseMarginContainer/%NextButton.disabled = true
	if ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn")\
	and ScriptGlobal.total_cases == ScriptGlobal.current_case:
		%CaseMarginContainer/%NextButton.modulate.a = 1.0
		%CaseMarginContainer/%NextButton.disabled = false
		%CaseMarginContainer/%NextButton.set_texture_normal(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_disabled(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_hover(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_focused(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_pressed(home_icon)
	if ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn") == false:
		%CaseMarginContainer/%NextButton.modulate.a = 1.0
		%CaseMarginContainer/%NextButton.disabled = false
		%CaseMarginContainer/%NextButton.set_texture_normal(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_disabled(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_hover(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_focused(home_icon)
		%CaseMarginContainer/%NextButton.set_texture_pressed(home_icon)
func _on_next_button_button_down() -> void:
	if ResourceLoader.exists("res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn")\
	and ScriptGlobal.total_cases > ScriptGlobal.current_case:
		ScenePath = "res://case_select/cases/" + var_to_str(ScriptGlobal.current_case+1)+".tscn"
		%AnimationPlayer.play("Out")
		ScriptGlobal.get_node("LoadingInAudio").play()
	else:
		ScenePath = "res://case_select/case_select.tscn"
		%AnimationPlayer.play("Out")
		ScriptGlobal.get_node("LoadingInAudio").play()
func AutoLoadNextLevel() -> void:
	await get_tree().create_timer(3.0).timeout
	_on_next_button_button_down()

func _input(event) -> void:
	if event is InputEventKey and Input.is_action_just_pressed("ui_cancel") and not event.echo:
		_notification(self.NOTIFICATION_WM_GO_BACK_REQUEST)
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if desired_zoom > zoom_min:
					desired_zoom -= zoom_speed
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if  desired_zoom < zoom_max:
					desired_zoom += zoom_speed
					$CameraTimer.start()
	if event is InputEventScreenTouch:
		if event.pressed:
			events[event.index] = event.position
		else:
			events.erase(event.index)
		if events.size() == 1 or events.size() == 0 or event.size() == null:
			desired_zoom = Vector2(1.00001,1.00001)
	if event is InputEventScreenDrag:
		if events.size() == 2:
			if  desired_zoom < zoom_max:
				desired_zoom += zoom_speed
		if events.size() == 1 or events.size() == 0 or event.size() == null:
			$CameraTimer.start()
func _on_camera_timer_timeout() -> void:
	if desired_zoom > zoom_min:
		desired_zoom = Vector2(1.00001,1.00001)

func _notification(what) -> void:
	if what == self.NOTIFICATION_WM_GO_BACK_REQUEST:
		ScenePath = "res://case_select/case_select.tscn"
		%AnimationPlayer.play("Out")
		ScriptGlobal.get_node("LoadingOutAudio").play()
func _on_back_button_button_down() -> void:
	ScenePath = "res://case_select/case_select.tscn"
	%AnimationPlayer.play("Out")
	ScriptGlobal.get_node("LoadingOutAudio").play()

func Tween_Anim() -> void:
	var tween :Tween = create_tween().set_loops()
	tween.tween_property(%CaseMarginContainer/%BackButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%CaseMarginContainer/%BackButton, "position:x", position.x-10, 0.5 ).as_relative()
	tween.tween_property(%CaseMarginContainer/%NextButton, "position:x", position.x+10, 0.5 ).as_relative()
	tween.tween_property(%CaseMarginContainer/%NextButton, "position:x", position.x-10, 0.5 ).as_relative()
	for button_nodes in $ToolsPanel/VBoxContainer/HBoxContainer.get_children():
		tween.tween_property(button_nodes, "position:x", position.x+10, 0.5 ).as_relative()
		tween.tween_property(button_nodes, "position:x", position.x-10, 0.5 ).as_relative()
		tween.tween_property(button_nodes, "position:x", position.x+10, 0.5 ).as_relative()
		tween.tween_property(button_nodes, "position:x", position.x-10, 0.5 ).as_relative()
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"Out": get_tree().change_scene_to_file(ScenePath)
		"Load": Tween_Anim()
func _on_tree_exiting() -> void:
	ScriptGlobal.previous_scene = get_tree().current_scene.name
	print("Previous Scene :",ScriptGlobal.previous_scene)

func _on_history_button_button_down() -> void:
	%Clinical.show()
	$Clinical/%Button.grab_focus()
	ScriptGlobal.get_node("ClickAudio").play()
	%Clinical/%Label.text = "Patient History"
	%Clinical/%RichTextLabel.text = %Clinical.history_dic.get(ScriptGlobal.current_case)
	%Clinical/%TextureRect.texture = %ToolsPanel/%HistoryButton.texture_normal
func _on_complaint_button_button_down() -> void:
	%Clinical.show()
	$Clinical/%Button.grab_focus()
	ScriptGlobal.get_node("ClickAudio").play()
	%Clinical/%Label.text = "Chief Complaint"
	%Clinical/%RichTextLabel.text = %Clinical.complaint_dic.get(ScriptGlobal.current_case)
	%Clinical/%TextureRect.texture = %ToolsPanel/%ComplaintButton.texture_normal
func _on_diagnosis_button_button_down() -> void:
	%Clinical.show()
	$Clinical/%Button.grab_focus()
	ScriptGlobal.get_node("ClickAudio").play()
	%Clinical/%Label.text = "Diagnosis"
	%Clinical/%RichTextLabel.text = %Clinical.diagnosis_dic.get(ScriptGlobal.current_case)
	%Clinical/%TextureRect.texture = %ToolsPanel/%DiagnosisButton.texture_normal
func _on_lab_button_button_down() -> void:
	%Clinical.show()
	$Clinical/%Button.grab_focus()
	ScriptGlobal.get_node("ClickAudio").play()
	%Clinical/%Label.text = "Laboratory Values"
	%Clinical/%RichTextLabel.text = %Clinical.lab_dic.get(ScriptGlobal.current_case)
	%Clinical/%TextureRect.texture = %ToolsPanel/%LabButton.texture_normal
func _on_interaction_button_button_down() -> void:
	%Clinical.show()
	$Clinical/%Button.grab_focus()
	ScriptGlobal.get_node("ClickAudio").play()
	%Clinical/%Label.text = "Drug Interactions"
	%Clinical/%RichTextLabel.text = %Clinical.interaction_dic.get(ScriptGlobal.current_case)
	%Clinical/%TextureRect.texture = %ToolsPanel/%InteractionButton.texture_normal


#region Help
func _on_help_button_button_down() -> void:
	var loop :int = 1
	for x in range(DrugButtons_Nodes.size()):
		var HideDrug_Node = get_node("CaseMarginContainer/Panel/ContentControl/HideDrug%s"%str(loop))
		if x<DrugButtons_Nodes.size() && DrugButtons_Nodes[x].is_visible() == false && HideDrug_Node.is_visible() == false:
			Solve(DrugButtons_Nodes[x].text)
			%ToolsPanel/%CDTimer.start()
			_HelpButton(true,Color(1,1,1,0))
			_on_show_pressed()
			if OS.get_name() == "Android" or OS.get_name() == "iOS":
				DisplayServer.virtual_keyboard_hide()
			break
		else:
			x += 1
			loop +=1
func _on_solved_button_button_down() -> void:
	for DrugButtons_Node in DrugButtons_Nodes:
		Solve(DrugButtons_Node.text)
		TipPanel.hide()
#endregion
