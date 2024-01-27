extends Node2D


func _on_play_pressed():
	get_tree().quit()
	
	

func _on_play_mouse_entered():
	self.set_position(Vector2(-200,-200))

func _on_play_mouse_exited():
	self.set_position(Vector2(0,0))


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/nivel_1.tscn") # Replace with function body.



	
