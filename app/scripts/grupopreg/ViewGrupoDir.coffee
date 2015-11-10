angular.module('WissemSystem')

.directive('viewGrupo', ['App', (App)->

	restrict: 'E'
	templateUrl: "#{App.views}grupopreg/viewGrupoDir.tpl.html"
	scope: 
		idiomapreg: "="
		grupoking: "="
		indice: "="
		eventoactual: '='
		idiomaactualselec: "="
		evaluaciones: "="

	link: (scope, iElem, iAttrs)->
		# Debo agregar la clase .loading-inactive para que desaparezca el loader de la pantalla.
		# y eso lo puedo hacer con ng-if

	controller: 'ViewGrupoCtrl'


])