extends StaticBody3D

signal on_pressed()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func pressed():
	print("pressed")
	on_pressed.emit()

func setText(text):
	$Label3D.text = text
	
func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				$MeshInstance3D2.position.z = 0.02
			else:
				$MeshInstance3D2.position.z = 0.08
				pressed()
			


func _on_mouse_entered():
	$Label3D.outline_modulate = Color.GREEN_YELLOW


func _on_mouse_exited():
	$Label3D.outline_modulate = Color.BLACK
