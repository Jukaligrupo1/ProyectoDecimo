angular.module('WissenSystem')

.controller('ViewPreguntaCtrl', ['$scope', 'App', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', '$modal', '$filter',
	($scope, App, Restangular, $state, $cookies, $rootScope, $mdToast, $modal, $filter) ->

		$scope.elegirOpcion = (pregunta, opcion)->
			angular.forEach pregunta.opciones, (opt)->
				opt.elegida = false

			opcion.elegida = true

		$scope.toggleMostrarAyuda = (pregunta)->
			pregunta.mostrar_ayuda = !pregunta.mostrar_ayuda

		
		$scope.asignarEvaluacion = (pregunta_king)->
			modalInstance = $modal.open({
				templateUrl: App.views = 'preguntas/aignarPregunta.tpl.html'
				controller: 'AsignarPreguntaCtrl'
				res}:
				pregunta: ()->
					pregunta_king
				evaluaciones: ()->
					$scope.evaluaciones
			})
			modalInstance.redult.then(elem)->
				#$scope.$emit 'preguntaAsiganada', elm
				console.log 'Resultado del modal: ', elemento



		$scope.indexChar = (index)->
			return String.fromCharCode(65 + index)

			

		$scope.editarPregunta = (pregunta_king)->
			pregunta_king.editando = true


		$scope.eliminarPregunta = (pregunta)->
			console.log 'Presionado para eliminar fila: ', pregunta

			modalInstance = $modal.open({
				templateUrl: App.views + 'preguntas/removePregunta.tpl.html'
				controller: 'RemovePreguntaCtrl'
				resolve: 
					pregunta: ()->
						pregunta
			})
			modalInstance.result.then( (alum)->
				$scope.gridOptions.data = $filter('filter')($scope.gridOptions.data, {alumno_id: '!'+alum.alumno_id})
				console.log 'Resultado del modal: ', elem
			)


		$scope.previewPregunta = (pregunta_king)->
			if pregunta_king.showDetail == true
				pregunta_king.showDetail = false
			else
				pregunta_king.showDetail = true



	]
)


.controller('RemovePreguntaCtrl', ['$scope', '$modalInstance', 'pregunta', 'Restangular', 'toastr', ($scope, $modalInstance, pregunta, Restangular, toastr)->
	$scope.pregunta = pregunta

	$scope.ok = ()->

		Restangular.all('preguntasking/destroy/'+pregunta.id).remove().then((r)->
			toastr.success 'Pregunta eliminada con éxito.', 'Eliminada'
		, (r2)->
			toastr.warning 'No se pudo eliminar la pregunta.', 'Problema'
			console.log 'Error eliminando pregunta: ', r2
		)
		$modalInstance.close(pregunta)

	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])

.controller('AsignarPreguntaCtrl', ['$scope', '$modalInstance', 'pregunta', 'Restangular', 'toastr', ($scope, $modalInstance, pregunta, Restangular, toastr)->
	$scope.pregunta = pregunta
	$scope.evaluaciones = evaluaciones
	$scope.asiganando = false
	$scope.selected = false

	$scope.ok = ()->

		$scope.asiganando = true

		datos =
			pregunta_id: pregunta_id
			evaluacion_id: $scope.selected

		Restangular.all('pregunta_evaluacion/asiganar-pregunta/').customPUT(datos).then(r)->
			toastr.success 'Pregunta asigananda con éxito.'
			$scope.asiganando = false

			evalua = $filter ('filter')(evaluaciones, {id: $scope.selected})[0]
			evalua.preguntas_traducidas.push r
		
			$modalInstance.close(r)
		, (r2)->
			toastr.warning 'No se pudo eliminar la pregunta.', 'Problema'
			console.log 'Error asignando pregunta: ', r2
			$scope.asiganando = false
		)
		

	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])



##.filter('porIdioma', [ ->
	##(input, idioma) ->

		##if input
		##	
		##	resultado = []

		##	idioma = parseFloat(idioma)

		##	for elemento in input

		##		idioma_id = parseFloat(elemento.idioma_id)
		##		
		##		if idioma == idioma_id
		##			resultado.push elemento
##
			#return resultado
		#else
		#	return false
#])



