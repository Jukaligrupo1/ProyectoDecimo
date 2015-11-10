angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.evaluaciones', 
			url: '^/evaluaciones'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}evaluaciones/evaluaciones.tpl.html"
					controller: 'EvaluacionesCtrl'

				data:
					pageTitle: 'Eventos'
		)



	$translateProvider.translations('EN', 
		ENTIDADES_TITLE: 'Test'
	)
	.translations('ES',
		ENTIDADES_TITLE: 'Evaluaciones'
	)
	.translations('PR',
		ENTIDADES_TITLE: 'Evaluations'
		CREAR_NUEVO_EVALUACION:'Criar uma Nova'
		NUEVA_EVALUACION:'Reavaliação'
		DESCRIPCION_EVALUACION:'Description'
		CATEGORIA_EVALUACION:'Catégorie'
		ACTUAL_EVALUACION:'Actual'
		SERA_LA_EVALUACION_EVALUACION:"L'Sera Avaliação"
		DURACION_POR_PREGUNTAS_EVALUACION:'Tempo Para as Questões'
		DURACION_POR_EXAMEN_EVALUACION:"Duração do Exame"
		DURACION_POR_PREGUNTA_EVALUACION:'Por Período de Perguntas'
		RESPONDER_UNA_POR_UNA_EVALUACION:'Uma por Uma Resposta'
		RESPONDER_UNA_POR_UNA_O_TODAS_LAS_PREGUNTAS_EVALUACION: ' A Responder a Todos Para um ou Perguntas'
		CANCELAR_EVALUACION:'Cancelar'
		GUARDAR_EVALUACION:'Salvar'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_EVALUACIONES:'Claro que Você Deseja Excluir'
		ELIMINAR_REMOVE_EVALUACIONES:'Remover'
		CANCELAR:'Cancelar'

	)



])