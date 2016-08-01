# This API does four things.
# Firstly it takes all the teams provided and pushes them into the Team database by setting the API-team-id to our internal team.id and it does the same for the team name.
# Secondly it takes the player id, name and team_id and sets it to our player database.
# Third, it takes the player we assigned and sets their position, number, height and weight
# Finally it does the same for the player averages.


require 'nba_api_wrapper'

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
