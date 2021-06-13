###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

{ Article } = require '../../models'

###
	Get all articles or filtred list if offset and limit are provided
###
module.exports.getArticles = (req, res) ->
	# get articles
	articles = await Article.findAll offset: req.params.offset, limit: req.params.limit
	# return article list
	res.json articles

###
	Get article by id
###
module.exports.getArticleById = (req, res) ->
	# get article from data base with given id
	article = await Article.findByPk req.params.id
	# return article
	res.json article

###
	Register a new article
###
module.exports.addArticle = (req, res) ->
	# add article to database
	Article.create req.body
		.then () ->
			# if article created successfully
			res.json message: 'Article created successfully'
			return
		.catch (exp) ->
			if exp.name is 'SequelizeValidationError'
				res.status(400).json
					message: 'Data validation error'
					errors: exp.errors.map (err) -> err.message
			else
				res.staus(500).json
					message: 'Server error occured'
			return
	return

###
	Update a given article data
###
module.exports.updateArticle = (req, res) ->
	# update article information
	Article.update req.body, where: id: req.params.id
		.then () ->
			res.json message: "Article updated successfully"
			return
		.catch (exp) ->
			if exp.name is 'SequelizeValidationError'
				res.status(400).json
					message: 'Data validation error'
					errors: exp.errors.map (err) -> err.message
			else
				res.staus(500).json
					message: 'Server error occured'
			return	
	return

###
	Delete article by given id
###
module.exports.deleteArticle = (req, res) ->
	# delete article by id
	deleted = await Article.destroy where: id: req.params.id
	# if article deleted
	if deleted
		res.json
			message: "Article deleted successfully"
	else
		res.status(500).json
			message: "Article not found"