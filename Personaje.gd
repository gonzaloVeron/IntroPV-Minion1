extends Node2D
class_name Personaje

signal cambiosEnLosPuntos(valor)
signal levantarDerrota()

const velocidad_escalar = 700
var puntos = 0
onready var puntero = get_local_mouse_position()
var timer = 0
var direccion:Vector2
var ultimaDireccion:Vector2
var b = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Dash"):
		b = true
		ultimaDireccion = direccion
		
	if b:
		timer += delta
		position += ultimaDireccion * (velocidad_escalar * 3) * delta
		if(timer >= 0.4):
			b = false
			timer = 0
	else:
		look_at(get_global_mouse_position())
		puntero = get_global_mouse_position() - global_position
		if puntero.length() > 20.0:
			direccion = puntero.normalized()
			position += direccion * velocidad_escalar * delta

func sumarPunto(area):
	puntos += 1
	area.queue_free()
	emit_signal("cambiosEnLosPuntos", puntos)

func destruir():
	morir()

func morir():
	emit_signal("levantarDerrota")
	queue_free()


#class EstadoDash:
#
#	var timer = 0
#
#	signal cambiarEstado()
#
#	func Execute(ultimaDireccion, velocidad_escalar, delta):
#		timer += delta
#		var position = ultimaDireccion * (velocidad_escalar * 3) * delta
#		if(timer >= 0.4):
#			timer = 0
#			emit_signal("cambiarEstado")
#		return position

