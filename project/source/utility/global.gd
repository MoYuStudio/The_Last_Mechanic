
extends Node

var fullscreen = true

var night_node = true

var window_mode_list = [DisplayServer.WINDOW_MODE_WINDOWED,
						DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN,
						DisplayServer.WINDOW_MODE_FULLSCREEN,
						DisplayServer.WINDOW_MODE_MINIMIZED,
						DisplayServer.WINDOW_MODE_MAXIMIZED
						]
var window_size_list = [[1920,1080],[1280,720],[360,180]]

var window_vsync_mode_list = []

var save_dict = {
	
		'window_mode':0,
		'window_size':0,
		'window_vsync_mode':0,
		
	}

func _ready():

	DisplayServer.window_set_title("花生迷途 Peanut's Journey")
	
	# print(DisplayServer.window_get_vsync_mode(0))
	# DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	# print(DisplayServer.window_get_vsync_mode(0))
	
	DisplayServer.window_set_size(Vector2(1280,720))
	DisplayServer.window_set_position(Vector2(100,100))
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	# DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
	
	# save_data('game_save',save_dict)
	# print(load_data('game_save'))
	
	pass

func _physics_process(delta):
	# print(Engine.get_frames_per_second())
	pass
	
func save_data(slot_name,data):
	var file = FileAccess.open('res://source/data/'+str(slot_name)+'.moyudata', FileAccess.WRITE)
	var json_str = JSON.stringify(data)
	file.store_line(json_str)
	
func load_data(slot_name):
	var path = 'res://source/data/'+str(slot_name)+'.moyudata'
	var data = {}
	if not FileAccess.file_exists(path):
		return
	var file = FileAccess.open(path, FileAccess.READ)
	while file.get_position() < file.get_length():
		var json_str = file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_str)
		data = json.get_data()
	return data

func setting_set():
	DisplayServer.window_set_mode(window_mode_list[save_dict['window_mode']])
	DisplayServer.window_set_size(Vector2(window_size_list[save_dict['window_size']][0],window_size_list[save_dict['window_size']][1]))
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
