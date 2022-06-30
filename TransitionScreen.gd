extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player1Score:int
var player2Score:int
# Called when the node enters the scene tree for the first time.
func _ready():
	$Score_J1.text=String(player1Score)
	$Score_J2.text=String(player2Score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Game_newGoal(player1, player2):
	$AnimationPlayer.play()
	pass # Replace with function body.
