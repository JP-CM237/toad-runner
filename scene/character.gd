extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -950.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite_2d = get_node_or_null("Sprite2D") if get_node_or_null("Sprite2D") else get_node_or_null("AnimatedSprite2D")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	# Physics must be processed before checking the final velocity for animations
	move_and_slide()

	# --- CLEAN & WORKING ANIMATION LOGIC ENGINE ---
	if sprite_2d:
		# 1. Flip the sprite direction based on movement
		if velocity.x != 0:
			sprite_2d.flip_h = velocity.x < 0

		# 2. Control which animation plays
		if not is_on_floor():
			sprite_2d.play("jumping")
		elif velocity.x > 1 or velocity.x < -1:
			sprite_2d.play("running") # Changed from "run" to match your animation name "running"
		else:
			sprite_2d.play("idle")
