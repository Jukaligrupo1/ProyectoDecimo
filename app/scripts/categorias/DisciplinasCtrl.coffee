angular.module('WissenSystem')

.controller('DisciplinasCtrl', ['$scope', 'Restangular', 'toastr', '$modal', 'App', '$filter', ($scope, Restangular, toastr, $modal, App, $filter )->


	$scope.creando = false


	$scope.disciplinas_king =  []

	$scope.traer_disciplinas = ()->
		Restangular.all('disciplinas/disciplinas_usuaria').getList().them(r)->
			$scope.disciplinas_king = Restangular
			#console.log 'Disciplinas traidas', r
		,(r2) ->
			toastr.warning 'No se trajeron las disciplinas', 'problema'
			console.log  'No se trajeron las disciplinas', r2
		)
	$scope.traer_disciplinas()

	$scope.$on 'cambio_evento_user', ()->
		$scope.traer_disciplinas()



	$scope.crear_disciplina = ()->
		$scope.crando = true

		Restangular.one('disciplinas/store').customPOST().them(r)->
			r.editando = true
			$scope.disciplinas_king.push r
			$scope.creando =  false
			console.log 'disciplina creada', r
		, (r)->
			toastr.warning 'No se creo la disciplina', 'problema'
			console.log 'No se creo disciplina', r2
			$scope.creando = true
		)


	$scope.cerrar_edicion = (disciplinaking)->
		disciplinaking.editando = false


	$scope.editarDisciplina = (disciplinaking)->
		disciplinaking.editando = true


	$scope.eliminarDisciplina = (disciplinaking)->

		modalIntance.$modal.open({
			templateUrl: App.views + 'categorias/removeDisciplina.tpl.html'
			controller: ' removeDisciplinaCtrl'
			resolve:
				elemento: ()->
					disciplinaking
		})
		modalIntance.result.them(elem)->
			$scope.disciplinas_king= $filter('filter')($scope.disciplinas_king, {id: '!'+ele,,}
			console.log 'resultado del modal', alem
		)


	$scope.finalizar_edicion = (disciplinaking)->
		$scopeguardando(disciplinaking)
		disciplinaking.editando = false

	$scope.guardando =(disciplinaking)->
		Restangular.all('disciplinas/guardar').costomPUT(disciplinaking).them(r)->
			toastr.success 'disciplina guardada'
			console.log 'Disciplinas guardada:', 

		. (r2)->
			toastr.warning 'No se pudo guardar la disciplina', 'problema'
			console-log 'no se puede guardar la disciplina',  r2
		)

])



.controller('RemoveDisciplinaCtrl', ['$scope', '$modalIntance', 'elemento', 'Restangular'])
	$scope.elemento = elemento
	console.log 'elemento', elemento

	$scope.ok=()->

		Restangular.all('disciplinas/destroy').customDELETE(elemento.id).then(r)->
			toastr.success 'Disciplinas eliminada con exito', 'eliminado'
			$modalIntance.close(elemento)
		,(r2)->
			toastr.warning 'No sse pudo eliminar el elemento', 'problema'
			console.log 'Error eliminado elemento', r2
			$modalIntance.dismiss('Error')
		)


	$scope.cancel=()->
		$modalIntance.dismiss('cancel')

])




















































		##{
		#	id: 1
		#	nombre: 'Matemáticas'
		#	disciplinas_traducidas: [
		#		{
		#			nombre: 'Matemáticas'
		#			idioma_id: 1
		#			idioma: 'Español'
		#			disciplina_id: 1
		#			descripcion: 'Matemáticas'
		#			traducido: false
		#		},
		#		{
		#			nombre: 'Math'
		#			idioma_id: 2
		#			idioma: 'English'
		#			disciplina_id: 1
		#			descripcion: 'Math'
		#			traducido: true
		#		}
		#	]
		#},
		#{
		#	id: 2
		#	nombre: 'Sociales'
		#	disciplinas_traducidas: [
		#		{
		#			nombre: 'Sociales'
		#			idioma_id: 1
		#			idioma: 'Español'
		#			disciplina_id: 2
		#			descripcion: 'Sociales'
		#			traducido: false
		#		},
		#		{
		#			nombre: 'Geografy'
		##			idioma_id: 2
		##			idioma: 'English'
		##			disciplina_id: 2
		##			descripcion: 'Geografy'
		##			traducido: true
		##		}
		#	]
		##}
	#]


	#$scope.editarDisciplina = (disciplina)->
	#	disciplina.editando = true 
#
	#$scope.eliminarDisciplina = (disciplina)->
	#	#disciplina.editando = true 

	#$scope.finalizar_edicion = (disciplina)->
	#	disciplina.editando = false  


#])