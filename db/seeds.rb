# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command NBA::Player.get_player(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

api = JSON.parse( open( "https://api.sportradar.us/nba-t3/league/hierarchy.json?api_key=wenvqgm9ps95rydu9e6peyyf" ).read )

api['conferences'][0]['divisions'].each do |division|
		division['teams'].each do |team|
			Team.create( name: team['name'],
									 market: team['market'],
									 abbr: team['alias'],
									 api_id: team['id'],
									 division: division['name'],
									 conference: api['conferences'][0]['name'] )
	end
end

api['conferences'][1]['divisions'].each do |division|
		division['teams'].each do |team|
			Team.create( name: team['name'],
									 market: team['market'],
									 abbr: team['alias'],
									 api_id: team['id'],
									 division: division['name'],
									 conference: api['conferences'][0]['name'] )
	end
end

Team.all.each do |team|
	if team.id == 1
		team.update(logo: 'http://i.imgur.com/b3J4PrC.png')
	elsif team.id == 2
		team.update(logo: 'http://i.imgur.com/ucdy9Is.png')
	elsif team.id == 3
		team.update(logo: 'http://i.imgur.com/JTgwDWz.png')
	elsif team.id == 4
		team.update(logo: 'http://i.imgur.com/GMMiKzS.png')
	elsif team.id == 5
		team.update(logo: 'http://i.imgur.com/iGnleJK.png')
	elsif team.id == 6
		team.update(logo: 'http://i.imgur.com/XjuhIVr.png')
	elsif team.id == 7
		team.update(logo: 'http://i.imgur.com/UdVSWdB.png')
	elsif team.id == 8
		team.update(logo: 'http://i.imgur.com/GRfTPTa.png')
	elsif team.id == 9
		team.update(logo: 'http://i.imgur.com/eVcrWea.png')
	elsif team.id == 10
		team.update(logo: 'http://i.imgur.com/MZaM0vC.png')
	elsif team.id == 11
		team.update(logo: 'http://i.imgur.com/7a8kEvW.png')
	elsif team.id == 12
		team.update(logo: 'http://i.imgur.com/D7h3hWW.png')
	elsif team.id == 13
		team.update(logo: 'http://i.imgur.com/EUyWaWK.png')
	elsif team.id == 14
		team.update(logo: 'http://i.imgur.com/6jQu1AT.png')
	elsif team.id == 15
		team.update(logo: 'http://i.imgur.com/3VH3D8y.png')
	elsif team.id == 16
		team.update(logo: 'http://i.imgur.com/qsvtWEr.png')
	elsif team.id == 17
		team.update(logo: 'http://i.imgur.com/l5HYfQT.png')
	elsif team.id == 18
		team.update(logo: 'http://i.imgur.com/XILmK9v.png')
	elsif team.id == 19
		team.update(logo: 'http://i.imgur.com/RSPJ72s.png')
	elsif team.id == 20
		team.update(logo: 'http://i.imgur.com/m0PMtEz.png')
	elsif team.id == 21
		team.update(logo: 'http://i.imgur.com/C4EcOVY.png')
	elsif team.id == 22
		team.update(logo: 'http://i.imgur.com/6U2bM7Q.png')
	elsif team.id == 23
		team.update(logo: 'http://i.imgur.com/ICPsP7i.png')
	elsif team.id == 24
		team.update(logo: 'http://i.imgur.com/3llv0xP.png')
	elsif team.id == 25
		team.update(logo: 'http://i.imgur.com/DiAn3KI.png')
	elsif team.id == 26
		team.update(logo: 'http://i.imgur.com/GBN6Ey2.png')
	elsif team.id == 27
		team.update(logo: 'http://i.imgur.com/Mrth0g8.png')
	elsif team.id == 28
		team.update(logo: 'http://i.imgur.com/YOsEhNq.png')
	elsif team.id == 29
		team.update(logo: 'http://i.imgur.com/EtON2zD.png')
	elsif team.id == 30
		team.update(logo: 'http://i.imgur.com/ozgPmRz.png')
	end
end

Team.all.each do |team|
	url = "https://api.sportradar.us/nba-t3/teams/" + team.api_id + "/profile.json?api_key=wenvqgm9ps95rydu9e6peyyf"
	sleep(2)
	api_team = JSON.parse( open( url ).read )

	api_team['players'].each do |player|
			Player.create!( name: player['full_name'],
										 position: player['primary_postion'],
										 api_id: player['id'],
										 height: player['height'],
										 weight: player['weight'],
										 team_id: team.id )
	end
end

100.times do
	User.create!( username: Faker::Internet.user_name,
								email: Faker::Internet.email,
								password: 'password',
								team_id: rand(1..30) )
end

200.times do
	Article.create!( title: Faker::Lorem.sentence,
									 body: Faker::Lorem.paragraph(2),
									 team_id: rand(1..30),
									 user_id: rand(1..100) )
end

200.times do
	Comment.create!( body: Faker::Lorem.sentence,
									 user_id: rand(1..100),
									 article_id: rand(1..200) )
end

# OLD API SEED INFORMATION
# require 'nba_api_wrapper'

# NBA::Stats::Team.get_teams.each do |team|
# 	Team.create(api_id: team[0], name: team[1])
# end

# Team.all.each do |team|
# 	NBA::Player.get_all_players['resultSets'][0]["rowSet"].each do |player|
# 		if team.api_id == player[7]
# 			Player.create(
# 				api_id: player[0],
# 				name: player[2],
# 				team_id: team.id
# 			)
# 		end
# 	end
# end

# Player.all.each do |player|
# 	NBA::Player.get_player(player.api_id)['resultSets'][0]["rowSet"].each do |details|
# 		player.update_attributes(position: details[14], number: details[13], height: details[10], weight: details[11])
# 	end
# 	NBA::Player.get_player(player.api_id)["resultSets"][1]["rowSet"].each do |info|
# 		player.update_attributes(average_points: info[3], average_assists: info[4], average_rebounds: info[5])
# 	end
# end
