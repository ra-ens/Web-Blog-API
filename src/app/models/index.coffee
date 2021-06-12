###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

path 			= require 'path'
fs 				= require 'fs'
{ DataTypes } 	= require 'sequelize'
{ sequelize } 	= require '../../database'
associate 		= require './_associations'

# models container
models = {}

# read all models directory files
files = fs.readdirSync(__dirname).filter (file) ->
	# exclude index file
	return file.indexOf('.') isnt 0 and file isnt path.basename(__filename) and !file.startsWith('_') and file.slice(-3) is '.js'

# when error occured
unless files
	return console.error 'An error occured while reading models', err

# add models to model object
for file in files
	# add models to models container
	model = require(path.join __dirname, file)(sequelize, DataTypes)
	models[model.name] = model

# define associations
associate models

# export models
module.exports = models