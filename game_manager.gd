extends Node

@onready var point_label: Label = %"Point label"

var points = 0
func add_point():
	points += 1
	print(points)
	point_label.text = "Apples: " + str(points)
