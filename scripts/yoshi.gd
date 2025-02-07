extends CharacterBody2D

@onready var timer := $Timer
@export var speed = 800.0
var dir := Vector2.ZERO
@onready var yoshi = $"../yoshi"
@onready var luigi = $"../luigi"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
	add_collision_exception_with(yoshi)
	add_collision_exception_with(luigi)
	print(get_collision_exceptions())

func get_rand_val() -> float:
	var fl := randi_range(-1,1)
	return fl
	
func _physics_process(delta: float) -> void:
	velocity = speed * dir * delta
	move_and_slide()
	
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		if collision.get_collider() is StaticBody2D:
			dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
			velocity = speed * dir * delta
		if collision.get_collider() is CharacterBody2D:
			print("shouldnt collide")

			
	 

		
