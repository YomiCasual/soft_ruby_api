class V1::AnalysisController < ApplicationController

    before_action :get_analysis, only: [:show, :destroy, :update]

    def index
        @analysis = Analysis.all
        api_response(data: AnalysisRepresenter.new(@analysis).as_json , message: "Successfully fetched analysis" )
    end

    def show
        return api_response(data: AnalysisRepresenter.new(@analysis).as_json , message: "Successfully fetched analysis" )
    end


    def update
        begin
            @analysis.update!(update_params)
            @analysis = Analysis.find(params[:id])
            return api_response(data: AnalysisRepresenter.new(@analysis).as_json , message: "Successfully updated analysis" )
        rescue => exception
            return api_response( message: exception )
        end
    end

    def destroy
        begin
            @analysis.destroy
            return api_response( message: "Analysis deleted successfully" )
        rescue => exception
            return api_response( 
                message: exception, status: :bad_request )
        end
    end
    
    def create
        @analysis = Analysis.create(analysis_params)
        
        if @analysis.valid?
           return api_response(data: AnalysisRepresenter.new( @analysis).as_json, message: "Successfully created analysis", status: :created )
        else
            return api_response(data: @analysis.errors.messages , 
                message: "Error creating analysis", status: :bad_request )
        end
    end


    private

    def get_analysis 
        begin
            @analysis = Analysis.find( params[:id])
        rescue ActiveRecord::RecordNotFound
            return api_response(data: "Record does not exist" , 
                message: "Error getting analysis", status: :bad_request )
        rescue => exception
            return api_response( 
                message: exception, status: :bad_request)
        end
    end

    def analysis_params
        # params.require(:analysis).permit( :player_ids => [])
        params.require(:analysis).permit(:title, :is_hot_news, :description, :long_description, :player_ids => [])
    end
    def update_params
        params.permit(:title, player_ids: [])
    end
end