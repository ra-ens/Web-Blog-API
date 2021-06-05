###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

{ User } 	= require '../models'


module.exports.getUserById = (req, res) ->

	# get user from database
	user = await User.findByPk req.params.id

	# check if user found
	if user
		res.status(200).json
			user:
				firstName: user.firstName
				lastName: user.lastName
	else
		res.status(404).json
			message: "User not found"