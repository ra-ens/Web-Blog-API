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
	User model
###
module.exports = (sequelize, DataTypes) ->

	# define the model
	User = sequelize.define 'User',
			firstName:
				type: DataTypes.STRING
				allowNull: false
			lastName:
				type: DataTypes.STRING
				allowNull: false
			email:
				type: DataTypes.STRING
				allowNull: false
				validate:
					isEmail: true
			password:
				type: DataTypes.STRING
				allowNull: false
				validate:
					min: 5
			phone:
				type: DataTypes.STRING 10
				validate:
					is: /^0[567][0-9]{8}$/
			city:
				type: DataTypes.STRING
				validate:
					isAlpha: true
			country:
				type: DataTypes.STRING
				validate:
					isAlpha: true
			role:
				allowNull: false
				type: DataTypes.STRING 6
				defaultValue: 'guest'
				validate:
					isIn: [['admin', 'author', 'guest']]
			createdAt:
				allowNull: false
				type: DataTypes.DATE
			updatedAt:
				allowNull: false
				type: DataTypes.DATE
		,
			hooks:
				beforeCreate: (user) ->
					# hash user password
					user.password = bcrypt.hashSync user.password, config.bcrypt.salt
					return

	# add password verify function to User proto
	User.prototype.passwordVerify = (password) ->
		# check given password with current user password
		return bcrypt.compareSync password, @password
	
	# return user Model
	return User