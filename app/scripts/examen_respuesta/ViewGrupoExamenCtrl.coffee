angular.module('WissenSystem')

.controller('ViewGrupoExamenCtrl', ['$scope', 'Restangular', 'toastr', '$filter', 'AuthService', '$state', '$modal', 'App', ($scope, Restangular, toastr, $filter, AuthService, $state, $modal, App)->


		$scope.USER = AuthService.USER

		$scope.idioma = $scope.USER.idioma_main_id



		$scope.indexChar = ()->
			return String.fromCharCode(65 + index)



])



angular.module('WissenSystem')

.directive('ViewGrupoExamenCtrl', ['App', (App)->

	restric: 'E'
	templateUrl: "#{App.views}examen_respuesta/viewGrupoExamenDir.tpl.html"
	scope:
		grupoking: "="

	link: (scope, iElem, iAttrs)->
		# Debo agregar la clase .loading-inactive para que desaparezca el loader de la pantalla.
		# y eso lo puedo hacer con el ng-if

	controller: 'ViewGrupoExamenCtrl'

	
])

