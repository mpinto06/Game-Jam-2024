extends CharacterBody2D


const SPEED = 400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var player
var run_away = false

func _physics_process(delta):
	if run_away:
		var direction = (player.position - self.position).normalized()
		velocity.y = -direction.y * SPEED * 5
		#velocity.x = -direction.x * SPEED + 300
		if self.position.y > 600:
			self.queue_free()
	else:
		velocity.x = 0
		
	move_and_slide()




func _on_player_detection_body_entered(body):
	if body.name == "MainCharacter":
		player = body
		run_away = true
		
