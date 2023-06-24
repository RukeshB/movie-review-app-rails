# frozen_string_literal: true

module Movies
  class Find
    attr_reader :scope, :params

    def initialize(scope, params)
      @scope = scope
      @search_query = params[:search_query]
      @sort_by = params[:sort_by_release_date]
    end

    def execute
      movies = filter_by_name(@scope)
      sort_by_release_date(movies)
    end

    private

    def filter_by_name(movies)
      return movies.where(['name LIKE ?', "%#{@search_query}%"]) unless @search_query.nil?

      movies
    end

    def sort_by_release_date(movies)
      return movies.order(release_date: @sort_by) if %w[asc desc].include?(@sort_by)

      movies
    end
  end
end
