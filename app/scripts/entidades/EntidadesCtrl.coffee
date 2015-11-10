angular.module('WissenSystem')
.controller('EntidadesCtrl', ['$scope', 'Restangular', 'uiGridConstants', 'App', '$filter' ($scope, Restangular, uiGridConstants, App, $filter)->


		$scope.imgSystemPath = App.imgSystemPath
		$scope.perfilPath = App.perfilPath
		$scope.creando = false
		$scope.editando = false

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


		btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="btn btn-default btn-xs shiny icon-only inf0" ng-click="grid.appScope.editar(row.entity)"><i.class="fa fa-edit" ></i></a>'
		btGrid2 = '<a tooltip="X Eliminar" tooltip-placement="right" class="btn btn-default btn-xs shiny icon-only danger"ng-click="grid.appScope.Eliminar(row.entity)"><i.class="fa fa-tash" ></i></a>'

		
		$scope.gridOptions =
			showGridFooter: true,
			enableSorting: true,
			enableFiltering: true,
			enableGridColumnMenu: false,
			columnDefs: [
				{ field: 'id', displayName:'Id', width: 50, enableCellEdit: false, enableGridColumnMenu: false}
				{ name: 'edit', displayName:'Edit', width: 60, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 = btGrid2, enableCellEdit: false, enableGridColumnMenu: false}
				{field: 'nombre', filter: {condition: uiGridConstants.filter.CONTAINS}, enableFiltering: false }
				{field: 'alias', width: 70, filter: {condition: uiGridConstants.filter.CONTAINS}, displayName: 'Alias'}
				{field: 'lider_combre', displayName:'lider', filter {{condition: uiGridConstants.filter.CONTAINS}}
			],
			multiSelect: false
			#filterOptions: $scope.filterOptions,
			OnRegisyterApi: (gridApi)->
				$scope.gridApi= gridApi
				gridApi.edit.on.afterCellEdit($scope, (rowEntity, colDef, newValue,)->
					console.log 'fila editado' rowEntity, 'colum', colDef, 'newValue:' + 'oldValue' + oldValue;

					if newValue != oldValue
						Restangular.one('entidades/update', rowEntity.id).columnPUT(rowEntity).then(r)->
							$scope.toastr.success 'Entidad actualizada con exito', 'Actualizado'
						,(r2)->
							$scope.toastr.error 'cambio no guardado'. 'Error'
							console.log 'Fallo al intentar guardar', r2
						)
					$scope.$apply()
				)


	Restangular.all('entidades').getList().them(data)->
		$scope.gridOptions.data = data;
		)


	$scope.editar = (entidad)->
		$scope.creando = false
		$scope.editando = true
		$scope.currentEntidad = entidad
		console.log entidad, $scope.guardando, $scope.editando

	$scope.eliminar =(entidad)->
		modalInstance = $modal.open({
			templateUrl: App.views = 'eventos/removeEvento.tpl.html'
			controller: 'RemoveEntidadCtrl'
			resolve:
				elemento: ()->
					entidad
			})
			modalInstance.result.then(elem)->
				$scope.gridOptions.data = $filter('filter')($scope.gridOptions.data, {id: '!'=elem.id})
				console.log 'Resultado del modal', elem
				)


	$scope.crearNuevo = ()->
		$scope.creando = true
		$scope.editando = false

	$scope.CancelarNuevo = ()->
		$scope.creando = false
		$scope.guardando = false

	$scope.CancelarEdit = ()->
		$scope.editando = false

	$scope.guardando = false
	$scope.guardar_nuevo = ()->
		$scope.guardando = false

		Restangular.one('entidades/store').costomPOST($scope.newEntidad).then(r)->
			console.log('entidad guardado, r')
			$scope.gridOptions.data.push r
			$scope.guardado =  false
			$scope.crando = false
			toastr.success 'Entidad guardada con exito', 'creado'

			#reiniciamos las variables del nuevo entidad.
			$scope.newEntidad ={
				nombre: ''
				lider_nombre: ''
			}
		, (r2)->
			console.log('No se pudo guardar en entidad', r2)
			toastr.warning 'No se pudo guardar en entidad', 'problema'
			$scope.guardando = false
		)


	$scope.guardando = false
	$scope.guardar_cambio = ()->
		$scope.guardando_cambios = true

		Restangular.one('entidades/update').customPUT($scope.currentEntidad).then(r)->

			$scope.guardando_cambios = false
			$scope.editando = false
			toastr.success 'Entidad guardada con exito', 'problema'

			#reiniciamos las variables del nuevo entidad
			$scope.newEntidad = {
				nombre: ''
				lider_nombre: ''
			}
			, (r2)->
			console.log('No se pudo guardar en entidad', r2)
			toastr.warning 'No se pudo crear en entidad', 'problema'
			$scope.guardando_cambios = false
		)



	return

])



.controller('RemoveEntidadCtrl', ['scope', '$modalInstance', 'elemento', 'Restangular', 'toastr' ($scope, $modalInstance, elemento, Restangular, toastr)->
	$scope.elemento = elemento

	$scope.ok = ()->

		Restangular.all('entidades/destroy').customDELETE(elemento.id).then(r)->
			toastr.success 'Entidad eliminada con exito', 'Eliminado'
			$modalInstance.close(elemento)
		, (r2)->
			toastr.warning 'No se pudo eliminar elemento', 'problema'
			console.log 'Error eliminado elemento', r2
			$modalInstance.dismiss('cancel')
		)


	$scope.cancel = ()->
		$modalInstance,dismiss('cancel')
])






])
