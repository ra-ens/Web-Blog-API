###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

faker 		= require 'faker'

###
	Create article tags demo data
###
module.exports = (articles, articleStartId, tags, tagStartId, min, max) ->
	# generate tags ids
	tagsIds = Array.from length: tags.length, (_, i) -> tagStartId + i
	# demo data container
	demoData = []
	# create tags for each article
	for i, article of articles
		# get random number between min and max
		count = faker.datatype.number min:min, max:max
		# get random tags
		randomTags = tagsIds.sort(() -> Math.random() - Math.random()).slice 0, count
		# generate tags
		for j in [0..count-1]
			demoData.push
				articleId: parseInt(articleStartId) + parseInt(i)
				tagId: randomTags[j]
				status: true
				createdAt: article.createdAt
				updatedAt: faker.date.future 1, article.createdAt
	
	# return generated data
	return demoData