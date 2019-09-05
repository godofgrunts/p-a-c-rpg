extends Control

#------UI--------#
onready var dialogueText = $DialogueUI/DialogueText 
onready var dialoguePanel = $DialogueUI #Less rewritting if you want to move the script to another object
onready var dialogueName = $DialogueUI/DialogueName
onready var dialogueButtons = [$DialogueUI/Control/DialogueButton,$DialogueUI/Control/DialogueButton2,$DialogueUI/Control/DialogueButton3,$DialogueUI/Control/DialogueButton4]
onready var player = $Player
onready var npc = $NPC
onready var anim_player = $AnimationPlayer
onready var anim_npc = $AnimationNPC

func _ready():
# warning-ignore:return_value_discarded
	SignalManager.connect("dialogue_choice_next", self, "_on_dialogue_choice_next")
# warning-ignore:return_value_discarded
	SignalManager.connect("dialogue_conditional_data_needed", self, "_on_dialogue_conditional_data_needed")
# warning-ignore:return_value_discarded
	SignalManager.connect("dialogue_dialogue_ended", self, "_on_dialogue_dialogue_ended")
# warning-ignore:return_value_discarded
	SignalManager.connect("dialogue_dialogue_next", self, "_on_dialogue_dialogue_next")
# warning-ignore:return_value_discarded
	SignalManager.connect("dialogue_dialogue_started", self, "_on_dialogue_dialogue_started")

# Now we start the Dialogue Scene
# warning-ignore:unused_signal
	SignalManager.emit_signal("start_dialogue_scene")
	
func _on_dialogue_choice_next(ref, choices):
	pass
func _on_dialogue_conditional_data_needed():
	pass
func _on_dialogue_dialogue_ended():
	print("end")
	WorldState.previous_scene.pop_back()
	SignalManager.emit_signal("change_scene", WorldState.previous_scene[-1])

func _on_dialogue_dialogue_next(ref, actor, text):
	print(ref)
	print(actor)
	print(text)
func _on_dialogue_dialogue_started():
	pass