###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###


###
	User model
###
module.exports = (sequelize, DataTypes) ->

	# define the model
	sequelize.define 'User',
		firstName:
			type: DataTypes.STRING
			allowNull: false
		lastName:
			type: DataTypes.STRING
			allowNull: false
		email:
			type: DataTypes.STRING
			allowNull: false
		password:
			type: DataTypes.STRING
			allowNull: false
		phone:
			type: DataTypes.STRING 10
		city:
			type: DataTypes.STRING
		country:
			type: DataTypes.STRING
		avatar:
			type: DataTypes.INTEGER
		role:
			allowNull: false
			type: DataTypes.STRING
			defaultValue: 'user'
		pharmacy:
			type: DataTypes.INTEGER
		createdAt:
			allowNull: false
			type: DataTypes.DATE
		updatedAt:
			allowNull: false
			type: DataTypes.DATE