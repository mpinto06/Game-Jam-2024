extends Node2D


func _on_play_pressed():
	get_tree().quit()
	


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/nivel_1.tscn")
	 # Replace with function body.


func _on_area_2d_mouse_entered():
	#$Play.set_physics_process()
	#$Play.set_position(Vector2(-200,-200))
	var tween = get_tree().create_tween()
	tween.tween_property($Play, "position", Vector2(-200,-100), 1)



func _on_area_2d_mouse_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Play, "position", Vector2(465,180), 0.8)
