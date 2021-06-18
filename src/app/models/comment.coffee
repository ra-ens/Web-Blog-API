###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Comments model
###
module.exports = (sequelize, DataTypes) ->

	# define the model
	sequelize.define 'Comment',
		parent:
			allowNull: true
			type: DataTypes.INTEGER
		content:
			allowNull: false
			type: DataTypes.STRING
			validate:
				isAlphanumeric: true
		articleId:
			allowNull: false
			type: DataTypes.INTEGER
		userId:
			allowNull: false
			type: DataTypes.INTEGER
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