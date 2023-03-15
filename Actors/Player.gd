extends KinematicBody2D

const FIRE_COOLDOWN = 1 # in seconds

export var speed := 700
export var acceleration := 500
export(Vector2) var original_axis = Vector2.RIGHT # Vector2.RIGHT is the main axis the player starts with
onready var Missile = preload("res://Objects/Missile.tscn")
onready var ReactorLeft: AnimatedSprite = $ReactorLeft
onready var ReactorRight: AnimatedSprite = $ReactorRight
onready var GunLeft: Position2D = $GunLeft
onready var GunRight: Position2D = $GunRight
onready var TimerCoolDown: Timer = $Timer
var direction := Vector2.ZERO
var velocity := Vector2.ZERO
var can_shoot := true

func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
	velocity = move_and_slide(velocity)
	if velocity == Vector2.ZERO:
		set_reactors_visible(false)
	else:
		set_reactors_visible(true)
		rotation = lerp_angle(rotation, velocity.angle(), 0.1)
		direction = global_transform.basis_xform(original_axis)
	if can_shoot and Input.is_action_just_pressed("shooting"):
		send_missile(GunLeft)
		send_missile(GunRight)
		can_shoot = false
		TimerCoolDown.start(FIRE_COOLDOWN)

func set_reactors_visible(v:bool) -> void:
	ReactorLeft.visible = v
	ReactorRight.visible = v
	if not v:
		ReactorLeft.stop()
		ReactorRight.stop()
	else:
		ReactorLeft.play("flying")
		ReactorRight.play("flying")

func send_missile(gun: Position2D):
	var missile: KinematicBody2D = Missile.instance()
	missile.direction = direction
	get_parent().add_child(missile)
	missile.global_position.x = gun.global_position.x
	missile.global_position.y = gun.global_position.y
	missile.rotation = rotation
	
func _on_Timer_timeout():
	can_shoot = true
