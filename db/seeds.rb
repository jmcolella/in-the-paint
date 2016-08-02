# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command NBA::Player.get_player(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'nba_api_wrapper'

NBA::Stats::Team.get_teams.each do |team|
	Team.create(api_id: team[0], name: team[1])
end

Team.all.each do |team|
	NBA::Player.get_all_players['resultSets'][0]["rowSet"].each do |player|
		if team.api_id == player[7]
			Player.create(
				api_id: player[0],
				name: player[2],
				team_id: team.id
			)
		end
	end
end

Player.all.each do |player|
	NBA::Player.get_player(player.api_id)['resultSets'][0]["rowSet"].each do |details|
		player.update_attributes(position: details[14], number: details[13], height: details[10], weight: details[11])
	end
	NBA::Player.get_player(player.api_id)["resultSets"][1]["rowSet"].each do |info|
		player.update_attributes(average_points: info[3], average_assists: info[4], average_rebounds: info[5])
	end
end
