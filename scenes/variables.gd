extends Node2D

@export_multiline var list: PackedStringArray
@export var label: RichTextLabel

var idx: int

func _ready() -> void:
	print('test')
	if label: label.text = list[idx]

func _input(event: InputEvent) -> void:
	print("input found")
	if event.is_action_pressed(&"continue"):
		idx += 1
		if idx >= list.size() or !label:
			Stage.go_to_next()
		else:
			label.text = list[idx]
	elif event.is_action_pressed(&"go_back"):
		idx -= 1
		label.text = list[idx]
