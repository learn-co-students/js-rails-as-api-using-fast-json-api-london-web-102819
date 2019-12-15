class SightingsController < ApplicationController
=begin  
  def show
    @sighting = Sighting.find(params[:id])
    render json: @sighting.to_json(
      :include => {
        :bird => {:only =>[:name, :species]}, 
        :location => {:only =>[:latitude, :longitude]}
        }, 
        :except => [:updated_at])
  end
=end

  def show
    sighting = Sighting.find(params[:id])
    # render json: SightingSerializer.new(sighting)
=begin
Setting these relationships up in SightingSerializer is necessary for the second step. 
Now that we have included relationships connecting the SightingSerializer to :bird and :location, 
to include attributes from those objects, 
the recommended method is to pass in a second options parameter to the serializer indicating that we want to include those objects:
=end   
    options = {
      include: [:bird, :location]
    }

    render json: SightingSerializer.new(sighting, options)
=begin
👆Because we have a BirdSerializer and a LocationSerializer, 
when including :bird and :location, 
Fast JSON API will automatically serialize their attributes as well.   
=end
  end
  
  def index  
    sightings = Sighting.all 
    render json: SightingSerializer.new(sightings)
  end
end