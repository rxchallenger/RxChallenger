extends ColorRect
class_name ImageWeb

@export_group("Main")
@export var url :String = ""
@export var autoload_image: bool = false

@export_group("References")
@export var image_tr: TextureRect
@export var image_status: ImageStatus
@export var image_download_api: ImageDownloadAPI

signal image_loaded(texture: Texture2D)

func _ready() -> void:
	image_download_api.res_received.connect(_on_image_download_api_res_received)
	image_download_api.req_failed.connect(_on_image_download_api_req_failed)

	reset_ui()

	if autoload_image:
		download_image()


func reset_ui() -> void:
	image_tr.texture = null
	image_tr.visible = false
	image_status.hide_status()


func download_image() -> void:
	image_status.show_status("Downloading image...")
	image_download_api.download(url)


func _on_image_download_api_res_received(
	result: int,
	response_code: int,
	body: PackedByteArray,
	image_load_method: String
) -> void:

	if result != HTTPRequest.RESULT_SUCCESS or response_code != 200:
		return

	var image: Image = Image.new()

	var error: Error = FAILED

	if image_load_method != "":
		error = image.call(image_load_method, body)

	if error != OK:

		image_status.show_error(
			"Image cannot be loaded."
		)

		return


	image_status.hide_status()

	var texture := ImageTexture.create_from_image(
		image
	)

	image_tr.texture = texture

	image_tr.visible = true


	# ADD THIS

	image_loaded.emit(texture)




func _on_image_download_api_req_failed() -> void:
	image_tr.texture = null
	image_tr.visible = false
	image_status.show_error("Unable to make request.")
