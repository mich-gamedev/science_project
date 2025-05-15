class_name Player extends CharacterBody2D

static var node: Player

@export var speed: float
@export var accel: float
@export var decel: float

func _ready() -> void:
	node = self

func _physics_process(delta: float) -> void:
	var input = Input.get_vector(&"left",&"right",&"up",&"down")
	if input:
		velocity = velocity.move_toward(input * speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2(), decel * delta)
	move_and_slide()
