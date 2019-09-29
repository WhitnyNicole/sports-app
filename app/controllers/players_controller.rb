class PlayersController < ApplicationController

    def index
        players = Player.all

        render json: players 
    end

    def show
        player = Player.find(params[:id])

        render json: player 
    end 

    def create
        player = Player.new(player_params)
        if player.save 
            render json: player 
        else
            render json: {status: 500, message: "Player could not be created"}
        end 
    end

    def update
        player = Player.find(params[:id])

        if player.update(player_params)
            render json: player
        else
            render json: {status: 500, message: "Player could not be updated"}
        end 
    end 
    
    def destroy
        player = Player.find(params[:id])

        if player.destroy 
            render json: player.id
        else
            render json: {status: 500, message: "Player could not be deleted"}
        end
    end 

    
    private
        def player_params
            params.require(:player).permit(:name, :position)
        end

end


