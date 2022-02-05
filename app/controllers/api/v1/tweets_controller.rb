module Api
  module V1
    class TweetsController < BaseController
      before_action :validate_schema!, only: :create

      schema(:create) do
        required(:user).filled(:string)
        required(:token).filled(:string)
        required(:lat).filled(:string)
        required(:long).filled(:string)
      end

      def create

      end
    end
  end
end
