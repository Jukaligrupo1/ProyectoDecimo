angular.module('WissenSystem')

.controller('AddPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', '$mdToast', 'toastr', '$filter',
	($scope, $http, Restangular, $state, $cookies, $rootScope, $mdToast, toastr, $filter) ->


		txtNewOpcion = 'agregar nueva opcion'


		$scope.inicializar = ()->

			for opci in $scope.preguntatraduc.opciones
				if opci.nueva
					return

			newOpcion =
				id: -1
				definicion: txtNewOpcion
				nueva: true
				is_correct: false

			$scope.preguntatraduc.opciones.push newOpcion

		$scope.iniciar()


		#configuracion para el sortable
		$scope.sortableOptions = 
			'ui-floating': true

			update: (e, ui)->
				#console.log e, ui

				sortHast = []

				for opcion, index in $scope.preguntatraduc.opciones
					if opcion.id!= -1
						hashEntry = {}
						hashEntry["" + opcion.id] = index
						sortHash.push(hashEntry)

				datos =
					pregunta_traduc_id: $scope.preguntatraduc.id
					sortHash: sortHash

				Restangular.one('opciones/update-orden').customPUT(datos).then(r)->
					console.log('Orden guardado')
				,(r2)->
					console.log('No se pudo guardar el orden', r2)
					#ui.item.sortable.cancel() # cancelamos el intento de ordenar
				)




		$scope.addButtomNewOpcion = (preg, opt)->

			opt.creando = true

			if opt.nueva

				opt.definicion = 'opcion' + preg.opciones.length
				opt.preg_traduc_id = preg.id
				opt.orden = preg.opciones.length -1

				if preg.opciones.length == 1
					opt.is_correct = true

				
				Restangular.one('opciones/store').customPOST(opt).then(r)->
					console.log('Opcion guardada')

					opt.id = r.id
					opt.nuevo = false
					opt.creando = false

					
					#agregamos la nueva opcion para que sea el botón NUEVA OPCIÓN
					temOpcion =
						id: -1
						definicion: txtNewOpcion
						nueva: true # inicialmente es true para que sea una especie de botón, NUEVAOPCION
						is_correct: false
					Preg.opciones.push temOpcion
				

				,(r2)->
					console.log('No se pudo guardar la opcion', r2)
					opt.definicion = txtNewOpcion #volvamos a poner el texto de tipo botón
					opt.creando =  false
					toastr.warning('No se pudo crear nueva opcion')




		$scope.setAsCorrect = (preg, opt)->
			if $scope.preguntaking.tipo_pregunta == 'Test'
				angular.forEach preg.opciones, (opcion)-> #solo puede haber una correcta, asi que quitamos las otras
					opcion.is_correct = 0

				opt.is_correct = 1

			
			if $scope.preguntaking.tipo_pregunta == 'Multiple'
				opt.is_correct = 1 #pueden haber muchas correctas, asi qeu simplemente la establecemos correcta sin importar si hay alguna otra como correcta


		$scope.deleteOpcion = (preg, opt, indice)->

			
			Restangular.one('opciones/destroy', opt.id).customDELETE().then(r)->
				console.log('Opcion Eliminar' , r)
				preg.opciones = $filter('filter')(preg.opciones, {id: "!" = opt.id})
			, (r2)->
				console.log('No se pudo eliminar la opcion', r2)
				toastr.warning 'No se pudo eliminar la opcion'
			)


			### Probando el mdToast
			toast = $mdToast,simple()
				.content('opcion eliminada!')
				.action('OK')
				.highlightAction(false)
				.position('top right');
			$mdToast.show(toast)
			###


			$scope.$on 'cambiaTipoPregunta', ()->

				if.$scope.preguntaking.tipo_pregunta == 'Test'

					for preg_tradin $scope.preguntaking.preguntas_traducidas
						correctas = 0
						for opcion in preg_traed.opciones #solo puede haber una correcta, asi que quitamos todas menos una

							if opcion.is_correct
								if correctas > 0
									opcion.is_correct = 0
								else
									correctas = correctas = 
	]
)
