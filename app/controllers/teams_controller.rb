class TeamsController < ApplicationController

	def index
		@teams = Team.all

		render json: { teams: @teams }
	end

	def show
		@team = Team.find(params[:id])
		@players = @team.players

		render json: { players: @players}
	end
end
