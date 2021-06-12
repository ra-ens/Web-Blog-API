###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

authController 	= require '../app/controllers/authController'
userController 	= require '../app/controllers/userController'

# export
module.exports = (router) ->

	router.post '/signup', userController.addUser
	# login route
	router.post '/signin', authController.signin