class ScientistsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotFound, with: :not_found
    # rescue statements and methods can live in application controller to simplify code
        # use e.model to pull model name 

def create
    scientist = Scientist.create!(scientist_params)
    render json: scientist, status: :created
end

def update
    scientist = Scientist.find(params[:id])
    scientist.update!(scientist_params)
    render json: scientist, status: :accepted
end

def destroy
    scientist = Scientist.find(params[:id]).destroy!
    head :no_content
end

def index
    scientists = Scientist.all
    render json: scientists
end

def show
    scientist = Scientist.find(params[:id])
    render json: scientist, serializer: ScientistPlanetSerializer
end

private

def scientist_params
    params.permit(:name, :field_of_study, :avatar)
end

def invalid(e)
    render json: { "errors": e.record.errors.full_messages}, status: :unprocessable_entity
end

def not_found
    render json: { "error": "Scientist not found" }, status: :not_found
end

end
