extends CharacterBody2D


const SPEED = 400

# Get the gravity from the project settings to be synced with RigidBody nodes.
var player
var run_away = false

func _physics_process(delta):
	if run_away and position.y > 150:
		var direction = (player.position - self.position).normalized()
		velocity.y = -SPEED * 15
		move_and_slide()
	else:
		run_away = false
		return
		
	




func _on_player_detection_body_entered(body):
	if body.name == "MainCharacter":
		player = body
		run_away = true
		

