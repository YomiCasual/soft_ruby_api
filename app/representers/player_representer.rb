class PlayerRepresenter
    attr_reader :player

    def initialize(player)
        @player = player
    end

    def as_json
        if player.respond_to?(:each)
            player.map {  |a| convert_json(a) }
        else
            convert_json(player)
        end
    end

    def as_json_without_analysis
        if player.respond_to?(:each)
            player.map {  |a| convert_json(a, include_analysis: false) }
        else
            convert_json(player, include_analysis: false)
        end
    end

    def convert_json(player, include_analysis: true)
       result =  {
            id: player.id,
            first_name: player.first_name,
            last_name: player.last_name,
            rotowire_id: player.rotowire_id,
        }
        if include_analysis
            result[:analysis] =  AnalysisRepresenter.new(player.analysis).as_json_without_player
        end
        result
    end
end