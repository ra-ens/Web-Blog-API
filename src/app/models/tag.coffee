###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Tags model
###
module.exports = (sequelize, DataTypes) ->

	# define the model
	sequelize.define 'Tag',
		name:
			allowNull: false
			type: DataTypes.STRING
			validate:
				isAlphanumeric: true
		status:
			allowNull: false
			type: DataTypes.BOOLEAN
			defaultValue: true
		createdAt:
			allowNull: false
			type: DataTypes.DATE
		updatedAt:
			allowNull: false
			type: DataTypes.DATE