extends KinematicBody2D


var speed = 10
var jumpforce = 400
var gravity = 400

var vel = Vector2()

onready var playerturn = get_node("player")

func _physics_process(delta):
	if Input.is_action_pressed("Player_Left"):
		vel.x -= speed
		playerturn.flip_h = true
	elif Input.is_action_just_released("Player_Left"):
		pass
	elif Input.is_action_pressed("Player_Right"):
		vel.x += speed
		playerturn.flip_h = false
	elif Input.is_action_just_released("Player_Right"):
		pass
	elif Input.is_action_pressed("Player_Jump") and is_on_floor():
		vel.y -= jumpforce
		
	vel.y += gravity * delta
		
	vel = move_and_slide(vel, Vector2.UP)
	
	if Input.is_action_pressed("Player_Jump") and Input.is_action_just_released("Player_Jump"):
		vel.y -= jumpforce
