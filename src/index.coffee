###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

express	= require 'express'
app		= do express
cors 	= require 'cors'

config	= require './config'
db		= require('./database')(config.db)
routes	= require './routes'

# use bodyParser for requests params
app.use express.urlencoded extended:true

# use bodyParser for JSON
app.use do express.json

# enable cors polycies
app.use do cors

# set public routes
app.use '/api', routes.public
# set private routes
app.use '/api', routes.private

# start server
app.listen config.server.port, ->
	console.log "Server started on #{config.server.host}:#{config.server.port}"
	return