class TeamsController < ApplicationController

	def index
		@teams = Team.all

		render json: { teams: @teams }
	end

	def show
		@team = Team.find(params[:id])
		@players = @team.players
    @articles = @team.articles

		render json: { team: @team, players: @players, articles: @articles}
	end
end
