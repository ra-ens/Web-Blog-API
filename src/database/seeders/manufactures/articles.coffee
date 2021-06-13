###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker 		= require 'faker'

###
	Create articles demo data
###
module.exports = (users, userStartId) ->

	# demo data container
	demoData = []
	# create articles for each user
	for i, user of users
		# get random number between 1 and 9
		count = faker.datatype.number min:1, max:9
		# generate articles
		for j in [0..count]
			demoData.push
				title: do faker.lorem.sentence
				content: do faker.lorem.text
				image: faker.image.image 640, 480, true
				userId: parseInt(userStartId) + parseInt(i)
				status: true
				createdAt: createdDate = faker.date.between user.createdAt, new Date()
				updatedAt: faker.date.future 1, createdDate
	
	# return generated data
	return demoData