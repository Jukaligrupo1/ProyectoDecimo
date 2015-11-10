angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.eventos', 
			url: '^/eventos'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}eventos/eventos.tpl.html"
					controller: 'EventosCtrl'

				data:
					pageTitle: 'Eventos'
		)


		.state('panel.eventos_user', 
			url: '/eventos_user'
			templateUrl: 'views/eventos/eventos_user.tpl.html'
			controller: 'EventosUserCtrl'
		)


	$translateProvider.translations('EN', 
		EVENTS_TITLE: 'Events'
		CREAR_EVENTO: 'create event '
	)
	.translations('ES',
		EVENTS_TITLE: 'Eventos'
		CREAR_EVENTO: 'create event '
	)
	.translations('PR',
		EVENTS_TITLE: 'Eventos'
		CREAR_EVENTO: 'Criar evento '		
		NUEVO_ENTIDADES:'novo'
		NOMBRE_ENTIDADES:'Nom'
		CAMPO_OBLIGATORIO_ENTIDADES:'campo Obrigatório'
		ALIAS_ENTIDADES:'Pseudônimo'
		DESCRIPCIÓN_ENTIDADES:'Descrição'
		EXAMEN_ACTUAL_ENTIDADES:'Revisão Atual'
		PARA_PRUEBAS_ENTIDADES:'Teste'
		PARA_LA_FINAL_ENTIDADES:'Para Final'
		CON_PAGO_ENTIDADES:'Pagar'
		PRECIO_1_ENTIDADES:'Preço 1'
		PRECIO_2_ENTIDADES:'Preço 2'
		PRECIO_3_ENTIDADES:'preço 3'
		PRECIO_4_ENTIDADES:'preço 4'
		EVENTO_ACTUAL_ENTIDADES:'Current Events'
		HABILITAR_CHAT_PÚBLICO_ENTIDADES:'Ativar as Conversas Públicas'
		HABILITAR_CHAT_PRIVADO_ENTIDADES:'Ativar as Conversas Privadas'
		USAR_IDIOMA_UNICO_ENTIDADES:'Somente o Uso da Língua'
		IDIOMA_PRINCIPAL_ENTIDADES:'Início Idioma'
		IDIOMASEXTRAS_ENTIDADES:'Extras Idiomas'
		GUARDAR_ENTIDADES:'Salvar'
		CANCELAR_ENTIDADES:'Cancelar'
		SEGURO_DESEA_ELIMINAR_EVENTO:'Claro, você quer Excluir'
		EVENTO_EVENTO:'Evento'
		ELIMINAR_EVENTO:'Remover'
		CANCELAR_REMOVE_EVENTO:'Cancelar'


	)




])