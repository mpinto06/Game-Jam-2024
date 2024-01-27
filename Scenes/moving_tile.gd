extends AnimatableBody2D

@onready var collision_shape_2d = $Area2D/CollisionShape2D


const SPEED = 450

func _on_area_2d_body_entered(body):
	if body.name == "MainCharacter":
		move_tile()

func move_tile():
	print(velocity)

