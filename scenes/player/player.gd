extends CharacterBody2D

##################################################
const MOVING_SPEED = 300.0

##################################################
func _ready() -> void:
	add_to_group("Player")

##################################################
func _physics_process(delta: float) -> void:
	var hor_direction = Input.get_axis("ui_left", "ui_right")
	if hor_direction:
		velocity.x = hor_direction * MOVING_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVING_SPEED)

	var ver_direction = Input.get_axis("ui_up", "ui_down")
	if ver_direction:
		velocity.y = ver_direction * MOVING_SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, MOVING_SPEED)
	
	move_and_slide()
