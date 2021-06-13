###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

{ User } 	= require '../models'

###
	Get all users or filtred list if offset and limit are provided
###
module.exports.getUsers = (req, res) ->
	# get users from database
	users = await User.findAll offset: req.params.offset, limit: req.params.limit
	# return users list
	res.json users

###
	Get user by id
###
module.exports.getUserById = (req, res) ->
	# get user from data base with given id
	user = await User.findByPk req.params.id
	# return user
	res.json user

###
	Register a new user
###
module.exports.addUser = (req, res) ->
	# add user to database
	User.create req.body
		.then () ->
			# if user created successfully
			res.json message: 'User created successfully'
			return
		.catch (exp) ->
			if exp.name is 'SequelizeValidationError'
				res.status(400).json
					message: 'Data validation error'
					errors: exp.errors.map (err) -> err.message
			else
				res.staus(500).json
					message: 'Server error occured'
			return
	return

###
	Update a given user data
###
module.exports.updateUser = (req, res) ->
	# update user information
	User.update req.body, where: id: req.params.id
		.then () ->
			res.json message: "User updated successfully"
			return
		.catch (exp) ->
			if exp.name is 'SequelizeValidationError'
				res.status(400).json
					message: 'Data validation error'
					errors: exp.errors.map (err) -> err.message
			else
				res.staus(500).json
					message: 'Server error occured'
			return	
	return

###
	Delete user by given id
###
module.exports.deleteUser = (req, res) ->
	# delete user by id
	deleted = await User.destroy where: id: req.params.id
	# if user deleted
	if deleted
		res.json
			message: "User deleted successfully"
	else
		res.status(500).json
			message: "User not found"