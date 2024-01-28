extends Area2D

@export var target : PackedScene
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer

func _on_body_entered(body):
	if body.name == "MainCharacter":
		get_tree().paused = true
		animated_sprite_2d.play("grabbed")
		timer.start()
		
		


func _on_timer_timeout():
	get_tree().paused = false
	get_tree().change_scene_to_packed(target)

