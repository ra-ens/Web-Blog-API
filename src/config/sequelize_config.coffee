###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

path 	= require 'path'
config 	= require './index'

module.exports =

	development:
		username: config.db.username
		password: config.db.password
		database: config.db.dbName
		host: config.db.host
		port: config.db.port
		dialect: config.db.dialect
		dialectOptions:
			bigNumberStrings: true
		# Use a different storage type
		migrationStorage: 'json',
		# Use a different file name
		migrationStoragePath: path.join __dirname, '../database/sequelize-meta.json',

	production:
		username: config.db.username
		password: config.db.password
		database: config.db.dbName
		host: config.db.host
		port: config.db.port
		dialect: config.db.dialect
		dialectOptions:
			bigNumberStrings: true