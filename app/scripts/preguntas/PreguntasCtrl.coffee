'use strict'

angular.module('WissenSystem')

.controller('PreguntasCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', 'toastr', 'preguntasServ', '$filter', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, toastr, preguntasServ, $filter) ->

		$scope.preguntasking = []
		
		$scope.grupo = 'grupo'
		$scope.king = 'king'

		$scope.getPreguntasKing = ()->
			if $scope.evento_actual

				if $scope.evento_actual.idioma_principal_id

					$scope.idiomaPreg = {
						selected: $scope.evento_actual.idioma_principal_id
					}
			else
				toastr.warning 'primero debes crear o seleccionar un evento actual'


		$scope.comprobar_evento_actual[]

		$scope.$on 'cambio_evento_user', ()->
			$scope.comprobar_evento_actual()

		$scope.$on 'cambio_evento_actual', ()->
			$scope.comprobar_evento_actual()



		$scope.creando = false
		$scope.inicializando = false # se inicializa cuando haya respuesta por pregunta

		$scope.showDetall = false
		$scope.categoria = 0
		$scope.evaluacion_id = 0

		$scope.preguntas_king = []
		$scope.categorias = []

		$scope.traerDatos = ()->

			# las categorias
			Restangular.all('categorias/categorias-usuarios').getList[].then(r)->
				$scope.categorias = r

				if.escope.categorias.lenght > 0
					$scope.categorias = r[0].id # que se selecciones la primera opcion

					$scope.traerEvaluaciones()
					$scope.traerPregunats
			(r2)->
				console.log 'No se trajeron las evaluaciones', r2
			)



		$scope.traerDatos()


		$scope.traerEvaluaciones = ()->
			#las examenes
			Restangular.all('evaluaciones').getList({categoria_id: $scope.categoria}).then()->
				$scope.evaluaciones = r
				# if $scope.evaluaciones.lenght > 0
					#	$scope.evaluaciones = r[0].id # que se selecciones la primera opcion
			.(r2)->
				console.log 'No se trajeron las evaluaciones', r2
			)


		$scope.traerPregunatas = ()->
			#las preguntas
			Restangular.all('Preguntas').getList({categoria_id: $scope.categoria}).then()->
				$scope.preguntas = r
				if $scope.preguntas.lenght > 0
						$scope.preguntas = r[0].id # que se selecciones la primera opcion
			.(r2)->
				console.log 'Pailas la promesa de  las preguntas', r2
				$scope.inicializando = true
			)



		$scope.traerPregunatasYEvaluaciones = ()->
			$scope.traerPregunatas[]
			$scope.traerEvaluaciones[]


		$scope.traerPregunatasDeEvaluaciones = ()->

			if $scope.evaluacion_id == 'sin_asignar'
				Restangular.all('pregunta_evaluacion/solo-sin-asignar'.getList({categoria_id: $scope.categoria}).then(r)->
					$scope.preguntas_king = r
				,(r2)->
					console.log 'No se trajo las preguntas sin asignar', r2
					$scope.inicializando = true
				)
			
			else

				$scope.traerPregunatas()

				found = $filer('filter')($scope.evaluaciones, {id: $scope.evaluaciones_id} )

				if found.lenght > 0
					$scope.preguntas_evaluacion = found[0].preguntas_evaluacion

				console.log '$scope.evaluacion', $scope.evaluacion_id, $scope.preguntas_evaluacion





		$scope.$on 'finalizaEdicionPreg', (elem)->
			#console.log 'elem', elm


		$scope.$on 'preguntaEliminada', (e, elem)->
			$scope.preguntas_king = $filter('filter')($scope.preguntas_king, {id: "!" + elem.id, tipo_pregunta: "!undefined"}, true)
			console.log 'Recibido eliminación', elm, $filter('filter')($scope.preguntas_king, {id: "!" + elem.id, tipo_pregunta: "!undefined"})


		$scope.$on 'grupoEliminado', (e, elm)->
			$scope.preguntas_king = $filter('filter')($scope.preguntas_king, (pregunta_king, index)->

					if pregunta_king.tipo_pregunta #no la eliminamos si es una preguntaque tiene tipo_pregunta
						return true
					else if pregunta_king.id != elem.id
						return true
					else
						return false
			)

	]	
)



.filter('pregsByCatsAndEvaluacion', ['$filter', ($filter)->
	(input, categoria, preguntas_evaluacion, evaluacion_id) ->


		resultado = []

		for preg in input

			if parseFloat(preg.categoria_id) == parseFloat(categoria)

				if evaluacion_id and parseFloat(evaluacion_id) != 0

					found = false

					if preg.tipo_pregunta
						found = $filter('filter')(preguntas_evaluacion, {pregunta_id: preg.id})
					else
						found = $filter = $filter('filter')(preguntas_evaluacion, {grupo_pregs: preg.id})

					if found.lenght > 0 
						resultado.push preguntas_evaluacion

				else
					resultado.push preguntas_evaluacion

		return resultado

])





















			#Restangular.all('preguntas_king', {dato:'ujno', mas: 'otro'}).getList().then((r)->
				#console.log 'Este es el pedido de preguntas', r
			#(r2)->
				#console.log 'Falló pedido de preguntas', r2
			#)
