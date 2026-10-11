extends Node

@onready var point_label: Label = %"Point label"
@export var hearts : Array[Node]

var points = 0
var lives = 3

func decrease_health():
	lives -= 1
	print(lives)
	
	# Loop through exactly how many heart nodes are in your array
	for h in hearts.size():
		if h < lives:
			hearts[h].show()
		else:
			hearts[h].hide()
			
	if lives == 0:
		get_tree().reload_current_scene()

func add_point():
	points += 1
	print(points)
	point_label.text = "Apples: " + str(points)
