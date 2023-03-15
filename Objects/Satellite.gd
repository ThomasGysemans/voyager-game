extends StaticBody2D

export var speed := 0.25
export var offset := 100
var counter := 0.0

onready var planet:StaticBody2D = get_parent()
onready var planet_sprite:Sprite = planet.get_node("PlanetSprite")
onready var planet_radius := (planet_sprite.texture.get_width() * planet_sprite.scale.x) / 2.0 + offset

func _physics_process(delta:float)->void:
	counter += delta
	
	global_position = Vector2(
		sin(counter * speed) * planet_radius,
		cos(counter * speed) * planet_radius
	) + planet.global_position
