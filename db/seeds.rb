# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nba_api_wrapper'

NBA::Stats::Team.get_teams.each { |team| Team.create(name: team[1], team_id: team[0]) }

def get_player(param) 
	NBA::Player.get_player(param)
end

Team.all.each do |t|
	NBA::Player.get_all_players['resultSets'][0]['rowSet'][0].each do |p|
		Player.create(
			name: get_player((p[0])['resultSets'][1]['rowSet'][0][1]), 
			position: get_player(p[0])['resultSets'][0]['rowSet'][0][14], 
			team_id: get_player(p[0])['resultSets'][0]['rowSet'][0][16], 
			number: get_player(p[0])['resultSets'][0]['rowSet'][0][13], 
			height: get_player(p[0])['resultSets'][0]['rowSet'][0][10], 
			weight: get_player(p[0])['resultSets'][0]['rowSet'][0][11], 
			average_points: get_player(p[0])['resultSets'][1]['rowSet'][0][3], 
			average_assists: get_player(p[0])['resultSets'][1]['rowSet'][0][4], 
			average_rebounds: get_player(p[0])['resultSets'][1]['rowSet'][0][5]
			) unless t.team_id != p[7]
	end
end

