class AnalysisRepresenter
    attr_reader :analysis

    def initialize(analysis)
        @analysis = analysis
    end

    def as_json
        {
            id: analysis.id,
            title: analysis.title,
            description: analysis.description,
            is_hot_news: analysis.is_hot_news
        }
    end
end