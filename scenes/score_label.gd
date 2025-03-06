extends Label

@onready var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var luigi = get_tree().root.get_child(0).get_node("luigi")
	print("HI FROM score label")
	print(luigi)
	text = "Score: " + var_to_str(score)
	luigi.input_event.connect(_on_luigi_input_event)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_luigi_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_pressed():
		print("Luigi Clicked!!")
		score += 1
		text = "Score: " + var_to_str(score)
		
	pass # Replace with function body.
