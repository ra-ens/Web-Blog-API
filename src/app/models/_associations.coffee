###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###


###
	Tables associations definition
###
module.exports = (Models) ->

	# User - Articles assocations
	Models.User.hasMany Models.Article
	Models.Article.belongsTo Models.User

	# Article - Comment
	Models.Article.hasMany Models.Comment
	Models.Comment.belongsTo Models.Article

	# User - Comment
	Models.User.hasMany Models.Comment
	Models.Comment.belongsTo Models.User

	# Article - Tag
	Models.Article.belongsToMany Models.Tag, through: 'article-targs'
	Models.Tag.belongsToMany Models.Article, through: 'article-tags'