extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

const SPEED = 400
const JUMP_VELOCITY = -900

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if (velocity.x > 1) || (velocity.x < -1):
		animated_sprite_2d.animation = "Run"
	else:
		animated_sprite_2d.animation = "Idle"
	# Add the gravity.
	if not is_on_floor():
		animated_sprite_2d.animation = "Jump"
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or coyote_timer.time_left > 0.0):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
		
	var was_on_floor = is_on_floor()
	move_and_slide()
	var just_left_ledge = was_on_floor and is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		coyote_timer.start()
