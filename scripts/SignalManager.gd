extends Node

# This node controls all signals that need to go between scenes.
# It will only control emitting signals. 
# The nodes that conenct to it will be responsible for handling the actions

signal change_scene(to_scene)
