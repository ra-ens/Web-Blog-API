###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

authController 	= require '../app/controllers/authController'

# export
module.exports = (router) ->

	# register route
	router.post '/signup', authController.signup

	# login route
	router.post '/signin', authController.signin