extends Node2D

@onready var timer = $Timer
@onready var play = $Play
@onready var nope = $Nope

func _on_play_pressed():
	play.hide()	
	nope.play()
	timer.start()
	

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/nivel_1.tscn")
	 # Replace with function body.


func _on_area_2d_mouse_entered():
	#$Play.set_physics_process()
	#$Play.set_position(Vector2(-200,-200))
	var tween = get_tree().create_tween()
	tween.tween_property(play, "position", Vector2(-200,-100), 0.7)



func _on_area_2d_mouse_exited():
	var tween = get_tree().create_tween()
	tween.tween_property(play, "position", Vector2(465,180), 0.7)





func _on_timer_timeout():
	nope.stop() # Replace with function body.
