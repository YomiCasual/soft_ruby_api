class V1::PlayerController < ApplicationController

    before_action :get_player, only: [:show, :destroy, :update]

    def index
        players = Player.all
        api_response(data: sanitized_array_player(players) , message: "Successfully fetched players" )
    end

    def show
        return api_response(data: PlayerRepresenter.new(@player).as_json , message: "Successfully fetched player" )
    end


    def update
        begin
            @player.update!(update_player_params)
            @player = Player.find(params[:id])
            return api_response(data: PlayerRepresenter.new(@player).as_json , message: "Successfully updated player" )
        rescue => exception
            return api_response( message: exception )
        end
    end

    def destroy
        begin
            @player.destroy
            return api_response( message: "Player deleted successfully" )
        rescue => exception
            return api_response( 
                message: exception, status: :bad_request )
        end
    end
    
    def create
        @player = Player.create(player_params)
        
        if @player.valid?
           return api_response(data: PlayerRepresenter.new( @player).as_json, message: "Successfully created player", status: :created )
        else
            return api_response(data: @player.errors.messages , 
                message: "Error creating player", status: :bad_request )
        end
    end


    private
    def sanitized_array_player(players)
        players.map {
            |data| PlayerRepresenter.new(data).as_json
        }
    end

    def get_player 
        begin
            @player = Player.find( params[:id])
        rescue ActiveRecord::RecordNotFound
            return api_response(data: "Record does not exist" , 
                message: "Error getting player", status: :bad_request )
        rescue => exception
            return api_response( 
                message: exception, status: :bad_request)
        end
    end

    def player_params
        params.require(:player).permit(:first_name, :last_name, :rotowire_id)
    end
    def update_player_params
        params.require(:player).permit(:first_name, :last_name)
    end
end