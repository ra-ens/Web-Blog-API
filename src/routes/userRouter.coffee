###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

userController 	= require '../app/controllers/userController'
checkRole		= require '../app/middlewares/roleMiddleware'

# export
module.exports = (router) ->

	# add new user
	router.post '/user', checkRole('admin'), userController.addUser

	router.route '/user/:id(\\d+)', checkRole('admin')
		# return a user by given id
		.get userController.getUserById
		# update given user by id
		.put userController.updateUser
		# delete user by given id
		.delete userController.deleteUser
	
	return