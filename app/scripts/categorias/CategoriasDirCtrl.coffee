angular.module('WissenSystem')

.controller('CategoriasDirCtrl', ['$scope', 'Restangular', 'toastr', '$modal', 'App', '$filter', ($scope, Restangular, toastr, $modal, App, $filter )->

	

	$scope.creando = false


	$scope.categorias_king =  []

	$scope.traer_categorias = ()->
		Restangular.ll('categorias/categoria-usuario').getList().then(r)->
			$scope.categorias_king = Restangular
			#console.log 'categoriastraidas', r
		, (r2)->
			toastr.warning 'no se trajeron las categorias' , 'problema'
			console.log 'no se trajo categorias' , r2
		)
	$scope.traer_categorias()

	$scope.$on ' cambio_evento:user', ()->
		$scope.traer_categorias()



	$scope.crear_categorias = ()->
		$scope.creando = true

		Restangular.one('categorias/store').customPOST().then(r)->
			r.editando = true
			$scope.categorias_king.push Restangular
			$scope.creando = false
			console.log 'categorias creada', r
		, (r2)->
			toastr.warning 'no se creo la categoria' , 'problema'
			console.log 'no se creo categoria' , r2
			$scope.crando = false
		)


	$scope.cerrar_edicion = ()->
		categoriaking.editando = false


		## Profe esto no lo muestra el video revisar#



	$scope.eliminarCategoria = (categoriaking)->

		modalInstance = $modal.open({
			templateUrl: App.views + 'categorias/removeCategoria,tpl.html'
			controller: 'removeCategoriaCtrl'
			resolve:
				elemento: ()->
					categoriaking
		})
		modalInstance = result.them ( (elemt)->
			$scope.categorias_king = $filter('filter')($scope.categorias_king, {id: '!'+elemento})
			console.log 'Resultado del modal', elemento
		)


	$scope.finalizar_edicion = (categoriaking)->
		$scope.guardando(categoriaking)
		categoriaking,editando = false

	$scope.guardando = (categoriaking)->
		Restangular.all('categorias/categoria-guardar').customPUT(categoriaking).then(r)->
			$scope.success = 'categoria guardada.'
			console.log 'categoria guardada', r
		, (r2)->
			toastr.warning 'no se pudo guardar la categoria' , 'problema'
			console.log 'no  se pudo guardar la categoria' , r2
		)


])



.controller('removeCategoriaCtrl', ['$scope', '$modalInstance' , 'elemento', 'Restangular', 'toastr',($scope, $modalInstance, elemento, Restangular, toastr) ->
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok = ()->

		Restangular.all('categorias/destroy').customDELETE(elemento.id).then(r)->
			toastr.success 'categoria eliminada con exito.', 'eliminado'
			$modalInstance.close(elemento)
		, (r2) ->
			toastr.warning 'no se pudo cambiar el elemento', 'problema'
			console.log ' no se pudo cambiar el elemento'
			$modalInstance.dismiss('Error')
		)


	$scope.cancel = ()->
		$modalInstance.dismiss('cancel')

])

















		##{
			##id: 1
			##nombre: 'MtNi'
			##nivel_id: 1
			##disciplina_id: 1
			##evento_id:1
			##categorias_traducidas: [
				##{
					##id: 1
					##nombre: 'Matemáticas Niños'
					##abrev: 'MaNi'
					##categoria_id: 1
					##descripcion: ''
					##idioma_id: 1
				##},
				##{
					##id: 2
					##nombre: 'Matematics Children'
					##abrev: 'MathCh'
					##categoria_id: 1
					##descripcion: ''
					##idioma_id: 2
				##}
			##]
		##},
		##{
			##id: 2
			##nombre: 'MtAd'
			##nivel_id: 2
			##disciplina_id: 1
			##evento_id:1
			##categorias_traducidas: [
				##{
					##id: 3
					##nombre: 'Matematicas Adultos'
					##abrev: 'MatAd'
					##categoria_id: 2
					##descripcion: ''
					##idioma_id: 1
				##},
				##{
					##id: 4
					##nombre: 'Matematics Adults'
					##abrev: 'MathAd'
					##categoria_id: 2
					##descripcion: ''
					##idioma_id: 2
				##}
			##]
		##}
	##]


	##$scope.disciplinas_king =  [
		##{
			##id: 1
			##nombre: 'Matemáticas'
			##disciplinas_traducidas: [
				##{
					##nombre: 'Matemáticas'
					##idioma_id: 1
					##idioma: 'Español'
					##disciplina_id: 1
					##descripcion: 'Matemáticas'
					##traducido: false
				##},
				##{
					##nombre: 'Math'
					######idioma_id: 2
					####idioma: 'English'
					##disciplina_id: 1
					##descripcion: 'Math'
					##traducido: true
				##}
			##]
		####},
		##{
			##id: 2
			##nombre: 'Sociales'
			##disciplinas_traducidas: [
				##{
					##nombre: 'Sociales'
					##idioma_id: 1
					##idioma: 'Español'
					##disciplina_id: 2
					##descripcion: 'Sociales'
					##traducido: false
				##},
				##{
					##nombre: 'Social science'
					##idioma_id: 2
					##idioma: 'English'
					##disciplina_id: 2
					##descripcion: 'Social science'
					##traducido: true
				##}
			##]
		##}
	##]


	##$scope.niveles_king =  [
		##{
			##id: 1
			##nombre: 'Niños'
			##niveles_traducidos: [
				##{
					##nombre: 'Niños'
					##idioma_id: 1
					##idioma: 'Español'
					##nivel_id: 1
					##descripcion: 'Para menores'
					##traducido: false
				##},
				##{
					##nombre: 'Children'
					##idioma_id: 2
					##idioma: 'English'
					##nivel_id: 1
					##descripcion: 'For childrens'
					##traducido: true
				##}
			##]
		##},
		##{
			####id: 2
			##nombre: 'Adultos'
			##niveles_traducidos: [
				##{
					##nombre: 'Adultos'
					##idioma_id: 1
					##idioma: 'Español'
					##nivel_id: 2
					##descripcion: 'Para hombres mayores'
					##traducido: false
				##},
				##{
					##nombre: 'Adults'
					#idioma_id: 2
					##idioma: 'English'
					##nivel_id: 2
					##descripcion: 'For greater men'
					##traducido: true
				##}
			##]
		##}
	##]



	##$scope.editarCategoria = (categoria)->
		##categoria.editando = true 

	##$scope.eliminarCategoria = (categoria)->
		#categoria.editando = true 

	##$scope.finalizar_edicion = (categoria)->
		##categoria.editando = false  
		


##])