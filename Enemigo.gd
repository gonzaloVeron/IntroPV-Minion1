extends Node2D

signal sacarDeListaT()
signal decrementarCantidad()

var target:Node2D
const velocidad_escalar = 400
var velocidad_vector = Vector2(0, 0)
var timer = 0

func _physics_process(delta):
	var puntero:Vector2
	if(target != null):
		look_at(target.global_position)
		puntero = target.global_position - global_position
		
		var direccion = puntero.normalized()

		position += direccion * velocidad_escalar * delta
	
	timer += delta
	if(timer >= 5):
		emit_signal("sacarDeListaT", self)
		emit_signal("decrementarCantidad")
		queue_free()

func SetTarget(target):
	self.target = target

func _on_Area2D_area_entered(area):
	area.get_parent().destruir()
	
func sumarPunto(area):
	pass
	
func destruir():
	pass
