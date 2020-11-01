class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
      end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        #doesnt get created and updated out of associated models
        render json: sighting, except: [:created_at, :updated_at], include: [:bird, :location]
    end
end
