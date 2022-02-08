module Api
  module V1
    class TweetsController < BaseController
      before_action :validate_schema!, only: :create

      schema(:create) do
        required(:twitter).hash do
          required(:user).filled(:string)
          required(:token).filled(:string)
        end
        required(:city_id).filled(:string)
      end

      def create
        ForecastTweetCreatorJob.perform_later safe_params.to_h

        render json: { status: 201, message: 'Success! Tweet scheduled.' }
      end
    end
  end
end