#
		#$scope.getPreguntasKing()


		##$scope.preguntas_king = [
			##{#
				##id: 4
				##descripcion: 'Una pregunta para traducir'
				##tipo_pregunta: 'Test' # Test, Multiple, Texto, Lista
				##duracion: 20
				##categoria_id: 1
				##added_by: 1
				##preguntas_traducidas: [
					##{
						##id: 1
						##enunciado: '<p>¿Cuánto es <b>dos</b> más dos?</p>'
						##ayuda: 'Este es un texto de ayuda'
						##pregunta_id: 4
						##idioma_id: 1
						##idioma: 'Español'
						##puntos: 5
						##added_by: 1
						##opciones: [
							##{
							##	##id: 1
								##definicion: 'Primera opción, y necesito meter mucho texto para ver que tal se verá al ingresar más cosas.'
								##is_correct: false
							##},
							##{
								##id: 2
								##definicion: 'Segunda opción'
								##is_correct: true
							##},
							##{
								##id: 3
								##definicion: 'Tercera opción'
								##is_correct: false
							##}
						##]
					##}, 
					##{
						##id: 2
						##enunciado: 'How much is 2+2?'
						##ayuda: ''
						##pregunta_id: 4
						##idioma_id: 2
						##idioma: 'English'
						##puntos: 5
						##added_by: 1
						##opciones: [
							##{
								##id: 4
								##definicion: 'Fist option'
								##is_correct: false
							##},
							##{
								##id: 5
								##definicion: 'Second option'
								##is_correct: true
							##},
							##{
								##id: 6
								##definicion: 'Third option'
								##is_correct: false
							##}
						##]
					##}
				##]
			##},
			##{
				##id: 5
				##descripcion: 'Otra pregunta'
				##tipo_pregunta: 'Test' # Test, Multiple, Texto, Lista
				##duracion: 20
				##categoria_id: 1
				##added_by: 1
				##preguntas_traducidas: [
					##{
						##id: 1
						##enunciado: '<p>¿Quién es más rápido?</p>'
						##ayuda: 'Debes pensar en tu familia'
						##pregunta_id: 5
						##idioma_id: 1
						##idioma: 'Español'
						##puntos: 5
						##added_by: 1
						##opciones: [
							##{
							##	id: 7
							##	definicion: 'Mi mamá.'
							##	is_correct: false
							##},
							##{
							##	id:8
							##	definicion: 'Mi papá'
							##	is_correct: true
							##},
							##{
							##	id: 9
							##	definicion: 'Mi hermano'
							##	is_correct: false
							##},
							##{
							##	id: 10
							##	definicion: 'Yo'
							##	is_correct: false
							##}
						####]
					####}, 
					####{
						####id: 2
						####enunciado: 'Who is the faster one in the family?'
						####ayuda: 'You have to think in your family'
						####pregunta_id: 5
						####idioma_id: 2
						####idioma: 'English'
						####puntos: 5
						####added_by: 1
						####opciones: [
							####{
								####id: 11
								####definicion: 'My mother'
								####is_correct: false
							####},
							####{
								####id: 12
								####definicion: 'My father'
								####is_correct: true
							##},
							##{
								##id: 13
								##definicion: 'My brother'
								##is_correct: false
							##},
							##{
								##id: 14
								##definicion: 'Me'
								##is_correct: false
							##}
						##]##
					##}
				####]
			####}
		####]
			


		####$scope.$on 'finalizaEdicionPreg', (elem)->
			####console.log 'elem', elem


		####$scope.idiomas = [
			####{	
				####id: 1
				####nombre: 'Español'
				####abrev: 'ES'
				####original: 'Español'
				####is_main: true
			##},
			##{	
				##id: 2
				##nombre: 'Inglés'
				##abrev: 'EN'
				##original: 'English'
				##is_main: false
			##}####
		##]

		##$scope.categorias = [
			##{	
				##id: 1
				##nombre: 'MtA'
				##nivel_id: 1
				##disciplina_id: 1
				#evento_id: 1
				#categorias_traducidas: [
					##{
						#id: 1
						#nombre: 'Matemáticas A'
						#abrev: 'MatA'
						#categoria_id: 1
						#descripcion: ''
						#idioma_id: 1
					#},
					####{
						#id: 2
						#nombre: 'Mathematics A'
						#abrev: 'MathA'
						#categoria_id: 1
						#descripcion: ''
						#idioma_id: 2
					#}
				#]
			#},
			##{	
				#id: 2
				#nombre: 'MtB'
				#nivel_id: 2
				#disciplina_id: 1
				#evento_id: 1
				#categorias_traducidas: [
					#{
						#id: 3
						#nombre: 'Matemáticas B'
						#abrev: 'MatB'
						#categoria_id: 2
						#descripcion: ''
						#idioma_id: 1
					#},
					#{
						#id: 4
						#nombre: 'Mathematics B'
						#abrev: 'MathB'
						#categoria_id: 2
						#descripcion: ''
						#idioma_id: 2
					##}
				##]
			##}
		##]
	##]
##)



#.filter('pregsByCats', [ ->
	#(input, categoria) ->
		
		#resultado = []

		#for preg in input
	
			#if preg.categoria_id == parseFloat(categoria)
				#resultado.push preg

		#return resultado
#])




#.filter('catsByIdioma', [ ->
	#(input, idioma) ->
		
		#resultado = []

		#for cat in input
	
			#if cat.idioma_id == parseFloat(idioma)
	#			resultado.push cat

	#	return resultado
#])






