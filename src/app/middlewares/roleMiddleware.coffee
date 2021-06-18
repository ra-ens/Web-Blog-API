###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###


module.exports = (roles) ->
	return (req, res, next) ->
		
		# check user roles is in allowed roles
		if (typeof roles == 'string' and req.user.role != roles) or not roles.includes req.user.role
			res.status(403).json
				message: 'Access denied'
		else
			do next