extends KinematicBody2D

class_name Joueur


var dir={"UP":-1,"DOWN":1,"":0}
export var speed=300


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	pass

func move(wantedDirection):
	move_and_slide(Vector2(0,dir[wantedDirection]*speed))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
