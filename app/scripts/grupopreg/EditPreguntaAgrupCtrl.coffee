angular.module('WissenSystem')

.controller('EditPreguntaAgrupCtrl', ['$scope'], '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$toastr', )
	($scope, $http, Restangular, $state, $cookies, $rootScope, toastr)->


		$scope.editorOptions =
			inlineMode: true
			placeholder: ''



		txtNewOpcion = 'Agregar nueva opción'


		$scope.inicializar = ()->

			for opci in $scope.pregagrup.opciones
				if opci.nueva
					return

			newOpcion =
				id: -1
				definicion: txtNewOpcion
				nueva: true
				is_correct: false

			$scope.pregagrup.opciones.push newOpcion

		$scope.inicializar()



		# Configuración para el sortable
		$scope.sortableOptions =
			'ui-floating': true

			update: (e, ui)->
				# console.log e, ui

				sortHash = []

				for opcion, index in $scope.pregagrup.opciones
					if opcion.id != -1
					hashEntry = {}
					hashEntry["" + opcion.id] = index
					sortHash.push(hasEntry)
				
				datos = 
					pregunta_agrupada_id: $scope.pregagrup.id
					sortHash: sortHash

				Restangular.one('opciones_agrupadas/update-orden').customPUT(datos).
					console.log('Orden guardado')
				, (r2)->
					console.log('No se pudo guardar el orden', r2)
					#ui.item.sortable.cancel() # Cancelamos el intento de ordenar
				)


		$scope.addButtonNewOpcion = (preg, opt)->

			opt.creando = true

			if opt.nueva

				opt.definicion = 'Opción ' + preg.opciones.length
				opt.pregunta_agrupada_id = preg.id
				opt.orden = preg.opciones.length - 1

				if preg.opciones.length == 1
					opt.is_correct = true


				Restangular.one('opciones_agrupadas/store').customPOST(opt).then((r)->
					console.log('Opción guardada')

					opt.id = r.id
					opt.nueva = false
					opt.creando = false


					# Agregamos la nueva opción para que sea el botón NUEVA OPCIÓN
					temOpcion =
						id: -1
						definicion: txtNewOpcion
						nueva: true # Inicialmente es true para que sea una especie de botón, NUEVA OPCIÓN
						is_correct: false
					preg.opciones.push temOpcion

				, (r2)->
					console.log('No se pudo guardar la opción ', r2)
					opt.definicion = txtNewOpcion # Volvemos a poner el texto de tipo botón
					opt.creando = false
					toastr.warning('No se pudo creer nueva opción')
				)




			$scope.setAsCorrect = (preg, opt)->
				if $scope.pregagrup.tipo_pregunta == 'Test'
					angular.forEach preg.opciones, (opcion)-> #solo puede haber una correcta, así que quitamos las otras
						opcion.is_correct = 0

						opt.is_correct= 1 


				if $scope.pregagrup.tipo_pregunta == 'Multiple'
					opt.is_correct = 1 # Pueden haber muchas correctas, así que simplemente la establecemos correcta sin importar si hay alguna otra correcta


			$scope.deleteOption = (preg, opt, indice)->

				Restangular.one('opciones_agrupadas/destroy', opt.id).customDelete().then
					console.log('Opción eliminada', r)
					preg.opciones = $filter('filter')(preg.opciones, {id: "!" + opt.id})
				, (2r)->
					console.log('No se pudo eliminar la opción', r2)
					toastr.warning 'No se pudo eliminar la opción'
				)




			$scope.cerrarEdicion = ()->
				$scope.pregagrup.editando = false

			$scope.mostrarConfiguración = false
			$scope.mostrarConfi = ()->
				$scope.mostrarConfiguración = !$scope.mostrarConfiguración


			$scope.finalizarEdicion = ()->
				$scope.$emit 'finalizaEdicionPregAgrup'

				Restangular.one('preguntas_agrupadas/update').customPut($scope.pregagrup).then(r)->
					console.log('Cambios guardados', r)
					$scope.pregagrup.editando = false
					toastr.success 'Cambios guardados con éxito'
				, (r2)->
					console.log('No se pudo guardar los cambios', r2)
					toastr.warning 'Cambios NO guardados'
				)
				console.log 'Guardando cambios...'


			$scope.aplicarCambios = ()->

				Restangular.one('preguntas_agrupadas/update').customPut($scope.pregagrup).then(r)->
					console.log('Cambios guardados', r)
					toastr.success 'Cambios guardados con éxito'
				, (r2)->
					console.log('No se pudo guardar los cambios', r2)
					toastr.warning 'Cambios NO guardados', 'Problema'

				)
				console.log 'Guardando cambios...'



			$scope.aplicarCambios = ()->
				console.log 'Cambia el tipo: ', $scope.pregagrup.tipo_pregunta

				if $scope.pregagrup.tipo_pregunta == 'Test'
					correctas = 0
					for opcion in $scope.pregagrup.opciones # Solo puede haber una correcta, así que quitamos todas menos una

						if opcion.is_correct
							if correctas > 0
								opcion.is_correct = 0
							else 
								correctas = correctas + 1



		return
	]
)
