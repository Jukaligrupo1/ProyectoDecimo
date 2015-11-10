'use strict'

angular.module('WissenSystem')
	.config ['$stateProvider', 'App', 'USER_ROLES', 'PERMISSIONS', '$translateProvider', ($state, App, USER_ROLES, PERMISSIONS, $translateProvider) ->

		$state
			.state('panel', { #- Estado admin.
				url: '/panel'
				views:
					'principal':
						templateUrl: "#{App.views}panel/panel.tpl.html"
						controller: 'PanelCtrl'
				resolve: { 
					resolved_user: ['AuthService', (AuthService)->
						AuthService.verificar()
					]
				}
				data: 
					pageTitle: 'WissenSystem - Bienvenido'
			})


		$translateProvider.preferredLanguage('ES');


		$translateProvider.translations('EN', 
			INICIO_MENU: 'Home'
			USERS_MENU: 'Users'
			EVENTS_MENU:'Events'
			ENTIDADES_MENU: 'Entities'
			CATEGORIAS_MENU: 'Categories'
			PREGUNTAS_MENU: 'Questions'
			EVALUACIONES_MENU:'Questions'
			IDIOMA_MENU: 'Language'
		)
		.translations('ES',
			INICIO_MENU: 'Inicio'
			EVENTS_MENU:'Eventos'
			ENTIDADES_MENU:'Entidades'
			CATEGORIAS_MENU:'Categorias'
			PREGUNTAS_MENU: 'Preguntas'
			EVALUACIONES_MENU:'Evaluaciones'
			USERS_MENU:'Usuarios'
			IDIOMA_MENU: 'Idioma'
			SELECCIONE_EVENTO: 'Selecciona el evento que deseas'
			ELIMINATORIAS: 'Eliminatorias'
			GRAN_FINAL: 'Gran final'
			INSCRITO_EN: 'Esta inscrito en:'
			EXAM_HECHOS: 'Examanes hechos'
			
		)
		.translations('PR',
			INICIO_MENU: 'Iniciação'
			EVENTS_MENU:'Eventos'
			ENTIDADES_MENU:'Entidades'
			CATEGORIAS_MENU:'Categorias'
			PREGUNTAS_MENU: 'Interrogatório'
			EVALUACIONES_MENU:'Evaluations'
			USERS_MENU:'Usuários'
			IDIOMA_MENU: 'Língua'
			SELECCIONE_EVENTO: 'Escolher'
			ELIMINATORIAS: "Playoffs"
			GRAN_FINAL: 'Grand Final'
			INSCRITO_EN: 'Join In'
			EXAM_HECHOS: 'Exames Facts'
			SELECCIONA_EL_EVENTO_QUE_DESEAS_PANEL: "Escolha um Evento que Você Quer"
			EVENTOS_PANEL: 'Eventos'
			ACTUAL_PANEL: 'Atual'
			ESTABLECER_COMO_EVENTO_ACTUAL_PANEL: 'Eventos Conjunto Real'
			PERFIL_PANEL: 'Perfil'
			CONFIGURACION_PANEL: 'Configuração'
			IMAGENES_PANEL: 'Imagens'
			SALIR_PANEL: 'Deixar'
			CONSTRUCCION_PANEL: 'Construção'

			
		)

		return
	]
