extends CharacterBody2D
@onready var timer := $Timer
@export var speed = 800.0
var dir := Vector2.ZERO
@onready var timeOut = false
@onready var characters = get_tree().get_nodes_in_group("characters")
@onready var clicked = false
@onready var found = false
func _on_character_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		clicked = !clicked
		print("Luigi Clicked!1")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.input_pickable = true
	self.input_event.connect(_on_character_input_event)
	var pauseButton = get_tree().root.get_child(0).get_node("pause")
	var resetButton = get_tree().root.get_child(0).get_node("reset")
	var timer = get_tree().root.get_child(0).get_node("Timer")
	
	resetButton.pressed.connect(_on_reset_clicked)
	timer.timeout.connect(_on_timer_timeout)
	pauseButton.pressed.connect(_on_pause_clicked)
	
	z_index = -1
	randomize()
	dir = Vector2(get_rand_val(),get_rand_val()).normalized() 
	for charas in characters:
		add_collision_exception_with(charas)

func get_rand_val() -> float:
	var fl := randi_range(-1,1)
	return fl


func _on_pause_clicked() -> void:
	if !timeOut:
		found = !found
	
func _on_reset_clicked() -> void:
	print("reset luigie clicdk")
	timeOut = false
	found = false
	
func _on_timer_timeout() -> void:
	timeOut = true
	found = true
	
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
