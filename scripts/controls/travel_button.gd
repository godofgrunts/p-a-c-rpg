extends Button

export (String, FILE, "*.tscn") var SceneToGoTo

func _ready() -> void:
	self.connect("pressed", self, "_change_scene_emitter")
	
func _change_scene_emitter():
	SignalManager.emit_signal("change_scene", SceneToGoTo)