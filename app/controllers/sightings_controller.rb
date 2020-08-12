class SightingsController < ApplicationController

    def index
        sighting = Sighting.all
        render json: sighting, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, include: {
                bird: {
                    only: [:name, :species]
                },
                location: {
                    only: [:latitude, :longitude]
                }
            }, except: [:created_at, :updated_at]
        else
            render json: {message: 'No birb here'}
        end
    end
end
