class_name Player extends CharacterBody2D

static var node: Player

@export var speed: float
@export var accel: float
@export var decel: float

@onready var gpu_star: GPUParticles2D = $GPUParticles2D
@onready var gpu_smoke: GPUParticles2D = $GPUParticles2D2

func _ready() -> void:
	node = self

func _physics_process(delta: float) -> void:
	var input = Input.get_vector(&"left",&"right",&"up",&"down")
	if input:
		velocity = velocity.move_toward(input * speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2(), decel * delta)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group(&"hurtbox"):
		gpu_star.global_position = area.global_position.lerp(global_position, 0.5)
		gpu_star.restart()
		gpu_smoke.global_position = gpu_star.global_position
		gpu_smoke.restart()
		velocity = area.global_position.direction_to(global_position) * speed * 1.5
