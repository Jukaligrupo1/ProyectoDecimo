angular.module('WissenSystem')

.controller('EditPreguntaCtrl', ['$scope', '$http', 'Restangular', '$state', '$cookies', '$rootScope', 'toastr', 
	($scope, $http, Restangular, $state, $cookies, $rootScope, toastr) ->

		$scope.eventoactualselec = parseInt($scope.eventoactualselec)

		$scope.idiomaPreg = [$scope.eventoactualselec]


		$scope.editorOptions = 
			inlineMode: true
			placeholder: ''


		$scope.mostrarConfiguracion = flase
		$scope.mostrarConfig = ()->
			$scope.mostrarConfiguracion = !$scope.mostrarConfiguracion


		$scope.cerrarEdicion = ()->
			$scope.preguntaking.editando = false


		$scope.finalizarEdicion = ()->
			$scope.$emit 'finalizaEdicionPreg'


			Restangular.one('preguntas/update').customPUT($scope.preguntaking).then((r)->
				console.log('Cambios guardados' , r)
				$scope.preguntaking.editando = false
				toast.SUCCESS 'Cambios guardados con éxito'
			, (r2)->
				console.log('No se pudo guardar los cambios')
				 toast.warning 'Cambios no guardados', 'Problemas'
			)	
			console.log 'Guardando cambios ...'


		$scope.aplicarCambios = ()->
			Restangular.one('preguntas/update').customPUT($scope.preguntaking).then((r)->
				console.log('Cambios guardados' , r)
				toast.SUCCESS 'Cambios guardados con éxito'
			, (r2)->
				console.log('No se pudo guardar los cambios')
				 toast.warning 'Cambios no guardados', 'Problemas'

			)
			console.log 'Guardando cambios ...'



		$scope.cambiaTipoPregunta = ()->
			console.log ' Cambio el tipo: ', $scope.preguntaking.tipo_pregunta

			$scope.$broadcast 'cambiaTipoPregunta'


		return
	]
)
			

##











		#$scope.idiomas = [
		#	{	
		#		id: 1
		#		nombre: 'Español'
		#		abrev: 'ES'
		#		original: 'Español'
		#		is_main: true
		#	},
		#	{	
		#		id: 2
		#		nombre: 'Inglés'
		#		abrev: 'EN'
		#		original: 'English'
		#		is_main: false
		#	}
		#]
		#$scope.idiomaPreg = [1]



		#$scope.editorOptions = 
		#	inlineMode: true
		#	placeholder: ''



		#$scope.sortableOptions =
		#	'ui-floating': true
			
		
		##$scope.inicializar = ()->

		##	for preg in $scope.preguntaking.preguntas_traducidas
##
		#		for opci in preg.opciones
		##			if opci.nueva
		##				return

		##		newOpcion = 
		##			id: -1
		##			definicion: 'Agregar nueva opción'
		##			nueva: true
		##			is_correct: false
		##		
		##		preg.opciones.push newOpcion

		#$scope.inicializar()

		#$scope.saveOption = (preg, opt)->
		#	opt.preg_id = preg.id
		#	opt.nueva = false
		#	console.log('Opción guardada')
		#	# {opt}
		#	Restangular.one('api/pregunta_king/update').customPOST().then((r)->
		#		console.log('Opción guardada')
		#	, (r2)->
		#		console.log('No se pudo guardar la opción')
		#	)
		#	
#
		#	Restangular.one('api/pregunta_king').customGET().then((r)->
		#		console.log 'Lo logré!!', r
		#	(r2)->
		#		console.log 'Pailas con el origin'
		#	)
			

		#$scope.addButtonNewOpcion = (preg, opt)->
		#	if opt.nueva
		#		opt.definicion = 'Opción ' + preg.opciones.length
		#		$scope.saveOption(preg, opt)
		#		tempOpcion = 
		#			id: -1
		#			definicion: 'Agregar nueva opción'
		#			nueva: true
		#			is_correct: false
		#		preg.opciones.push tempOpcion

		
		#$scope.setAsCorrect = (preg, opt)->
		#	if $scope.preguntaking.tipo_pregunta == 'Test'
		#		angular.forEach preg.opciones, (opcion)->
		#			opcion.is_correct = false
#
		#		opt.is_correct = true

		#$scope.finalizarEdicion = ()->
		#	$scope.$emit 'finalizaEdicionPreg'
		#	$scope.preguntaking.editando = false

		#$scope.aplicarCambios = ()->
		#	Restangular.one('pregunta_king/update/1').customPUT({definicion: 'Esta es una definición'}).then((r)->
		#		console.log('Cambios guardados')
		#	, (r2)->
		#		console.log('No se pudo guardar los cambios')
		#	)
		#	console.log 'Guardando cambios...'

		
		#$scope.deleteOption = (preg, opt, indice)->
		#	opt.preg_id = preg.id
#
		#	'''
		#	Restangular.one('option', {opt}).customDELETE().then((r)->
		#		console.log('Opción eliminada')
		#	, (r2)->
		#		console.log('No se pudo eliminar la opción')
		#	)
		#	'''
		#	preg.opciones.splice indice, 1
#
		#	toast = $mdToast.simple()
		#		.content('Opción eliminada!')
		#		.action('OK')
		#		.highlightAction(false)
		#		.position('top right');
		#	$mdToast.show(toast)

	#	return
#	]
#



##.filter('porIdiomasEdit', [ ->
	##(input, idiomas) ->
		
	##	resultado = []

	##	for idioma in idiomas

		##	idioma = parseFloat(idioma)
	
		##	for elemento in input

			#	idioma_id = parseFloat(elemento.idioma_id)
				
			#	if idioma == idioma_id
			#		resultado.push elemento

	#	return resultado
#])


