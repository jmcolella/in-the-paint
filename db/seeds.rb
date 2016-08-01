# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command NBA::Player.get_player(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'nba_api_wrapper'

# set the team id as the api_id
NBA::Stats::Team.get_teams.each do |team|
	Team.create(id: team[0], name: team[1])
end


NBA::Player.get_all_players['resultSets'][0]["rowSet"].each do |player|
	Player.create(
		id: player[0],
		name: player[2],
		team_id: player[7]
	)
end

players = Player.all

players.each do |player|
	NBA::Player.get_player(player.id)['resultSets'][0]["rowSet"].each do |details|
		player.position = details[14]
		player.number = details[13]
		player.height = details[10]
		player.weight = details[11]
	end
	NBA::Player.get_player(player.id)["resultSets"][1]["rowSet"].each do |info|
		player.average_points = info[3]
		player.average_assists = info[4]
		player.average_rebounds = info[5]
	end
	player.save
end
