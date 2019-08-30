extends Control

onready var anim_player = $TransAnimations/AnimationPlayer

func _ready() -> void:
	SignalManager.connect("change_scene", self, "_change_scene")
	if WorldState.previous_scene.size() < 1 or WorldState.previous_scene[-1] != self.filename:
		WorldState.previous_scene.append(self.filename)

	
func _change_scene(to_scene) -> void:
	var packed_scene = load(to_scene)
	#var instance = packed_scene.instance()
	# Change packed scene, pack it, then switch to it
	#packed_scene.pack(instance)
	
	anim_player.play("FadeToBlack")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(packed_scene)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and WorldState.previous_scene[0] != self.filename:
		WorldState.previous_scene.pop_back()
		_change_scene(WorldState.previous_scene[-1])