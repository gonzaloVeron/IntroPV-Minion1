extends Label

func _on_Personaje_cambiosEnLosPuntos(valor):
	text = "Rombos:" + str(valor)

func reset():
	text = "Rombos:0"
