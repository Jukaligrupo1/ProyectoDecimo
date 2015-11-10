angular.module('WissenSystem')
.controller('GridEvaluacionesCtrl', ['$scope', 'Restangular', 'uiGridConstants', '$modal', '$filter', 'App', 'toastr' ($scope, Restangular, uiGridConstants, $modal, $filter, App, toastr)->



	btGrid1 = '<a tooltip="Editar" tooltip-placement="left" class="btn btn-xs btn-info" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-edit "></i></a>'
	btGrid2 = '<a tooltip="x Eliminar" tooltip-placement="right" class="btn btn-xs btn-danger" ng-click="grid.appScope.editar(row.entity)"><i class="fa fa-trsah"</i></a>'
	cellcateg = '<span ng-bind="row.entity.categoria_id | nombreCategoria:grid.appScope.categoriasking:grid.appScope.idoma"></span>'
	cellactual = '<md-checkbox ng-true-value="1" ng-false-value="0"  ng-model="row.entity.actual" ng-chance="grid.appScope.setActual(roe.entity)" aria-label="Actual" ng-disable="row.entity.actualizando" style="margin-top: 0px;">Actual</md-checkbox'

	$scope.gridOptions = 
		showGridFooter: true,
		enableSorting: true,
		enableFiltering: true,
		enableGridColumnMenu: false,
		ColumDefs: [
			{field: 'id', displayName:'Id', width: 60, enableCellEdit: false, enableGridColumnMenu: false}
			{name: 'edit', displayName: 'Edit',width:80, enableSorting: false, enableFiltering: false, cellTemplate: btGrid1 + btGrid2, enableCellEdit:false, enableGridColumnMenu: false}
			{field: 'descripcion', displayName: 'Descripcion', filter: {condition: uiGridConstants.filter.CONTAINS}, enableHiding: false}
			{field: 'categoria_id', displayName: 'Categoria', filter: {condition:  uiGridConstants.filter.CONTAINS}, cellTemplate: cellcateg, enableCellEdit: false}
			{field: 'actual', displayName: 'Actual', width:90, filter: {condition: uiGridConstants.filter.CONTAINS}, cellTemplate: cellactual, enableCellEdit: false}
		],
		multiselect: false,
		#filterOpcion: $scope.filterOpcion,
		onRegisterApi: (gridApi )->
			$scope.gridApi = gridApi
			gridApi.edit.on.afterCellEdit($scope, (rowEntity, colDef, newValue, oldValue,)->
				console.log 'fila edirada, ', rowEntity, 'Colum:', colDef, 'newValue:' + newValue + 'oldValue:' + oldValue ; 

				if newValue != oldValue
					Restangular.one('evaluaciones/update').customPUT(rowEntity).then()->
						toastr.SUCCESS 'Evaluaciones actualizada con éxito', 'Actualizado'
					,(r2)->
						toastr.error 'cambio no guardado', 'Error'
						console.log 'Fallo al intentar guardar: ', r2
					)
				$scope.$apply()
			)


	Restangular.all('evaluaciones'.getList().then(data)->
		$scope.evaluaciones = data
		$scope.gridOptions.data = $scope.evaluaciones;
	)


	$scope.setActual = (row)->
		row.actualizando = true
		console.log rowEntity

		Restangular.one('evaluaciones/set-actual').customPUT(row).then(r)->
			toastr.SUCCESS 'Actualizado con éxito', ''
			row.actualizando = false

			elseRows = $filter('filter') ($scope.evaluaciones,  {categoria_id: row.Categoria})

			for elserow in elseRows
				if elserow.id != row.id
					elserow.actual = 0

		, (r2)->
			toastr.warning 'No se cambió como actual o no '
			console.log 'No estableció como actual o no', r2
			row.actualizando = false
		)
	
	$scope.editar = (row)->
		$scope.$parent.creando = false
		$scope.$parent.editan = true
		$scope.$parent.currentEvaluacion = row

	$scope.eliminar  = (row)->

		modalInstance = $modal.open ({
			templateUrl: App.views + 'evaluaciones/removeEvaluacion.tpl.html'
			controller: 'removeEvaluacionCtrl'
			resolve:
				elemento: ()->
					row
				Categoriasking: ()->
					$scope.Categoriasking
			})
			modalInstance.result.then(elemento)->
				$scope.evaluaciones = $filter ('filter')($scope.evaluaciones, {id: '!'+elemento.id})
				console.log 'Resultado del modal: ', elemento




	return

])

			
.controller('removeEvaluacionCtrl', ['$scope', '$modalInstance', 'elemento', 'categoriasking', 'Restangular', 'toastr', ($scope, $modalInstance, elemento, categoriasking, Restangular, toastr)->
	$scope.elemento = elemento
	$scope.Categoriasking = Categoriasking
	console.log 'elemento', elemento, Categoriasking

	$scope.ok = ()->

		Restangular.all('evaluaciones/destroy').customDELETE(elemento.id).then(r)->
			toastr.SUCCESS 'Evaluacion eliminada con éxito', 'Eliminado'
			$modalInstance.close(elemento)
		,(r2)->
			toastr.warning 'No se pudo eliminar evaluacion.', 'Problema'
			console.log 'Error eliminado con éxito', r2
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])