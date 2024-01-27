extends AnimatableBody2D

@onready var collision_shape_2d = $Area2D/CollisionShape2D




func _on_area_2d_body_entered(body):
	if body.name == "MainCharacter":
		pass

func move_tile():
	print(self.position)

