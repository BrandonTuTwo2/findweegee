extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("ready steady")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _pressed() -> void:
	print("RESET BUTTON CLICKED")
