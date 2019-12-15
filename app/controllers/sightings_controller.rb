class SightingsController < ApplicationController
  def show
    @sighting = Sighting.find(params[:id])
    render json: SightingSerializer.new(sighting)
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end
end