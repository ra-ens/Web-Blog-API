###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create articles table migration
###
module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Articles',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			title:
				type: Sequelize.STRING
				allowNull: false
			content:
				type: Sequelize.STRING
				allowNull: false
			image:
				type: Sequelize.STRING
				allowNull: false
			userId:
				type: Sequelize.INTEGER
				references:
					model: 'users'
					key: 'id'
			published:
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
		queryInterface.dropTable 'Articles'