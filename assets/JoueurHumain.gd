extends Joueur

class_name JoueurHumain
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var currentDir=""
	if(Input.is_action_pressed("ui_up")):
		currentDir="UP"
	elif(Input.is_action_pressed("ui_down")):
		currentDir="DOWN"
	move(currentDir)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
