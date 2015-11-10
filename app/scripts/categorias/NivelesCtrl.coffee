angular.module('WissenSystem')

.controller('NivelesCtrl', ['$scope', 'Restangular', 'toastr', '$modal', 'App', '$filter', ($scope, Restangular, toastr, $modal, App, $filter )->

	
	$scope.creando = false


	$scope.niveles_king =  []

	$scope.traer_niveles = ()->
		Restangular.all('niveles/niveles-usuario').getList().then(r)->
			$scope.niveles_king = r
			#cosole.log 'Niveles traidos', r
		,(r)->
			toastr.warning 'No se trajeron los niveñes', 'problema'
			console.log 'No se trajo niveles', r2
		)
	$scope.traer_niveles()

	$scope.$on 'cambio_evento_user', ()->
		$scope.traer_niveles()



	$scope.crear_nivel = ()->
		$scope.crando = true

		Restangular.one('nivel/store').customPOST().them(r)->
			r.editando = true
			$scope.niveles_king.push r
			$scope.creando =  false
			console.log 'nivel creado', r
		, (r)->
			toastr.warning 'No se creo el nivel', 'problema'
			console.log 'No se creo nivel', r2
			$scope.creando = false
		)


	$scope.cerrar_edicion = (nivelking)->
		nivelking.editando = false


	$scope.editarNivel = (nivelking)->
		nivelking.editando = true


	$scope.eliminarNivel = (nivelking)->

		modalIntance.$modal.open({
			templateUrl: App.views + 'categorias/removeNivel.tpl.html'
			controller: ' removeNivelCtrl'
			resolve:
				elemento: ()->
					nivelking
		})
		modalIntance.result.them(elem)->
			$scope.niveles_king= $filter('filter')($scope.niveles_king, {id: '!'+ele,,}
			console.log 'resultado del modal', alem
		)


	$scope.finalizar_edicion = (nivelking)->
		$scopeguardando(nivelking)
		nivelking.editando = false

	$scope.guardando =(nivelking)->
		Restangular.all('niveles/guardar').costomPUT(disciplinaking).them(r)->
			toastr.success 'nivel guardada'
			console.log 'nivel guardada:', 

		. (r2)->
			toastr.warning 'No se pudo guardar el nivel', 'problema'
			console-log 'no se puede guardar el nivel',  r2
		)

])



.controller('RemoveNivelCtrl', ['$scope', '$modalIntance', 'elemento', 'Restangular','toastr'($scope, $modalIntance, elemento, Restangular, toastr )->
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok=()->

		Restangular.all('niveles/destroy').customDELETE(elemento.id).then(r)->
			toastr.success 'Nivel eliminado con exito', 'eliminado'
			$modalIntance.close(elemento)
		,(r2)->
			toastr.warning 'No sse pudo eliminar el elemento', 'problema'
			console.log 'Error eliminado elemento', r2
			$modalIntance.dismiss('Error')
		)


	$scope.cancel=()->
		$modalIntance.dismiss('cancel')

])





































		#	{
		#	id: 1
		#	nombre: 'Niños'
		#	niveles_traducidos: [
		#		{
		#			nombre: 'Niños'
		#			idioma_id: 1
		#			idioma: 'Español'
		#			nivel_id: 1
		#			descripcion: 'Para menores'
		#			traducido: false
		#		},
		#		{
		#			nombre: 'Children'
		#			idioma_id: 2
		#			idioma: 'English'
		#			nivel_id: 1
		#			descripcion: 'For childrens'
		#			traducido: true
		#		}
		#	]
		#},
		# {
		#	id: 2
		#	nombre: 'Adultos'
		#	niveles_traducidos: [
		#		{
		#			nombre: 'Adultos'
		#			idioma_id: 1
		#			idioma: 'Español'
		#			nivel_id: 2
		#			descripcion: 'Para hombres mayores'
		#			traducido: false
		#		},
		#		{
		#			nombre: 'Adults'
#					idioma_id: 2
#					idioma: 'English'
#					nivel_id: 2
#					descripcion: 'For greater men'
##					traducido: true
##				}
##			]
##		}
##	]
##
#
#
#	$scope.editarNivel = (nivel)->
#		nivel.editando = true 
#
#	$scope.eliminarNivel = (nivel)->
#		#nivel.editando = true 
#
#	$scope.finalizar_edicion = (nivel)->
#		nivel.editando = false  
#
#
#])