extends CharacterBody2D

@onready var timer := $Timer
@export var speed = 800.0
var dir := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	dir = Vector2(get_rand_val(),get_rand_val()).normalized() 


func get_rand_val() -> float:
	var fl := randi_range(-1,1)
	return fl
	
func _physics_process(delta: float) -> void:
	velocity = speed * dir * delta
	move_and_slide()
