###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

# return system configuration
module.exports =

	server:
		host: "localhost"
		port: 8000

	db:
		dialect: "mysql"
		host: "localhost"
		port: 3306
		username: "root"
		password: ""
		dbName: "web-blog-api"

	jwt:
		secret: "this is my secret"

	bcrypt:
		salt: 10