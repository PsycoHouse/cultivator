extends AnimatedSprite2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
const SPEED := 160.0

func _physics_process(delta: float) -> void:
	var dir := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity = dir * SPEED
	move_and_slide()

	_play_anim(dir)

func _play_anim(dir: Vector2) -> void:
	if dir == Vector2.ZERO:
		sprite.flip_h = false
		if sprite.animation != "front":
			sprite.play("front")
		return

	# Horizontal
	if abs(dir.x) > abs(dir.y):
		sprite.flip_h = dir.x < 0
		if sprite.animation != "right":
			sprite.play("right")
		return
