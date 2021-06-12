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

	# User has many articles
	Models.User.hasMany Models.Article

	# Article belong to one user
	Models.Article.belongsTo Models.User