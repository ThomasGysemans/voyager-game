extends KinematicBody2D

const MISSILE_LIFETIME := 5

var speed := 800
var velocity := Vector2.ZERO
var direction := Vector2.ZERO
var explosionEffect = null

onready var ExplosionEffect = preload("res://Effects/ExplosionEffect.tscn")
onready var timer: Timer = $Timer

func _ready():
	velocity = direction * speed
	timer.start(MISSILE_LIFETIME)

func _physics_process(delta):
	position += velocity * delta

func _on_timeout():
	queue_free()

func _on_hit(body):
	queue_free()
	explosionEffect = ExplosionEffect.instance() as AnimatedSprite
	get_parent().add_child(explosionEffect)
	explosionEffect.global_position = global_position
	explosionEffect.play("explode")
	explosionEffect.connect("animation_finished", self, "_on_explosion_finished")

func _on_explosion_finished():
	explosionEffect.queue_free()
