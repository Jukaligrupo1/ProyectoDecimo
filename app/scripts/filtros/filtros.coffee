angular.module('WissenSystem')

.filter('porIdioma', [ ->
	(input, idioma) ->

		if input

			resultado = []

			idioma = parseFloat(idioma)

			for elemento in input 

				idioma_id = parseFloat(elemento.idioma_id)

				if idioma == idioma_id
					resultado.push elemento

			return resultado
		else
			return false
])



.filter('idiomas_del_sistema', [ ->
	(input, no_usados) ->

		#si no_usados es falso, mostramos solo los usados por el sistema 

		if input

			resultado = []

			for elemento in input
				if no_usados
					if !elemento.used_by_system
						resultado.push elemento

				else
				 	if elemento.used_by_system
				 	resultado.push elemento

			return resultado
		else
			return false 
])


.filter('porIdiomasEdit', [ ->
	(input, idiomas) ->

		if input
			if input[0].uncodigo_id
				console.log input, idiomas

		resultado = []

		if idiomas and input

			for idioma in idiomas 

				idioma = parseFloat(idioma)

				for elemento in input

					idioma_id = parseFloat(elemento.idioma_id)

					if idioma = idioma_id
						resultado.push elemento

		return resultado
])


.filter('catsByIdioma', [ ->
	(input, idioma)->

		resultado = []

		for cat in input

			if cat.idioma_id == parseFloat(idioma)
				resultado.push cat

		return resultado
])

