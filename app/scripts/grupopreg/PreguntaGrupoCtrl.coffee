angular.module('WissenSystem')

.controller('PreguntaGrupoCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScape', 'toastr',
	($scope, $http, Restangular, $state, $cookies, $rootScape, toastr)->


		$scope.editorOptions =
			inlineMode: true
			placeholder: ''


		$scope.cerrarEdicion = ()->
			$scope.grupoking.editando = false


		$scope.finalizarEdicion = ()->
			$scope.$emit 'finalizaEdicionContenido'

			$datos = {contenidos_traducidos: $scope.grupoking.contenidos_traducidos}

			Restangular.one('contenidos_traduc/update').customPUT($datos).then(r)->
				console.log('Cambios guardados', r)
				$scope.grupoking.editando = false
				toastr.success 'Cambios guardados con éxito'
			, (r2)->
				console.log('No se pudo guardar los cambios', r2)
				toastr.warning 'Cambios NO guardados', 'Problema'
			)
			console.log 'Guardando cambios...'


		$scope.aplicarCambios = ()->
		