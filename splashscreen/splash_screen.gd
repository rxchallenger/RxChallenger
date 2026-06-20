extends Control

func _ready() -> void:
	ScriptGlobal.current_scene = get_tree().current_scene
	BgGlobal.hide()
	print("Current Scene :",ScriptGlobal.current_scene)
	# Check if the current operating system is Windows
	if OS.get_name() == "Windows":
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)


func _on_splash_ap_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"rx_animation" : get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")

func _on_tree_exiting() -> void:
	ScriptGlobal.previous_scene = get_tree().current_scene.name
	print("Previous Scene :",ScriptGlobal.previous_scene)
