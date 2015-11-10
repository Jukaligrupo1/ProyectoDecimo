angular.module('WissenSystem')

.config(['$stateProvider', 'App', 'PERMISSIONS', '$translateProvider', ($stateProvider, App, PERMISSIONS, $translateProvider)->

	$stateProvider
		.state('panel.usuarios', { #- Estado admin.
			url: '^/usuarios'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}usuarios/usuarios.tpl.html"
					controller: 'UsuariosCtrl'

				data: 
					pageTitle: 'Usuarios'
					need_permissions: [PERMISSIONS.can_edit_usuarios]
		})

	$translateProvider.translations('EN', 
		BUSCAR_PLACEHOLDER: 'Find',
		TIP_BTN__NUEVA_PREGUNTA: 'Create a new question'
		BTN_NUEVA_PREGUNTA: 'New question'
	)
	.translations('EN', 
		BUSCAR_PLACEHOLDER: 'Find',
		TIP_BTN__NUEVA_PREGUNTA: 'Create a new question'
		BTN_NUEVA_PREGUNTA: 'New question'
	)
	.translations('PR', 
		NUEVO_USUARIOS: 'Novo'
		NOMBRE_USUARIOS: 'Nome'
		CAMPO_OBLIGATORIO_USUARIOS: 'Campo Obrigatório'
		APELLIDOS_USUARIOS: 'Nome'
		SEXO_USUARIOS: 'Sex'
		MASCULINO_USUARIOS: 'macho'
		FEMENINO_USUARIOS: 'Mulher'
		USERNAME_USUARIOS: 'Username'
		EMAIL_USUARIOS: 'E-mail'
		CELULAR_USUARIOS: 'Célula'
		EDAD_USUARIOS: 'Idade'
		INSCRIBIR_EN_USUARIOS: 'Entrar Você'
		MATEMÁTICAS_A_USUARIOS: 'Matemática A'
		MATEMÁTICAS_B_USUARIOS: 'Matemática B'
		MATEMÁTICAS_C_USUARIOS: 'Matemática C'
		ESPAÑOL_A_USUARIOS: 'Espanhol A'
		ESPAÑOL_B_USUARIOS: 'Espanhol B'
		GUARDAR_USUARIOS: 'Salvar'
		CANCELAR_USUARIOS: 'Cancelar'
		USUARIOS_USUARIOS:  'Usuários'
	)

])