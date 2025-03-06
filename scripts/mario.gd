extends CharacterBody2D

@onready var timer := $Timer
@export var speed = 800.0
var dir := Vector2.ZERO
@onready var characters = get_tree().get_nodes_in_group("characters")
@onready var found = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var luigi = get_tree().root.get_child(0).get_node("luigi")
	luigi.input_event.connect(_on_luigi_input_event)
	dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
	for charas in characters:
		add_collision_exception_with(charas)
	

func get_rand_val() -> float:
	var fl := randi_range(-1,1)
	return fl
	
func _physics_process(delta: float) -> void:
	velocity = speed * dir * delta
	if !found:
		self.visible = true
		move_and_slide()
		for index in get_slide_collision_count():
			var collision = get_slide_collision(index)
			if collision.get_collider() is StaticBody2D:
				dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
				velocity = speed * dir * delta
	else:
		self.visible = false

func _on_luigi_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		found = !found
	pass # Replace with function body.

		
