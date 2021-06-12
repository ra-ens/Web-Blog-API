###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

jwt			= require 'jsonwebtoken'
config 		= require '../../config'
{ User } 	= require '../models'

###
	Authentify a user
###
module.exports.signin = (req, res) ->
	# find user
	user = await User.findOne where: email: req.body.email
	# user found and password verified
	if user and user.passwordVerify req.body.password
		# create token
		token = jwt.sign id:user.id, config.jwt.secret
		# send response
		res.json
			auth: true
			message: "User authenticated successfully"
			token: token
			user:
				id: user.id
				firstName: user.firstName
				lastName: user.lastName
	else
		# when no user found or incorrect password
		res.status(401).json
			auth: false
			message: "Email or password is incorrect"
	return