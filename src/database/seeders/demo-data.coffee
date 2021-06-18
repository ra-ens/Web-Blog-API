###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

userManufacture 		= require './manufactures/users'
articleManufacure 		= require './manufactures/articles'
tagsManufature 			= require './manufactures/tags'
articleTagsManufature 	= require './manufactures/article-tags'
commentManufacture 		= require './manufactures/comments'


###
	Create articles demo data
###
module.exports =
	up: (queryInterface, Sequelize) ->

		# generate users data
		users = userManufacture 20
		# insert users data
		userStartId = await queryInterface.bulkInsert 'Users', users
		# generate articles data
		articles = articleManufacure users, parseInt userStartId
		# inset articles data
		articleStartId = await queryInterface.bulkInsert 'Articles', articles
		# generate tags
		tags = tagsManufature 10
		# insert tags
		tagStartId = await queryInterface.bulkInsert 'Tags', tags
		# generate article-tags
		articleTags = articleTagsManufature articles, articleStartId, tags, tagStartId, 2, 6
		# insert article tags
		await queryInterface.bulkInsert 'Article-tags', articleTags
		# generate articles comments
		comments = commentManufacture users, userStartId, articles, articleStartId, 0, 10
		# insert comments
		await queryInterface.bulkInsert 'Comments', comments
		
		return

	down: (queryInterface, Sequelize) ->
		queryInterface.bulkDelete 'Articles'
		return