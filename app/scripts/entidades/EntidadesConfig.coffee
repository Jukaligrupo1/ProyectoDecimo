angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.entidades', 
			url: '^/entidades'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}entidades/entidades.tpl.html"
					controller: 'EntidadesCtrl'

				data:
					pageTitle: 'Entidades'
		)



	$translateProvider.translations('EN', 
		ENTIDADES_MENU: 'Entities'
	)
	.translations('ES',
		ENTIDADES_MENU: 'Entidades'
	)
	.translations('PR',
		ENTIDADES_MENU: 'Entidades'
		CREAR_NUEVO_ENTIDADES:'Criar Novas'
		NOMBRE_ENTIDADES:'Nome'
		SELECCIONAR_LÍDER_ENTIDADES:'Escolha um Líder'
		LOGO_ENTIDADES:'Logotipo'
		GUARDAR_ENTIDADES:'Salvar'
		CANCELAR_ENTIDADES:'Cancelar'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE:'Claro, você quer Excluir'
		ENTIDAD_REMOVE:'Endidate'
		ELIMINAR_REMOVE:'Remover'
		CANCELAR_REMOVE:'Cancelar'


	)


])