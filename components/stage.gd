extends Node

var scenes: Array[String] = [
	"res://scenes/opening.tscn",
	"res://scenes/variables.tscn",
	"res://scenes/functions.tscn",
	"res://scenes/physics.tscn",
]
var idx: int

func go_to_next() -> void:
	idx += 1
	if idx < scenes.size(): get_tree().change_scene_to_file(scenes[idx])
