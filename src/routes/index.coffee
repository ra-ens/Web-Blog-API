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

# authentication routes
require('./authRouter')(publicRouter)
# user routes
require('./userRouter')(privateRouter)

# protect privateRouter with authentication middleware
privateRouter.use authMiddleware

# define 404 route
# publicRouter.all '*', (req, res) ->
# 	res.status(404).json
# 		message: "Route not found"

# export routers
module.exports =
	private: privateRouter
	public: publicRouter