###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		June 2021
###

###
	Create demo data for pharmacies
###

module.exports =
	up: (queryInterface, Sequelize) ->

		# create demo data
		demoData = []
		cities = ["Fez","Tangier","Marrakesh","Salé","Meknes","Rabat","Oujda","Kenitra"]
		cord = [
				longitude: 31.6450271
				latitude: -7.9889703
			,
				longitude: 31.6540752
				latitude: -7.9955977
			,
				longitude: 31.6448553
				latitude: -8.0116763
			,
				longitude: 31.6337242
				latitude: -8.0137297
			,
				longitude: 31.6217731
				latitude: -8.0071646
			,
				longitude: 31.6188537
				latitude: -7.983246
			,
				longitude: 31.6181156
				latitude: -7.9639804
			,
				longitude: 31.6318514
				latitude: -7.9508216
		]
		i = 0
		while i < 8
			demoData.push
				name: "Pharmacie #{++i}"
				addresse: 'example city'
				email: 'example@example.com'
				webSite: 'example.com'
				phone: '0524569875'
				city: 'Marrakech'
				country: 'Morocco'
				longitude: cord[i-1].latitude
				latitude: cord[i-1].longitude
				status: 1
				createdAt: new Date()
				updatedAt: new Date()

		# add data to database
		queryInterface.bulkInsert 'Pharmacies', demoData

	down: (queryInterface, Sequelize) ->
		queryInterface.dropTable 'Sale-attachments'