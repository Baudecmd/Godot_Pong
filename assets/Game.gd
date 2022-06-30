extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player1: Joueur 
var player2: Joueur

onready var player1Score:int=0
onready var player2Score:int=0
signal updateScore(player1,player2)
signal newGoal(player1,player2)
var balle
# Called when the node enters the scene tree for the first time.
func _ready():
	spawnBalle()
	updateScore()
	pass # Replace with function body.

func spawnBalle():
	if(balle!=null):
		balle.queue_free()
	balle=load("res://Balle.tscn").instance()
	balle.target=$JoueurHumain
	balle.position=$Spawn.position
	add_child(balle)
	$JoueurIA.target=balle
	pass

func updateScore():
	emit_signal("updateScore",player1Score,player2Score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func call_explosion(position):
		# Creata a new node.
	var fake_explosion = Node2D.new()
	fake_explosion.name = "fake_explosion"

	# Attach the script.
	fake_explosion.set_script(preload("res://fake_explosion_particles.gd"))

	# Set 'fake_explosion' variables.
	fake_explosion.min_particles_number = 5
	fake_explosion.max_particles_number = 10
	fake_explosion.min_particles_gravity = 20
	fake_explosion.max_particles_gravity = 60
	fake_explosion.min_particles_velocity = 20
	fake_explosion.max_particles_velocity = 60
	fake_explosion.min_particles_size = 3
	fake_explosion.max_particles_size = 5
	fake_explosion.scale=Vector2(2,2)
	# Set its position
	fake_explosion.position = position

	# This is useful if you want the explosion to be more visible.
	fake_explosion.z_index = 1

	# Add it to the scene.
	get_parent().add_child(fake_explosion, true)

	# And then you can explode it whenever you want.
	fake_explosion.particles_explode = true

	# You can use the name of the group to find all the fake particles nodes more easily.
	get_tree().get_nodes_in_group("fake_explosion_particles")

func _on_Player2Behind_area_entered(area):
	print("joueur y2 perdu")
	player2Score+=1
	call_explosion(balle.position)
	updateScore()
	spawnBalle()
	emit_signal("newGoal",player1Score,player2Score) 	
	pass # Replace with function body.


func _on_Player1Behind_area_entered(area):
	print("joueur 1 perdu")
	player1Score+=1
	call_explosion(balle.position)
	updateScore()
	spawnBalle()
	emit_signal("newGoal",player1Score,player2Score)
	pass # Replace with function body.
