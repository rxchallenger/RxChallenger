extends Control

var previous_scene : String
var current_scene :Node

var screen_size :Vector2i = DisplayServer.window_get_size()
var screen_size_x :float = DisplayServer.window_get_size().x
var screen_size_y :float = DisplayServer.window_get_size().y

const SAVE_FILE :String = "user://save_file.save"
var total_cases :int = 160
var unlocked_cases :int
var current_case :int
var player_data : Dictionary
var score :int
var master_bus = AudioServer.get_bus_index("Master")
var bus_mute_state : bool

@warning_ignore("unused_signal")
signal answer_signal
@warning_ignore("unused_signal")
signal current_text

var ByteBrew

func save_data() -> void:
	var file :FileAccess = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(total_cases)
	file.store_var(unlocked_cases)
	file.store_var(current_case)
	file.store_var(score)
	file.store_var(bus_mute_state)
	file.close()
func load_data() -> void:
	if FileAccess.file_exists(SAVE_FILE):
		var file :FileAccess = FileAccess.open(SAVE_FILE, FileAccess.READ)
		total_cases = file.get_var()
		unlocked_cases = file.get_var()
		current_case = file.get_var()
		score = file.get_var()
		bus_mute_state = file.get_var()
		file.close()
	if bus_mute_state == true:
		AudioServer.set_bus_mute(master_bus,true)
	if bus_mute_state == false:
		AudioServer.set_bus_mute(master_bus,false)
	if FileAccess.file_exists(SAVE_FILE) == false:
		initialize_data()
func cloud_save() -> void:
	if SilentWolf.Auth.logged_in_player:
		player_data = {
		"total_cases" = total_cases,
		"unlocked_cases" = unlocked_cases,
		"current_case" = current_case,
		"score" = score
		}
		var sw_result = await SilentWolf.Players.save_player_data(SilentWolf.Auth.logged_in_player, player_data).sw_save_player_data_complete
		print("Cloud Save success" if sw_result and sw_result.success else "Cloud Save failed")
func cloud_load() -> void:
	if SilentWolf.Auth.logged_in_player:
		var sw_result = await SilentWolf.Players.get_player_data(SilentWolf.Auth.logged_in_player).sw_get_player_data_complete
		print("Cloud Player data: " + str(sw_result.player_data))
		if sw_result and sw_result.success and sw_result.player_data:
			total_cases = sw_result.player_data.get("total_cases")
			unlocked_cases = sw_result.player_data.get("unlocked_cases")
			current_case = sw_result.player_data.get("current_case")
			score = sw_result.player_data.get("score")
		else:
			print("Cloud Load failed")
			initialize_data()
func initialize_data() -> void:
	total_cases = 160
	unlocked_cases = 1
	current_case = 1
	score = 0
	player_data = {
		"total_cases" = 160,
		"unlocked_cases" = 1,
		"current_case" = 1,
		"score" = 0
	}
	if SilentWolf.Auth.logged_in_player:
		var sw_result = await SilentWolf.Players.save_player_data(SilentWolf.Auth.logged_in_player, player_data).sw_save_player_data_complete
		print("Cloud Save success" if sw_result and sw_result.success else "Cloud Save failed")
func _ready() -> void:
	RenderingServer.set_default_clear_color(Color(255,255,255,255))
	load_data()
	SilentWolf.configure({
	"api_key": "kGNDcndCm8yzUmmUrSgG6wxCzhS83xi3ibIMfyw7",
	"game_id": "rxchallenger",
	"log_level": 0})
	SilentWolf.auth_config.redirect_to_scene = "res://main_menu/main_menu.tscn"
	SilentWolf.scores_config.open_scene_on_close = "res://main_menu/main_menu.tscn"
	SilentWolf.Auth.auto_login_player()
	cloud_load()
	MobileAds.initialize()
	DisplayServer.window_set_size(Vector2(576,1024))
	if Engine.has_singleton("ByteBrew"):
		ByteBrew = Engine.get_singleton("ByteBrew")
		if OS.get_name() == "Android":
			ByteBrew.InitializeByteBrew("6KvEdEgZf", "4mVH2zNDdoWgbL+v/jmQCYbL+Jv7nQbZbW2Htmto0H1RMFfVec5VVAWgyHaTnsRX", Engine.get_version_info(), "0.0.1")
			ByteBrew.StartPushNotifications()
		elif OS.get_name() == "iOS":
			pass
