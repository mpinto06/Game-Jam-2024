extends CharacterBody2D


const SPEED = 200
var chase = false
var player
const JUMP_VELOCITY = -900
@onready var collision_shape_2d = $CollisionShape2D
@onready var animated_sprite_2d = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity.y += gravity * delta
	if chase and animated_sprite_2d.animation != "Death":
		animated_sprite_2d.animation = "Run"
		print(animated_sprite_2d.animation)
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			animated_sprite_2d.flip_h = true
		elif direction.x < 0:
			animated_sprite_2d.flip_h = false
		velocity.x = direction.x * SPEED
	elif not chase and animated_sprite_2d.animation != "Death":
		animated_sprite_2d.animation = "Idle"
		velocity.x = 0
	if self.is_on_wall():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
	
	


func _on_player_detection_body_entered(body):
	if body.name == "MainCharacter":
		player = body
		chase = true
		


func _on_player_detection_body_exited(body):
	if body.name == "MainCharacter":
		chase = false


func _on_player_above_body_entered(body):
	if body.name == "MainCharacter":
		body.jump()
		self.queue_free()



func _on_player_collision_body_entered(body):
	if body.name == "MainCharacter":
		if body.has_method("die"):
			body.die()
