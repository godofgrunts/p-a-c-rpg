extends Node

# This node controls all signals that need to go between scenes.
# It will only control emitting signals. 
# The nodes that conenct to it will be responsible for handling the actions

# warning-ignore:unused_signal
signal change_scene(to_scene)


# Dialogue Manager Signals
# warning-ignore:unused_signal
signal start_dialogue_scene()
# warning-ignore:unused_signal
signal dialogue_choice_next(ref, choices)
# warning-ignore:unused_signal
signal dialogue_conditional_data_needed()
# warning-ignore:unused_signal
signal dialogue_dialogue_ended()
# warning-ignore:unused_signal
signal dialogue_dialogue_next(ref,actor,text)
# warning-ignore:unused_signal
signal dialogue_dialogue_started()