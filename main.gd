extends Node2D


func _on_play_pressed():
	get_tree().quit()
	


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/nivel_1.tscn") # Replace with function body.


func _on_area_2d_mouse_entered():
	#$Play.set_physics_process()
	#$Play.set_position(Vector2(-200,-200))
	pass

func _on_area_2d_mouse_exited():
	$Play.set_position(Vector2(465, 180))
