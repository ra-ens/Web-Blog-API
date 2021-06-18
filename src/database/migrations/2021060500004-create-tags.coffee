###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create tags table migration
###
module.exports =
	up: (queryInterface, Sequelize) ->
		queryInterface.createTable 'Tags',
			id:
				allowNull: false
				autoIncrement: true
				primaryKey: true
				type: Sequelize.INTEGER
			name:
				allowNull: false
				type: Sequelize.STRING
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
		queryInterface.dropTable 'Tags'