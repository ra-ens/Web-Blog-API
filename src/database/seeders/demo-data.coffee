###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

userManufacture 	= require './manufactures/users'
articleManufacure 	= require './manufactures/articles'


###
	Create articles demo data
###
module.exports =
	up: (queryInterface, Sequelize) ->

		# generate users data
		users = do userManufacture
		# insert users data
		userStartId = await queryInterface.bulkInsert 'Users', users
		# generate articles data
		articles = articleManufacure users, parseInt userStartId
		# inset articles data
		await queryInterface.bulkInsert 'Articles', articles
		
		return

	down: (queryInterface, Sequelize) ->
		queryInterface.bulkDelete 'Articles'
		return