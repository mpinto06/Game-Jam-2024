extends Area2D
@onready var area_2d = $"."
@onready var final = $"../Final"
@onready var label = $"../Label"



func _on_body_entered(body):
	if body.name == "MainCharacter":
		final.show()
		label.show()
		
		
