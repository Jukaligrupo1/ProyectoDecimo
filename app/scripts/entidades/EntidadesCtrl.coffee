angular.module('WissenSystem')
.controller('EntidadesCtrl', ['$scope', 'Restangular', 'uiGridConstants', 'App', ($scope, Restangular, uiGridConstants, App)->


		$scope.imgSystemPath = App.imgSystemPath
		$scope.perfilPath = App.perfilPath

		$scope.imagenes = [
			{
				id:1
				nombre: 'gato-dormido-ordenador.jpg'
				public: true
			}
			{
				id:2
				nombre: 'gato-dormido-ordenador.jpg'
				public: true
			}
		]


		btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="btn btn-default btn-xs shiny icon"'
		btGrid2 = '<a tooltip="X Eliminar" tooltip-placement="right" class="btn btn-default btn-xs shiny"'

		$scope.gridOptions =
			showGridFooter: true,
			enableSorting: true,
			enableFiltering: true,
			enableGridColumnMenu: false,
			columnDefs: [
				{ field: 'id', displayName:'Id', width: 50, enableCellEdit: false, enableGridColumnMenu: false}
				{ name: 'edit', displayName:'Edit', width: 60, enableSorting: false, enableFiltering: false}
			]


])
