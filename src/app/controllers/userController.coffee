###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

{ User } 	= require '../models'
Validator 	= require 'validatorjs'
bcrypt		= require 'bcrypt'
config 		= require '../../config'

module.exports=

	
	# get user by id from database
	getUserById: (id) ->
		return await User.findByPk req.params.id

	# return all users list
	getAllUsers: () ->
		return do User.findAll
	
	# get list of users from offset
	getUsers: (offset=0, limit=0) ->
		return User.findAll offset: offset, limit: limit
	
	# get user by role
	getUserByRole: (role) ->
		return User.findAll where: role: role
	
	# get list of admins
	getAdmins: () ->
		return getUserByRole 'admin'
	
	# get list of authors
	getAuthors: () ->
		return getUserByRole 'author'
	
	# get list of guests
	getGuests: () ->
		return getUserByRole 'guest'
	
	# get user by email
	getUserByEmail: (email) ->
		return findOne email: email
	
	# add user
	addUser: (data) ->
		# user validation rules
		userRules =
			firstName: 'required|string'
			lastName: 'required|string'
			email: 'required|email'
			password: 'required|min:5'
			phone: 'size:10'
			city: 'string'
			country: 'string'

		# validate request data
		validation = new Validator data, userRules

		# when data not validated
		unless do validation.passes
			res =
				status: 400
				message: "Data errors"
				errors: do validation.errors.all
				errorCount: validation.errorCount

		# data are validated
		else
			# check if user already registred
			user = await User.findOne where: email: data.email
			# user not found
			unless user
				# hash given password
				data.password = bcrypt.hashSync data.password, config.bcrypt.salt
				# add user to database
				user = await User.create data
				# check if user created
				if user
					res =
						status: 200
						message: "User created successfully"
			# user found
			else
				res =
					status: 401
					message: "Email already exists"
					
		# return respons
		return res