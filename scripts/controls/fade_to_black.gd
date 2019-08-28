extends AnimationPlayer

signal half_way

func _ready():
	pass

func _on_Half_Animation_Finshed():
	print("hey look it worked")
	emit_signal("half_way")
