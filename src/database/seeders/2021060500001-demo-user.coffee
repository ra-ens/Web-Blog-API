###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker = require 'faker'

###
	Create demo data for user
###
module.exports =
	up: (queryInterface, Sequelize) ->

		# demo data container
		demoData = []

		# generate data
		for i in [0..20]
			demoData.push
				firstName: do faker.name.firstName
				lastName: do faker.name.lastName
				email: do faker.internet.email
				password: '123'
				phone: faker.phone.phoneNumber '0#########'
				city: do faker.address.cityName
				country: do faker.address.country
				role: if i is 0 then 'admin' else if i%3 is 0 then 'guest' else 'author'


		# add data to database
		queryInterface.bulkInsert 'Users', demoData

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Sale-attachments'