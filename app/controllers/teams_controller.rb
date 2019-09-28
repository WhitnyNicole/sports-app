class TeamsController < ApplicationController

    def index
        teams = Team.all

        render json: teams 
    end

    def show
        team = Team.find(params[:id])

        render json: team 
    end 

    def create
        team = Team.new(team_params)
        if team.save 
            render json: team 
        else
            render json: {status: 500, message: "Team could not be created"}
        end 
    end

    def update
        team = Team.find(params[:id])

        if team.update(team_params)
            render json: team
        else
            render json: {status: 500, message: "Team could not be updated"}
        end 
    end 
    
    def destroy
        team = Team.find(params[:id])

        if team.destroy 
            render json: team.id
        else
            render json: {status: 500, message: "Team could not be deleted"}
        end
    end 

    
    private
        def team_params
            params.require(:team).permit(:name, :sport, :num_of_players)
        end

        def set_team
            team = Team.find(params[:id])
        end 
end
