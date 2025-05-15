extends Node

var scenes: Array[String] = [
	"res://scenes/opening.tscn",
	"res://scenes/variables.tscn",
	"res://scenes/functions.tscn",
	"res://scenes/physics.tscn",
	"res://scenes/example_move_text.tscn",
	"res://scenes/example_move_play.tscn",
	"res://scenes/example_drift_text.tscn",
	"res://scenes/example_drift_play.tscn",
	"res://scenes/example_accelerate_text.tscn",
	"res://scenes/example_accelerate_play.tscn",
	"res://scenes/example_bounce_text.tscn",
	"res://scenes/example_bounce_play.tscn",
	"res://scenes/how_to_learn.tscn",
	"res://scenes/final_speed_test.tscn"
]
var idx: int

func go_to_next() -> void:
	idx += 1
	if idx < scenes.size(): get_tree().change_scene_to_file(scenes[idx])
