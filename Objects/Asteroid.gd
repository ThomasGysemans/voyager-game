extends StaticBody2D

var rotation_speed := 0.0
onready var sprite: Sprite = $Sprite
onready var asteroids = [
	preload("res://assets/PNG/Sprites/Meteors/spaceMeteors_001.png"),
	preload("res://assets/PNG/Sprites/Meteors/spaceMeteors_002.png"),
	preload("res://assets/PNG/Sprites/Meteors/spaceMeteors_003.png"),
	preload("res://assets/PNG/Sprites/Meteors/spaceMeteors_004.png")
]

func _ready():
	rotation_speed = Globals.get_random_integer(10, 100) / 100.0
	var index := Globals.get_random_integer(0, asteroids.size())
	sprite.set_texture(asteroids[index])

func _physics_process(delta):
	rotation += rotation_speed * delta
