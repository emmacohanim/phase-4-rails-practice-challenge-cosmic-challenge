class PlanetsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found

def index
    @planets = Planet.all
    render json: @planets
end

end
