extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_speed(speed):

	if speed < 10:
		$GPUParticles3D.speed_scale = 0.01
	else:
		$GPUParticles3D.speed_scale = 5.1

	var mat = ($GPUParticles3D.process_material as ParticleProcessMaterial)
	mat.initial_velocity_min = speed / 25
	mat.initial_velocity_max = speed / 25
	
	$GPUParticles3D.lifetime = 170 * (1 / (1 + speed* 0.01))

	
	var mat2 = ($GPUParticles3D.material_override) as ShaderMaterial
	mat2.set_shader_parameter("speed", sqrt(speed))
	
