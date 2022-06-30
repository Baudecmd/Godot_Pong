extends Joueur

class_name JoueurIA
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target



# Called when the node enters the scene tree for the first time.
func _ready():
	speed=100
	pass # Replace with function body.

func _process(delta):
	if (target != null):
		if(target.position.y>self.position.y+$Sprite.texture.get_height()/2):
			move("DOWN")
		elif(target.position.y<self.position.y-$Sprite.texture.get_height()/2):
			move("UP")
		else: move("")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
