###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

bcrypt	= require 'bcrypt'
config 	= require '../../config'

###
	Article model
###
module.exports = (sequelize, DataTypes) ->

	# define the model
	sequelize.define 'Article',
		title:
			type: DataTypes.STRING
			allowNull: false
			validate:
				isAlpha: true
		content:
			type: DataTypes.STRING
			allowNull: false
			validate:
				isAlphanumeric: true
		image:
			type: DataTypes.STRING
			allowNull: false
			validate:
				isUrl: true
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