extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var time = 0
func _process(delta):
	time += delta
	pass

func set_speed(speed):

	if speed < 0.1:
		$GPUParticles3D.speed_scale = 0.01
	else:
		$GPUParticles3D.speed_scale = 5.1

	var mat = ($GPUParticles3D.process_material as ParticleProcessMaterial)
	mat.initial_velocity_min = speed / 25
	mat.initial_velocity_max = speed / 25
	
	$GPUParticles3D.lifetime = 170 * (1 / (1 + speed* 0.01))

	
	var mat1 = ($GPUParticles3D.draw_pass_1 as SphereMesh).material as ShaderMaterial
	mat1.set_shader_parameter("speed", sqrt(speed))
	#var mat2 = ($GPUParticles3D.draw_pass_2 as SphereMesh).material as ShaderMaterial
	#mat2.set_shader_parameter("speed", sqrt(speed))
	var vec = Vector3(sin(time * 1 * speed * 3 * 0.0000021), cos(time * 0.33434 * 0.0001 * speed), sin(time * speed * 0.00001))
	vec = Vector3(1,1,1) - (vec + Vector3(1,1,1)) * 0.3
	print(vec)
	if speed > 10000:
		mat1.set_shader_parameter("colorseed", vec)
	else:
		mat1.set_shader_parameter("colorseed", Vector3(1,1,1))
