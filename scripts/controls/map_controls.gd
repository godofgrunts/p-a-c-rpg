extends Node2D

var previous_map = []
var current_map_name
onready var trans_anim = preload("res://scenes/transitions/FadeToBlack.tscn")

var pressed_escape = false

func _ready():
	current_map_name = get_child(0).filename

func goto_area(new_location_name, parent_location_scene):
	var area_name = "res://scenes/maps/%s.tscn" % new_location_name
	var next_area_resource = load(area_name)
	var next_area = next_area_resource.instance()
	
	if (pressed_escape):
		if previous_map.size() > 0:
			previous_map.pop_back()
		pressed_escape = false
	else:
		previous_map.append(parent_location_scene.name)
	
	
	var trans = trans_anim.instance()
	add_child(trans)
	var anim_name = get_child(0).name
	yield(trans, "half_way")
	remove_child(parent_location_scene)
	add_child(next_area)
	yield(trans, "animation_finished")
	remove_child(trans)
	
	current_map_name = get_child(0).filename
	
	print(previous_map)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and previous_map.size() > 0:
		print(previous_map[-1])
		pressed_escape = true
		goto_area(previous_map[-1], get_child(0))
			