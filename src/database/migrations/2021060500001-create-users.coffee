###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create users table migration
###
module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Users',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			firstName:
				type: Sequelize.STRING
				allowNull: false
			lastName:
				type: Sequelize.STRING
				allowNull: false
			email:
				type: Sequelize.STRING
				allowNull: false
			password:
				type: Sequelize.STRING
				allowNull: false
			phone:
				type: Sequelize.STRING 10
			city:
				type: Sequelize.STRING
			country:
				type: Sequelize.STRING
			role:
				allowNull: false
				type: Sequelize.STRING
				defaultValue: 'guest'
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
		queryInterface.dropTable 'Users'