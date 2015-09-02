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
						#AuthService.verificar()
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
			CATEGORIAS_MENU: 'Categs'
			IDIOMA_MENU: 'Language'
			PREGUNTAS_MENU: 'Questions'
			CONSTRUCCION_MENU: 'Building'

		)
		.translations('ES',
			INICIO_MENU: 'Inicio'
			USERS_MENU: 'Usuarios'
			EVENTS_MENU:'Eventos'
			CATEGORIAS_MENU: 'Categorias'
			IDIOMA_MENU: 'Idioma'
			PREGUNTAS_MENU: 'Preguntas'
			CONSTRUCCION_MENU: 'Construcción'			

		 )

		return
	]
