angular.module('WissenSystem')

.config (['App','$stateProvider', '$translateProvider', (App, $stateProvider, $translateProvider)->
		
	$stateProvider
		.state('panel.categorias', 
			url: '^/categorias'
			views:
				'contenido_panel':
					templateUrl: "#{App.views}categorias/categorias.tpl.html"
					controller: 'CategoriasCtrl'

				data:
					pageTitle: 'Categorias'
		)



	$translateProvider.translations('EN', 
		CATEGORIAS_TITLE: 'Categs'
		NIVELES_TITLE: 'Levels'
		DISCIPLINA_TITLE: 'Disciplines'
	)
	.translations('ES',
		CATEGORIAS_TITLE: 'Categorias'
		NIVELES_TITLE: 'Niveles'
		DISCIPLINA_TITLE: 'Disciplinas'
	)
	.translations('PR',
		CATEGORIAS_TITLE: 'Categorias'
		NIVELES_TITLE: 'Niveles'
		DISCIPLINA_TITLE: 'Disciplinas'
		EDITAR_CATEGORIAS: 'Ediat Categorias'
		ELIMINAR_CATEGORIAS: 'Remover Categorias'
		EDITAR_CATEGORIA_EN_IDIOMAS: 'Categorias Editar Língua'
		TRADUCIDO_CATEGORIAS: 'Categorias Traduzidos'
		CERRAR_CATEGORIAS: 'Criar Categorias'
		APLICAR_CATEGORIAS: 'Aplicar Categorias'
		FINALIZAR_CATEGORIAS: 'Categoria Final'
		CREAR_CATEGORIA: 'Criar Categoria'
		EDITAR_DISCIPLINA: 'Editar Disciplina'
		ELIMINAR_DISCIPLINA: 'Eliminar Disciplina'
		EDITAR_DISCIPLINA_EN_IDIOMAS: 'Língua Remover Disciplina'
		DISCIPLINA_EN: 'Disciplina'
		NOMBRE_NIVEL: 'Nível Nome'
		DESCRIPCION_DISCIPLINA: 'Descrição Disciplina'
		TRADUCIDO_DISCIPLINA: 'Disciplina Traduzido'
		CERRAR_DISCIPLINA: 'Perto Disciplina'
		APLICAR_DISCIPLINA: 'Aplicar a Disciplina'
		FINALIZAR_DISCIPLINA: 'Disciplina Final'
		CREAR_DISCIPLINA: 'Criar Disciplina'
		EDITAR_NIVEL: 'Editar Nível'
		ELIMINAR_NIVEL: 'Remover Nível'
		EDITAR_NIVEL_EN_IDIOMAS: 'Linguagens de Edição de Nível'
		NIVEL_EN: 'Nível'
		NOMBRE_NIVEL: 'Nível Nome'
		DESCRIPCIÓN_NIVEL: 'Descrição Nível'
		TRADUCIDO_NIVEL: 'Nível Traduzidos'
		CERRAR_NIVEL: 'Nível de Fechamento'
		APLICAR_NIVEL: 'Aplicar Nivel'
		FINALIZAR_NIVEL: 'Nivel Final'
		CREAR_NIVEL: 'Criar um Nível'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_CATEGORIA: 'Remover Certeza de que Deseja Excluir Categoria'
		CATEGORIAS_REMOVE_CATEGORIA: 'Remover Categoria Categorias'
		ELIMINAR_REMOVE_CATEGORIA: 'Remover Categoria Remove'
		CANCELAR_REMOVE_CATEGORIA: 'Remover Cancelar Categoria'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_DISCIPLINA: 'Remover Certeza de que Deseja Excluir Disciplina'
		CATEGORIAS_REMOVE_DISCIPLINA: 'Remover Disciplina Categorias'
		ELIMINAR_REMOVE_DISCIPLINA: 'Remover Remover Disciplina'
		CANCELAR_REMOVE_DISCIPLINA: 'Remover Cancelar Disciplina'
		SEGURO_QUE_DESEA_ELIMINAR_REMOVE_NIVEL: 'Remover certeza de que quer apagar nível'
		CATEGORIAS_REMOVE_NIVEL: 'Remover Categoria de Nível'
		ELIMINAR_REMOVE_NIVEL: 'Remover Nível Remove'
		CANCELAR_REMOVE_NIVEL: 'Remover Cancelar Nível'




	)


])