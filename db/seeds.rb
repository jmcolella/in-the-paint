# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command NBA::Player.get_player(or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nba_api_wrapper'

NBA::Stats::Team.get_teams.each { |team| Team.create(name: team[1], team_id: team[0]) }

Team.all.each do |team|
	NBA::Player.get_all_players['resultSets'][0]['rowSet'].each do |player|
		if team[0] == player[7]
			team.players.create(
				name: NBA::Player.get_player(player[0])['resultSets'][1]['rowSet'][0][1], 
				position: NBA::Player.get_player(player[0])['resultSets'][0]['rowSet'][0][14], 
				team_id: NBA::Player.get_player(player[0])['resultSets'][0]['rowSet'][0][16], 
				number: NBA::Player.get_player(player[0])['resultSets'][0]['rowSet'][0][13], 
				height: NBA::Player.get_player(player[0])['resultSets'][0]['rowSet'][0][10], 
				weight: NBA::Player.get_player(player[0])['resultSets'][0]['rowSet'][0][11], 
				average_points: NBA::Player.get_player(player[0])['resultSets'][1]['rowSet'][0][3], 
				average_assists: NBA::Player.get_player(player[0])['resultSets'][1]['rowSet'][0][4], 
				average_rebounds: NBA::Player.get_player(player[0])['resultSets'][1]['rowSet'][0][5]
				)
		end
	end
end

