angular.module('WissenSystem')

.controller('GridUsuariosCtrl', ['$scope','$htto', 'Restangular', '$state', '$cookies', '$interval','toastr', 'uiGridConstanrs', '$modal', '$filter', 'App'
	($scope, $htto, Restangular, $state, $cookies, $interval, toastr, uiGridConstanrs, $modal, $filter, App)->

		$scope.currentusers = []
		$scope.currentuser = {}


		$scope.seleccionar_fila = (row)->
			$scope.gridApi.selection.clearSelectedRows()
			$scope.gridApi.selection.selelectRow(row)
			$scope.currentuser = row

		$scope.seleccionar_entidad = (row)->
			console.log 'presionado para cambiar entidad: ', row

			modalInstance=$modal.open({
				templateUrl: App.views + 'usuarios/cambiarEntidadUsuario.tpl.html'
				controller: 'selectEntidadCtrl'
				resolve:
					usuario: ()->
						row
					Entidades: ()->
						$scope.$parent.Entidades
			})
			modalInstance.result.then(entidad_id)->
				row.entidad_id = entidad_id
				console.log 'Resultado del modal:', entidad_id
			)


		$scope.editando = false
		$scope.editar = (row)->
			$scope.gridApi.selection,clearSelectedRows()
			$scope.gridApi.selection.selelectRow(row)

			$scope.$parent.currentUser = row
			$scope.currentusers= [row]
			$scope.$parent.editando = true



		$scope.eliminar = (row)->
			$scope.gridApi.selection.clearSelectedRows()
			$scope.gridApi.selection.selelectRow(row)

			modalInstance = $modal.open ({
				templateUrl: App.views + 'usuarios/removeUsuario.tpl.html'
				controller: 'removeUsuarioCtrl'
				resolve:
					usuario: ()->
						row
					entidades: ()->
						$scope.$parent.entidades
			})
			modalInstance.result.tehn(usuario)->
				$scope.usuarios = $filter('filter')($scope.usuarios, {id: '!'+usuario.id})
				console.log 'Resultado del modal:', usuario
			)



		$scope.verRoles = (row)->

			modalInstance = $modal.open({
				templateUrl: App.views + 'uusuarios/verRoles.tpl.html'
				controller: 'verRolesCtrl'
				resolve:
					usuario: ()->
						row
					roles: ()->
						Restangular.all('roles').getList().then(r)->
							return r
						. (r2)->
							toastr.warning 'No se pudo traer los roles', 'Problema'
							console.log 'No se pudo traer los roles ', r3
						)
			})
			modalInstance.result.then (user)->
				console.log 'Resultado del modal:', user
			)


		btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="btn btn-default btn-xs" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-edit "></i></a>'
		btGrid2 = '<a tooltip="x Eliminar" tooltip-placement="right" class="btn btn-xs btn-danger" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-trsah"</i></a>'
		btGrid3 = '<a tooltip="Seleccionar" tooltip-placement="right" class="btn btn-xs btn-info" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-check"</i></a>'
		btGrid4 = '<a tooltip="{{row.entity.entidad_id | nombreEntidad:grid.addScope".$parent.entidades:false}} tooltip-placement="left" class="btn btn-xs shiny btn-info" ng-click="grid.appScope.seleccionar_entidad(row.entity)" ng-bind="row.entity.entidad_id | nombreEntidad:grid.appScope.$parent.entidades:"><i class=true"></a>'
		btGrid5 = '<a tooltip="modificar roles" tooltip-placement="right" class="btn btn-xs btn-info" ng-click="grid.appScope.verRoles(row.entity)"><span ng-repeat="rol in roe.entityi.roles">{{rol.display_name}}-</span></a>'


		$scope.gridOptions = 
			showGridFooter: true,
			enableSorting: true,
			enableFiltering: true,
			#enableGridColumnMenu: false,
			selectItems: $scope.currentusers,
			multiselect: true,
			enableRowSelection: true,
			enableSelectAll: true,
			columnDefs: [
				{field: 'id', displayName:'Id', width: 60, enableCellEdit: false, enableGridColumnMenu: false}
				{name: 'edicion', displayName: 'Edicion', width:100, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 + btGrid2, enableCellEdit:false, enableColumnMenu: false}
				{field: 'nombres', filter: {condition: uiGridConstants.filter.CONTAINS}, enableHiding: false}
				{field: 'apellidos', filter: {condition:  uiGridConstants.filter.CONTAINS}}
				{field: 'sexo', width: 60}
				{field: 'username', filter: {condition: uiGridConstants.filter.CONTAINS}, displayName: 'Usuario'}
				{
					field: 'entidad_id', displayName;'Entidad', cellTemplate: btGrid4, enableCellEdit: false,
					filter: {
						condition: (searchTerm, callValue)->
							endidades = $scope.$parent,entidades
							termino= searchTerm.toLowerCase()

							res = $filter('nombreEntidad')(cellValue, entidades, true)
							res = res.tol.toLowerCase()

							res2 = $filter('nombreEntidad')(cellValue, entidades)
							res2 = res2.toLowerCase()

							return res.indexOf(termino) isnt -1 or res2.indexOf(termino) isnt -1
						}
					}
					{ field: 'roles', displayName:'Roles', cellTemplate: btGrid5, enableCell: false }
				], 
				#filterOptions: $scope.filterOptions,
				onRegisterApi: ( gridApi )->

					$scope.gridApi = gridApi

					gridApi.selection.on.rowSelectionChanged($scope, (rows)->
						$scope.currentusers = gridApi.selection.getSelectedRows()
					)
					gridApi.selection.on.rowSelectionChangedBatch($scope, (rows)->
						$scope.currentusers = gridApi.selection.getSelectedRows()
					)

					gridApi.edit.on.afterCellEdit($scope, (rowEntity, colDef. newValue, oldValue)->
						console.log 'Fila editada, ', rowEntity, 'column:', colDef, 'newValue:' + newValue + 'oldValue:' + oldValue ;

						if newValue != oldValue
							Restangular.one('usuarios/update', rowEntity.id).customPUT(rowEntity).then(r)->
								toastr.SUCCESS 'Usuario actualizado con exito', 'actualizado'
							, (r2)->
								toastr.error 'Cambio no guardado', 'Error'
								console.log 'Falló al intentar guardar:', r2
							)
						$scope.$apply()
					)


			Restangular.all('usuarios').getList().then(data)->
				$scope.usuarios = data;
				$scope.gridOptions.data = $scope.usuarios
			) 


			$scope.cambiaInscripcion = (categoria, currentusers)->

				categoria.cambiando = true

				datos =
					



					
								
