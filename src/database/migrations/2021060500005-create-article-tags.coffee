###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create article-tags table migration
###
module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Article-tags',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			articleId:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'Articles'
					key: 'id'
			tagId:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'Tags'
					key: 'id'
			status:
				allowNull: false
				type: Sequelize.BOOLEAN
				defaultValue: true
			createdAt:
				allowNull: false
				type: Sequelize.DATE
			updatedAt:
				allowNull: false
				type: Sequelize.DATE

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Article-tags'