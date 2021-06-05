###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

Validator 	= require 'validatorjs'
bcrypt		= require 'bcrypt'
jwt			= require 'jsonwebtoken'
config 		= require '../../config'
{ User } 	= require '../models'

# create new user
module.exports.signup = (req, res) ->

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
	validation = new Validator req.body, userRules

	# when data not validated
	unless do validation.passes
		res.status(400).json
			message: "Data errors"
			errors: do validation.errors.all
			errorCount: validation.errorCount

	# data are validated
	else
		# check if user already registred
		user = await User.findOne where: email: req.body.email
		# user not found
		unless user
			# hash given password
			req.body.password = bcrypt.hashSync req.body.password, config.bcrypt.salt
			# add user to database
			user = await User.create req.body
			# check if user created
			if user
				res.status(200).json
					message: "User created successfully"
		# user found
		else
			res.status(401).json
				message: "Email already exists"	
	return

# authentify a user
module.exports.signin = (req, res) ->

	# find user
	user = await User.findOne where: email: req.body.email
	# user found
	if user
		# check user password
		if bcrypt.compareSync req.body.password, user.password
			# create token
			token = jwt.sign id:user.id, config.jwt.secret
			# send response
			res.status(200).json
				auth: true
				message: "User authenticated successfully"
				token: token
				user:
					firstName: user.firstName
					lastName: user.lastName
			return
	# if error occured
	res.status(401).json
		auth: false
		message: "Email or password is incorrect"