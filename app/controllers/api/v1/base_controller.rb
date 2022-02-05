# frozen_string_literal: true

module Api
  module V1
    class BaseController < ::ApplicationController
      protected

      def validate_schema!
        if safe_params && safe_params.failure?
          render_unprocessable_entity
        end
      end

      def render_unprocessable_entity
        error = { error: { message: 'Unprocessable' } }

        render json: error, status: :unprocessable_entity
      end
    end
  end
end
