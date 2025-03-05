extends CharacterBody2D
@onready var timer := $Timer
@export var speed = 800.0
var dir := Vector2.ZERO
@onready var characters = get_tree().get_nodes_in_group("characters")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_action_released("left_click") && event.button_index == MOUSE_BUTTON_LEFT:
		print("HI")
		
		
func _on_character_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		print("Luigi Clicked!!")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_pickable = true
	self.input_event.connect(_on_character_input_event)
	z_index = -1
	randomize()
	dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
	for charas in characters:
		add_collision_exception_with(charas)

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
