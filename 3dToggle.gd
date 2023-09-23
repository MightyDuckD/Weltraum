extends StaticBody3D

signal toggle_changed(old_value, new_value)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var myState = false

func toggle():
	myState = not myState
	toggle_changed.emit(not myState, myState)
	updateui()
	
func setText(text: String):
	$Label3D.text = text

func setPressed(press: bool):
	myState = press
	updateui()
	
func updateui():
	
	if myState:
		$MeshInstance3D2.position.y = -0.07
		($MeshInstance3D2.material_override as StandardMaterial3D).albedo_color = Color.DARK_GREEN
	else:
		$MeshInstance3D2.position.y = 0.07
		($MeshInstance3D2.material_override as StandardMaterial3D).albedo_color = Color.DARK_RED


		
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	toggle()
	pass # Replace with function body.



func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1 and !event.pressed:
			toggle()


func _on_mouse_entered():
	$Label3D.outline_modulate = Color.GREEN_YELLOW


func _on_mouse_exited():
	$Label3D.outline_modulate = Color.BLACK
