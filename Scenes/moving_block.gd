extends CharacterBody2D


const SPEED = 350

# Get the gravity from the project settings to be synced with RigidBody nodes.
var player

var run_away = false


@onready var collision_shape_2d = $CollisionShape2D

func _physics_process(delta):
	if run_away:
		if self.position.x < 3264:
			var direction = (player.position - self.position).normalized()
			velocity.x = -direction.x * SPEED
		else:
			collision_shape_2d.disabled = true
			velocity.x = 0
			velocity.y = 600
			if self.position.y > 700:
				self.queue_free()	
	else:
		velocity.x = 0
		
	move_and_slide()





func _on_player_detection_body_entered(body):
	if body.name == "MainCharacter":
		player = body
		run_away = true


func _on_player_detection_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == "MainCharacter":
		run_away = false
