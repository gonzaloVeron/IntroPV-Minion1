extends Node2D

onready var cartelPerdiste = $Perdiste
onready var botonEmpezar = $"Boton empezar"
onready var botonReintentar = $"Boton reintentar"
onready var botonMenu = $"Boton ir al menu"
onready var cartelPuntos = $Puntos

func _on_Boton_ir_al_menu_pressed():
	cartelPerdiste.visible = false
	botonReintentar.visible = false
	botonMenu.visible = false
	botonEmpezar.visible = true
	cartelPuntos.visible = false
	cartelPuntos.rect_global_position = Vector2(-2523, -1431)

func _on_Personaje_levantarDerrota():
	cartelPuntos.visible = true
	cartelPuntos.rect_global_position = Vector2(-509.16, 22.812)
	cartelPerdiste.visible = true
	botonReintentar.visible = true
	botonMenu.visible = true

func _on_Boton_empezar_pressed():
	cartelPuntos.visible = true
	botonEmpezar.visible = false

func _on_Boton_reintentar_pressed():
	cartelPerdiste.visible = false
	botonReintentar.visible = false
	botonMenu.visible = false
	botonEmpezar.visible = false
	cartelPuntos.reset()
	cartelPuntos.rect_global_position = Vector2(-2523, -1431)
	
