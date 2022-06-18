extends KinematicBody2D

var speed = 50
var jumpforce = 500
var gravity = 700

var vel = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("Player_Left"):
		vel.x -= speed
	if Input.is_action_pressed("Player_Right"):
		vel.x += speed
	move_and_slide(vel, Vector2.UP)
