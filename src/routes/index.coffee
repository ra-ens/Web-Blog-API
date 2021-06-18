###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

{ Router }		= require 'express'
authMiddleware 	= require '../app/middlewares/authMiddleware'

publicRouter 	= do Router
privateRouter 	= do Router

module.exports = (app) ->

	# authentication routes
	require('./authRouter')(publicRouter)
	# user routes
	require('./userRouter')(privateRouter)

	# set app routers
	app.use '/api', publicRouter
	# protect privateRouter with authentication middleware
	app.use '/api', authMiddleware, privateRouter