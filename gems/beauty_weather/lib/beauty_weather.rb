require "httparty"

require_relative 'beauty_weather/configuration'
require_relative 'beauty_weather/version'
require_relative 'beauty_weather/client'
require_relative 'beauty_weather/weather'
require_relative 'beauty_weather/forecast'
require_relative 'beauty_weather/error'

module BeautyWeather
  class << self
    extend Forwardable

    attr_accessor :configuration

    def_delegators :configuration, :api_key, :uri

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset_configuration!
      self.configuration = Configuration.new
    end

    def weather(params = {})
      @weather = Weather.new(city_id: params[:city_id])

      @weather.weather
    end

    def forecast(params = {})
      @forecast = Forecast.new(city_id: params[:city_id])

      @forecast.forecast
    end
  end
end
