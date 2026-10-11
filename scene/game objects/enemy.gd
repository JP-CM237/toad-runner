extends RigidBody2D

@onready var game_manager: Node = %GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("destroy enemy")
		body.jump()
		queue_free()
		

func _on_damage_area_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("decrease player health")
		game_manager.decrease_health()
		
		# 1. Calculate x_delta using global positions for accuracy
		var x_delta = body.global_position.x - global_position.x
		
		# 2. Changed x.delta to x_delta (using underscore)
		if x_delta > 0:
			body.jump_side(500)
		else:
			body.jump_side(-500)
