###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker 		= require 'faker'

###
	Create article comments demo data
###
module.exports = (users, userStartId, articles, articleStartId, min, max) ->
	# generate users ids
	usersIds = Array.from length: users.length, (_, i) -> userStartId + i
	# demo data container
	demoData = []
	# create comments for each article
	for i, article of articles
		# get random number between min and max for number of comments
		count = faker.datatype.number min:min, max:max
		unless count is 0
			# get random users ids
			randomUsers = usersIds.sort(() -> Math.random() - Math.random()).slice 0, count
			# generate commnets
			for j in [0..count-1]
				demoData.push
					content: do faker.lorem.text
					articleId: parseInt(articleStartId) + parseInt(i)
					userId: randomUsers[j]
					status: true
					createdAt: createdDate = faker.date.between article.createdAt, new Date()
					updatedAt: faker.date.future 1, createdDate
	
	# return generated data
	return demoData