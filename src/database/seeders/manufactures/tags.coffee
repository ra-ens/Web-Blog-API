###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker 		= require 'faker'

###
	Create tags demo data
###
module.exports = (number) ->

	# demo data container
	demoData = []
	# create articles for each user
	for i in [0..number-1]
		demoData.push
			name: faker.lorem.words 3 
			status: true
			createdAt: createdDate = faker.date.between new Date('01-01-2000'), new Date()
			updatedAt: faker.date.future 1, createdDate
	
	# return generated data
	return demoData