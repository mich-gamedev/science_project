class_name Enemy extends CharacterBody2D

enum Stages {NONE, WALK_TOWARD, DRIFT, DRIFT_ACCELERATE, BOUNCE, DRIFT_BOUNCE}

@onready var player := Player.node

@export var speed: float
@export var accel: float
@export var stage: Stages

func _ready() -> void:
	if stage == Stages.BOUNCE:
		velocity = Vector2.from_angle(PI/4) * speed

func _physics_process(delta: float) -> void:
	match stage:
		Stages.WALK_TOWARD:
			var direction = position.direction_to(player.position)
			velocity = direction * speed
			move_and_slide()
		Stages.DRIFT:
			var direction = position.direction_to(player.position).rotated(deg_to_rad(90))
			velocity = direction * speed
			move_and_slide()
		Stages.DRIFT_ACCELERATE:
			var direction = position.direction_to(player.position).rotated(deg_to_rad(45))
			velocity = velocity.move_toward(direction * speed, accel * delta)
			move_and_slide()
		Stages.BOUNCE:
			var coll = move_and_collide(velocity * delta)
			if coll:
				velocity = velocity.bounce(coll.get_normal())
		Stages.DRIFT_BOUNCE:
			var direction = position.direction_to(player.position).rotated(deg_to_rad(45))
			velocity = velocity.move_toward(direction * speed, accel * delta)
			var coll = move_and_collide(velocity * delta)
			if coll:
				velocity = velocity.bounce(coll.get_normal())
