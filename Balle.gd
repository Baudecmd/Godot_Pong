extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var  target:Node2D 
onready var particles=preload("res://Rebound.tscn")
var velocity=Vector2()
onready var trailing=get_node("Trail")
export var speed : int  = 1 
export var reboundNumber:int =0 setget setRebound
export var speedFactor:float =1
var color:Color
func setRebound(rebound):
	reboundNumber=rebound
	print(reboundNumber)
	trailing.restart()
	trailing.process_material.direction=Vector3(-velocity.x,-velocity.y,0)
	if(rebound>=3):
		trailing.emitting=true
		color=Color.red
		speedFactor=1.3
	else: 
		trailing.emitting=false
		color=Color.white
		speedFactor=1
	modulate=color
# Called when the node enters the scene tree for the first time.
func _ready():
	trailing.emitting=true
	velocity=(target.position - self.position).normalized()
	pass # Replace with function body.

func _physics_process(delta):
	move_and_collide(velocity*speed*pow(1.1,reboundNumber)*speedFactor)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("bord"):
		print("bord detecté")
		velocity=velocity*(Vector2(1,-1))
		setRebound(reboundNumber+1)
	else:
		velocity=(body.position - self.position).normalized() * -1
		setRebound(1)
	var particlesInstance=particles.instance()
	particlesInstance.position=self.position
	particlesInstance.color=color
	get_parent().add_child(particlesInstance)
	particlesInstance.emitting=true
	$AudioStreamPlayer2D.play()
	
