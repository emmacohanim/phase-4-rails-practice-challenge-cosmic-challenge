class MissionsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    def not_unique
        render json: { "error": "Scientists cannot join the same mission twice"}, status: :unprocessable_entity
    end

    def invalid(e)
        render json: { "errors": e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
