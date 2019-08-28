extends Button

onready var game = get_tree().get_root().get_node("Game")
	
func _pressed():
	game.goto_area(self.name, get_parent().get_parent())