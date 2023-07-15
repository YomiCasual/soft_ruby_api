class AnalysisRepresenter
    attr_reader :analysis

    def initialize(analysis )
        @analysis = analysis
    end

    def as_json
        if analysis.respond_to?(:each)
            analysis.map {  |a| convert_json(a) }
        else
            convert_json(analysis)
        end
    end
    
    def as_json_without_player
        if analysis.respond_to?(:each)
            analysis.map {  |a| convert_json(a, include_players: false) }
        else
            convert_json(analysis, include_players: false)
        end
    end
    
    def convert_json(analysis, include_players: true)
       result =  {
            id: analysis.id,
            title: analysis.title,
            description: analysis.description,
            is_hot_news: analysis.is_hot_news,
        }

        if include_players
            result[:players] = PlayerRepresenter.new(analysis.players).as_json_without_analysis
        end
        result
    end


end