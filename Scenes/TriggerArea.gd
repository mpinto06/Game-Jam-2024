extends Area2D

# La velocidad de la plataforma en píxeles por segundo.
@export var speed = 100

# La dirección de la plataforma, debe ser un vector normalizado.
@export var direction = Vector2.RIGHT

# El nodo de la plataforma, debe ser un KinematicBody2D.
@onready var platform = get_node("Platform")

# Esta función se llama cuando otro cuerpo entra en el área.
func _on_Area2D_body_entered(body):
	# Comprobamos si el cuerpo es el personaje principal.
	if body.is_in_group("player"):
		# Movemos la plataforma en la dirección y velocidad especificadas.
		platform.move_and_slide(direction * speed)
