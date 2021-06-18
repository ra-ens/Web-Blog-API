###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker = require 'faker'

###
	Create users demo data
###
module.exports = (number) ->

	# demo data container
	demoData = []
	# generate data
	for i in [0..number-1]
		demoData.push
			firstName: do faker.name.firstName
			lastName: do faker.name.lastName
			email: do faker.internet.email
			password: '$2b$10$OaZ8sKOtUmWwqZEGRBbl4eRzjaR2xWjMctMc915wAiaeYUysKb87m' # 123
			phone: faker.phone.phoneNumber '06########'
			city: do faker.address.cityName
			country: do faker.address.country
			role: faker.helpers.randomize ['admin', 'guest', 'author']
			createdAt: createdDate = faker.date.between new Date('01-01-2000'), new Date()
			updatedAt: faker.date.future 1, createdDate

	# return created data
	return demoData
