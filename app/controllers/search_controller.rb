class SearchController < ApplicationController
  def index
    query = params[:search]

    base_query = Terrace.
        where(location: query[:location]).
        where('capacity >= ?', query[:persons])

    @terraces = query[:dates].each_with_index.inject(base_query) do |query, (date,i)|
      base_query.
          joins("inner join availabilities as a#{i} on a#{i}.terrace_id = terraces.id").
          where(:"a#{i}" => {date: Date.parse(date)})
    end.uniq
  end
end