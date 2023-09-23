extends StaticBody3D


var progress = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func setProgress(text: String):
	$Label3D.text = text
	
	


func _on_area_3d_mouse_entered():
	$Label3D.outline_modulate = Color.GREEN_YELLOW


func _on_area_3d_mouse_exited():
	$Label3D.outline_modulate = Color.BLACK
