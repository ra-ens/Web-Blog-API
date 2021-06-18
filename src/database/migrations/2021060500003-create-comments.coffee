###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create comments table migration
###
module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Comments',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			parent:
				allowNull: true
				type: Sequelize.INTEGER
				references:
					model: 'Comments'
					key: 'id'
			content:
				allowNull: false
				type: Sequelize.STRING
			articleId:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'Articles'
					key: 'id'
			userId:
				allowNull: false
				type: Sequelize.INTEGER
				references:
					model: 'Users'
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
		queryInterface.dropTable 'Comments'