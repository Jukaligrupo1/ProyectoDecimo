angular.module('WissenSystem')

.controller('AddPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 'toastr',
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast, toastr) ->

		console.log 'App pregunta dir'
		$scope.creando = false

		$scope.addNewPregunta = ()->

			$scope.creando = true

			Restangular.one('preguntas/store').customPOST({categoria_id: $scope.categoria})
				r.editando = true
				$scope.creamdo = false
				$scope.preguntasking.push r
				console.log 'preguntas añadida:', $scope.preguntasking

			(r2)->
				console.log ' Rechazada la nueva', r2
				$scope.creando = false
				toastr.warning 'No se creo la pregunta', 'problema'
			)



		$scope.addNewPreguntaGrupo = ()->

			$scope.creando = true

			Restangular.one('grupo/store').customPOST({categoria_id: $scope.categoria}).then(r)->
				r.editando = true
				$scope.creamdo = false
				$scope.preguntasking.push r
				console.log 'preguntas añadida:', $scope.preguntasking

			(r2)->
				console.log ' Rechazada la nueva', r2
				$scope.creando = false
				toastr.warning 'No se creo la pregunta', 'problema'
			)





			$scope.preguntasking.push {
				id: 4
				descripcion: 'Una pregunta para traducir'
				tipo_pregunta: 'Test' # Test, Multiple, Texto, Lista
				duracion: 20
				categoria_id: 1
				added_by: 1
				editando: true
				preguntas_traducidas: [
					{
						id: 1
						enunciado: '<p>¿Cuánto es <b>dos</b> más dos?</p>'
						ayuda: 'Este es un texto de ayuda'
						pregunta_id: 4
						idioma_id: 1
						idioma: 'Español'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 1
								definicion: 'Primera opción, y necesito meter mucho texto para ver que tal se verá al ingresar más cosas.'
								is_correct: false
							},
							{
								id: 2
								definicion: 'Segunda opción'
								is_correct: true
							},
							{
								id: 3
								definicion: 'Tercera opción'
								is_correct: false
							}
						]
					}, 
					{
						id: 2
						enunciado: 'How much is 2+2?'
						ayuda: ''
						pregunta_id: 4
						idioma_id: 2
						idioma: 'English'
						puntos: 5
						added_by: 1
						opciones: [
							{
								id: 4
								definicion: 'Fist option'
								is_correct: false
							},
							{
								id: 5
								definicion: 'Second option'
								is_correct: true
							},
							{
								id: 6
								definicion: 'Third option'
								is_correct: false
							}
						]
					}
				]
			}



	]
)