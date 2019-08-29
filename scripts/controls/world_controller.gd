extends Control

onready var anim_player = $TransAnimations/AnimationPlayer
var previous_scene = "test"

func _ready() -> void:
	SignalManager.connect("change_scene", self, "_change_scene")
	print(("Previous Scene = %s") % previous_scene)
	
func _change_scene(to_scene) -> void:
	var packed_scene = load(to_scene)
	var instance = packed_scene.instance()
	
	# Change packed scene, pack it, then switch to it
	instance.previous_scene = self.filename
	packed_scene.pack(instance)
	
	anim_player.play("FadeToBlack")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(packed_scene)