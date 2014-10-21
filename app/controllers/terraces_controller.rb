class TerracesController < ApplicationController
  def index
    @terraces = Terrace.all.paginate(:page => params[:page])
    render 'search/index'
  end

  def new
    permitted = params.permit(terrace: [:location, :capacity])[:terrace]
    @terrace = Terrace.new(permitted)
    @terrace.build_owner
    params[:terrace][:dates].each do |date|
      @terrace.availabilities.build(date: Date.parse(date))
    end
  end

  def create
    Terrace.create(params[:terrace]
                   .permit(:location, :capacity, :area, :rent, :image,
                            owner_attributes: [:name, :phone],
                            availabilities_attributes: [:date]
                           ))

    redirect_to(terraces_path)
  end
end
