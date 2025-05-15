extends Node2D

@export var body: CharacterBody2D
@export var particle: GPUParticles2D
@export var speed: float

func _physics_process(delta: float) -> void:
	skew = remap(body.velocity.x, 0, speed, 0, deg_to_rad(-15))
	scale.y = remap(body.velocity.y, 0, speed, 1, 1.1)
	scale.x = remap(body.velocity.y, 0, speed, 1, .9)
	particle.emitting = !body.velocity.is_zero_approx()
